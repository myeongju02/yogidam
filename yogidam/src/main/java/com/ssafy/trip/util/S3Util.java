package com.ssafy.trip.util;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class S3Util {

    private final AmazonS3Client amazonS3Client;

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    // MultipartFile을 S3에 업로드하고 public URL 반환
    public String upload(MultipartFile multipartFile, String dirName) throws IOException {
        File uploadFile = convert(multipartFile)
                .orElseThrow(() -> new IllegalArgumentException("MultipartFile -> File 변환 실패"));
        String fileName = dirName + "/" + UUID.randomUUID() + "_" + uploadFile.getName();
        String uploadImageUrl = putS3(uploadFile, fileName);
        removeNewFile(uploadFile);
        return uploadImageUrl;
    }

    private String putS3(File uploadFile, String fileName) {
        amazonS3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile));
        return amazonS3Client.getUrl(bucket, fileName).toString();
    }

    private void removeNewFile(File targetFile) {
        if (targetFile.delete()) {
            // 파일 삭제 성공
        }
    }

    private Optional<File> convert(MultipartFile file) throws IOException {
        String prefix = "upload-";
        String suffix = "-" + UUID.randomUUID() + "_" + file.getOriginalFilename().replaceAll("[^a-zA-Z0-9.]", "_");
        File tempFile = File.createTempFile(prefix, suffix);

        try (FileOutputStream fos = new FileOutputStream(tempFile)) {
            fos.write(file.getBytes());
        }
        return Optional.of(tempFile);
    }

	public void delete(String imageUrlToDelete) {
		if (imageUrlToDelete == null || imageUrlToDelete.isEmpty()) return;
		String bucketUrl = amazonS3Client.getUrl(bucket, "").toString(); 
		String key = imageUrlToDelete.replace(bucketUrl, "");
	    if (key.startsWith("/")) key = key.substring(1); // 앞의 / 제거

	    try {
	        amazonS3Client.deleteObject(new DeleteObjectRequest(bucket, key));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
