<template>
    <div id="webcrumbs">
        <div class="min-h-screen p-6">
            <div class="max-w-7xl mx-auto">
                <header class="mb-8">
                    <div class="flex flex-col md:flex-row justify-between items-center gap-4">
                        <div>
                            <h1 class="text-2xl md:text-3xl font-bold text-gray-800">
                                새 글 작성
                            </h1>
                            <p class="text-gray-500 mt-1">당신의 여행 경험을 작성하세요.</p>
                        </div>
                        <div class="flex items-center gap-3">
                            <div class="relative inline-block">
                                <button
                                    class="p-2.5 rounded-lg bg-white shadow-sm border border-gray-200 hover:bg-gray-50 transition-colors duration-200 group">
                                    <span class="material-symbols-outlined text-gray-500">
                                        save
                                    </span>
                                    <span
                                        class="absolute invisible group-hover:visible opacity-0 group-hover:opacity-100 transition-all duration-200 whitespace-nowrap bg-gray-800 text-white text-xs rounded py-1 px-2 -top-8 left-1/2 transform -translate-x-1/2 after:content-[&#x27;&#x27;] after:absolute after:top-full after:left-1/2 after:-translate-x-1/2 after:border-4 after:border-transparent after:border-t-gray-800">
                                        임시저장
                                    </span>
                                </button>
                            </div>
                            <div class="relative inline-block">
                                <button
                                    class="p-2.5 rounded-lg bg-white shadow-sm border border-gray-200 hover:bg-gray-50 transition-colors duration-200 group">
                                    <span class="material-symbols-outlined text-gray-500">
                                        publish
                                    </span>

                                    <span
                                        class="absolute invisible group-hover:visible opacity-0 group-hover:opacity-100 transition-all duration-200 whitespace-nowrap bg-gray-800 text-white text-xs rounded py-1 px-2 -top-8 left-1/2 transform -translate-x-1/2 after:content-[&#x27;&#x27;] after:absolute after:top-full after:left-1/2 after:-translate-x-1/2 after:border-4 after:border-transparent after:border-t-gray-800">
                                        내보내기
                                    </span>
                                </button>
                            </div>

                        </div>
                    </div>
                </header>
                <div class="grid grid-cols-1 gap-6 mb-8">
                    <div
                        class="bg-white rounded-xl p-6 shadow-md border border-gray-100 hover:shadow-lg transition-shadow duration-300">
                        <input type="text" placeholder="제목을 입력하세요" v-model="title"
                            class="w-full text-3xl font-bold mb-4 border-0 focus:outline-none focus:ring-0 placeholder-gray-300" />
                        <div class="flex items-center gap-2 mb-4 pb-2 border-b border-gray-200 overflow-x-auto">
                            <button @click="format('bold')"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">format_bold</span>
                            </button>
                            <button @click="format('italic')"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">format_italic</span>
                            </button>
                            <button @click="format('underline')"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">format_underlined</span>
                            </button>
                            <div class="h-6 w-px bg-gray-200 mx-1"></div>
                            <button @click="format('insertUnorderedList')"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200">
                                <span class="material-symbols-outlined text-gray-600">format_list_bulleted</span>
                            </button>
                            <button @click="format('insertOrderedList')"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">format_list_numbered</span>
                            </button>
                            <div class="h-6 w-px bg-gray-200 mx-1"></div>
                            <button @click="insertLink"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">insert_link</span>
                            </button>
                            <button @click="insertImage"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">image</span>
                            </button>
                            <button @click="insertFile"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">attach_file</span>
                            </button>
                            <div class="h-6 w-px bg-gray-200 mx-1"></div>
                            <button @click="format('formatBlock', 'pre')"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">code</span>
                            </button>
                            <button @click="format('formatBlock', 'blockquote')"
                                class="p-2 rounded-lg hover:bg-gray-100 transition-colors duration-200 hover:text-primary-500">
                                <span class="material-symbols-outlined text-gray-600">format_quote</span>
                            </button>
                        </div>
                        <div class="min-h-[400px]">
                            <textarea iv v-model="content"
                                class="w-full h-full min-h-[400px] resize-none border-0 focus:outline-none focus:ring-0 placeholder-gray-300 transition-all duration-300 hover:placeholder-gray-400 focus:placeholder-transparent"
                                placeholder="본문 내용을 작성하세요">

                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                    <div
                        class="lg:col-span-2 bg-white rounded-xl shadow-md border border-gray-100 overflow-hidden hover:shadow-lg transition-all duration-300">
                        <div class="p-6 border-b border-gray-100">
                            <h2 class="text-xl font-semibold mb-4">Add Media</h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <!-- 이미지 업로드 -->
                                <div class="border-2 border-dashed border-gray-200 rounded-lg p-8 flex flex-col items-center justify-center hover:border-primary-400 hover:bg-gray-50 transition-all duration-300 cursor-pointer transform hover:scale-[1.02] relative"
                                    @click="() => $refs.imageInput.click()" style="min-height:200px">
                                    <span class="material-symbols-outlined text-4xl text-gray-400 mb-2">image</span>
                                    <p class="text-sm text-gray-500 text-center mb-2">
                                        Drag and drop images<br />
                                        or click to browse
                                    </p>
                                    <input ref="imageInput" type="file" accept="image/*" multiple class="hidden"
                                        @change="onImageChange" />
                                    <!-- 썸네일 미리보기 -->
                                    <div v-if="imagePreviews && imagePreviews.length"
                                        class="flex flex-wrap gap-2 mt-4 justify-center">
                                        <div v-for="(src, idx) in imagePreviews" :key="idx"
                                            class="relative w-20 h-20 rounded overflow-hidden border border-gray-200">
                                            <img :src="src" class="object-cover w-full h-full" />
                                            <button @click.stop="removeImage(idx)"
                                                class="absolute top-1 right-1 bg-white bg-opacity-80 rounded-full p-1 hover:bg-red-500 hover:text-white"
                                                title="Remove">
                                                <span class="material-symbols-outlined text-base">close</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- 파일 업로드 -->
                                <div class="border-2 border-dashed border-gray-200 rounded-lg p-8 flex flex-col items-center justify-center hover:border-primary-300 transition-colors duration-200 cursor-pointer relative"
                                    @click="() => $refs.fileInput.click()" style="min-height:200px">
                                    <span
                                        class="material-symbols-outlined text-4xl text-gray-400 mb-2">attach_file</span>
                                    <p class="text-sm text-gray-500 text-center mb-2">
                                        Drag and drop files<br />
                                        or click to browse
                                    </p>
                                    <input ref="fileInput" type="file" multiple class="hidden" @change="onFileChange" />
                                    <ul v-if="files.length" class="mt-4 text-xs text-gray-600">
                                        <li v-for="(file, idx) in files" :key="idx">
                                            {{ file.name }}
                                            <button @click.stop="removeFile(idx)"
                                                class="ml-1 text-red-400 hover:text-red-600" title="Remove">
                                                ×
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div
                        class="bg-white rounded-xl shadow-md border border-gray-100 overflow-hidden hover:shadow-lg transition-all duration-300">
                        <div class="p-6 border-b border-gray-100">
                            <h2 class="text-xl font-semibold mb-4">Post Settings</h2>
                            <div class="space-y-4">
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">
                                        Category
                                    </label>
                                    <select v-model="category"
                                        class="w-full p-2 border border-gray-200 rounded-lg focus:ring-2 focus:ring-primary-300 focus:border-primary-300 focus:outline-none">
                                        <option value="review" selected>여행후기</option>
                                        <option value="question">질문</option>
                                        <option value="recommend">추천</option>
                                    </select>
                                </div>
                                <div class="pt-4">
                                    <button @click="publishPost"
                                        class="w-full px-4 py-2 rounded-lg bg-primary-500 text-white hover:bg-primary-600 transition-all duration-200 shadow-sm hover:shadow-md transform hover:translate-y-[-2px]">
                                        Publish Post
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>



<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const title = ref('')
const content = ref('')
const category = ref('review')
const images = ref([]) // 이미지 파일 배열
const files = ref([])  // 첨부파일 배열
const imageInput = ref(null)
const fileInput = ref(null)
const router = useRouter()
const imagePreviews = ref([])

// 이미지 파일 핸들러
function onImageChange(e) {
    const selectedFiles = Array.from(e.target.files)
    images.value = selectedFiles
    // 미리보기 생성
    imagePreviews.value = selectedFiles.map(file => URL.createObjectURL(file))
}

// 이미지 삭제
function removeImage(idx) {
    images.value.splice(idx, 1)
    imagePreviews.value.splice(idx, 1)
}
// 파일 핸들러
function onFileChange(e) {
    files.value = Array.from(e.target.files)
}

// 파일 삭제
function removeFile(idx) {
    files.value.splice(idx, 1)
}

async function publishPost() {
    // FormData로 파일 포함 데이터 생성
    const formData = new FormData()
    formData.append(
        "board",
        new Blob([JSON.stringify({
            title: title.value,
            content: content.value,
            category: category.value,
        })], { type: "application/json" })
    );

    for (const image of images.value) {
        if (image && image.size > 0) {
            formData.append("images", image);
        }
    }
    for (const file of files.value) {
        if (file && file.size > 0) {
            formData.append("files", file);
        }
    }

    try {
        await axios.post('/api/boards', formData);
        // 성공 시 목록 등으로 이동
        router.push('/community')
    } catch (error) {
        alert('게시글 등록 실패' + error.message)
    }
}


//툴바 기능 구현

// 선택 영역에 포맷 삽입 함수
function format(tag) {
    const textarea = document.querySelector('textarea')
    const start = textarea.selectionStart
    const end = textarea.selectionEnd
    const selected = content.value.slice(start, end)
    let before = content.value.slice(0, start)
    let after = content.value.slice(end)
    // 예시: **굵게**
    let insert = ''
    if (tag === 'bold') insert = `**${selected}**`
    if (tag === 'italic') insert = `*${selected}*`
    if (tag === 'underline') insert = `<u>${selected}</u>`
    // ... 기타 포맷 추가
    content.value = before + insert + after
    // 선택 영역 복원
    setTimeout(() => {
        textarea.focus()
        textarea.setSelectionRange(start, start + insert.length)
    }, 0)
}
</script>
