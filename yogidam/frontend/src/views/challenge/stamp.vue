<template>
  <div id="webcrumbs">
    <div class="w-[1024px] p-6 bg-white rounded-xl shadow-lg font-sans">
      <header class="mb-8">
        <div v-if="mission">
          <h1 class="text-3xl font-bold mb-2">{{ mission.mission_id }}</h1>
          <h2 class="text-xl whitespace-pre-line">{{ mission.description }}</h2>
          <br />
        </div>
        <div class="w-full bg-gray-200 h-4 rounded-full overflow-hidden">
          <!-- 예를 들어 전체 미션이 10개라면 -->
          <div
            class="bg-primary-500 h-full rounded-full transition-all duration-500 ease-in-out"
            :style="{ width: (userRecords.length / 10) * 100 + '%' }"
          ></div>

          <div class="text-right text-xs font-bold mt-1 text-primary-500">
            {{ progressPercent }}%
          </div>
        </div>
        <div class="flex justify-between mt-2 text-sm text-gray-600">
          <span v-if="userRecords.length < 10">진행 중</span>
          <span v-else>완료</span>
          <span>{{ userRecords.length }}/10 완료됨</span>
        </div>
      </header>
      <div class="space-y-6">
        <div v-if="userRecords.length > 0" class="space-y-4">
          <div
            v-for="record in userRecords"
            :key="record.userMissionId"
            class="bg-gray-50 p-4 rounded-lg shadow"
          >
            <div class="flex gap-4">
              <img v-if="record.proof" :src="record.proof" class="w-32 h-32 object-cover rounded" />
              <div>
                <div class="font-bold">{{ record.place }}</div>
                <div class="text-gray-600">{{ record.content }}</div>
              </div>
            </div>
            <button
              class="text-gray-500 hover:text-red-500 transition-colors duration-300 p-1 rounded-full hover:bg-red-50"
              @click="deleteRecord(record.userMissionId)"
              type="button"
            >
              <span class="material-symbols-outlined">delete</span>
            </button>
          </div>
        </div>
        <div v-else class="text-gray-400 text-center py-8">아직 작성한 글이 없습니다.</div>

        <div
          class="bg-gray-50 p-4 rounded-lg shadow hover:shadow-md transition-shadow duration-300 group"
        >
          <div class="flex flex-col md:flex-row gap-4">
            <div class="md:w-1/4 relative">
              <div
                class="bg-gray-200 h-48 rounded-lg overflow-hidden group-hover:opacity-90 transition-opacity duration-300 flex items-center justify-center"
              >
                <!-- 사진이 선택된 경우: 미리보기 이미지 -->
                <img
                  v-if="imageUrl"
                  :src="imageUrl"
                  alt="Challenge location"
                  class="w-full h-full object-cover"
                />
                <!-- 사진이 없을 때: 안내 문구/아이콘 -->
                <div
                  v-else
                  class="flex flex-col items-center justify-center w-full h-full text-gray-400"
                >
                  <span class="material-symbols-outlined text-6xl mb-2">add_a_photo</span>
                  <span>사진을 선택하세요</span>
                </div>

                <!-- edit 버튼과 파일 input은 동일하게 유지 -->
                <div
                  class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition-all duration-300 flex items-center justify-center"
                >
                  <button
                    class="bg-white text-gray-800 p-2 rounded-full opacity-0 group-hover:opacity-100 transform translate-y-4 group-hover:translate-y-0 transition-all duration-300"
                    @click="onEditClick"
                    type="button"
                  >
                    <span class="material-symbols-outlined">edit</span>
                  </button>
                  <input
                    ref="fileInput"
                    type="file"
                    accept="image/*"
                    class="hidden"
                    @change="onFileChange"
                  />
                </div>
              </div>
            </div>

            <div class="md:w-3/4">
              <div class="flex justify-between items-start mb-3">
                <input
                  v-model="place"
                  type="text"
                  class="text-xl font-semibold bg-transparent border-b-2 border-transparent focus:border-primary-300 focus:outline-none transition-colors duration-300 w-full"
                  placeholder="여행 장소를 적어보세요"
                />
              </div>
              <textarea
                class="w-full min-h-[100px] p-2 bg-white border border-gray-200 rounded-md focus:border-primary-400 focus:outline-none transition-colors duration-300"
                v-model="content"
                placeholder="남기고 싶은 내용을 작성해보세요.."
              ></textarea>
              <div class="flex justify-end mt-2 gap-2">
                <div class="flex items-center gap-1"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="mt-10 flex justify-end items-center">
        <button
          @click="saveRecord"
          class="flex items-center gap-1 bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition-colors duration-300 shadow-md hover:shadow-lg"
        >
          <span>저장하기</span> <span class="material-symbols-outlined">save</span>
        </button>
      </footer>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";

// 기존 변수
const userData = localStorage.getItem("user");
const mission = ref(null);
const route = useRoute();
const place = ref("");
const content = ref("");

// 이미지 관련 변수
const imageUrl = ref(null);
const imageFile = ref(null);
const fileInput = ref(null);

// 리스트 변수
const userRecords = ref([]);
const userId = JSON.parse(userData).id;
const type = route.params.type;

// 파일 선택창 열기
function onEditClick() {
  fileInput.value.click();
}

// 파일 선택 시 미리보기 변경
function onFileChange(event) {
  const file = event.target.files[0];
  if (file) {
    imageFile.value = file;
    imageUrl.value = URL.createObjectURL(file);
  }
}

// 이미지 업로드 (S3)
async function uploadImage() {
  if (!imageFile.value) return null;
  const formData = new FormData();
  formData.append("file", imageFile.value);
  const response = await axios.post("/api/challenge/upload", formData, {
    headers: { "Content-Type": "multipart/form-data" },
  });
  // S3 URL 반환
  return response.data;
}

// 저장하기
const saveRecord = async () => {
  if (!imageFile.value) {
    alert("사진을 반드시 첨부해야 합니다.");
    return;
  }

  let user_id = null;
  if (userData) {
    try {
      user_id = JSON.parse(userData).id;
    } catch (e) {
      user_id = null;
    }
  }

  let proofUrl = null;
  if (imageFile.value) {
    proofUrl = await uploadImage();
  }

  const payload = {
    userId: user_id,
    type: mission.value.type,
    place: place.value,
    content: content.value,
    proof: proofUrl,
  };

  try {
    await axios.post("/api/challenge/record", payload, {
      headers: { "Content-Type": "application/json" },
    });
    alert("저장 완료");
    await fetchUserRecords(); // 저장 후 목록 다시 불러오기!
    // 입력값 초기화(선택)
    place.value = "";
    content.value = "";
    imageUrl.value = null;
    imageFile.value = null;
  } catch (e) {
    alert("저장 실패 " + e);
  }
};

// 저장 후 리로드
async function fetchUserRecords() {
  if (!userId || !type) return;
  const response = await axios.get(`/api/challenge/stamplist`, {
    params: { userId, type },
  });
  userRecords.value = response.data;
}

async function deleteRecord(id) {
  console.log("삭제 id:", id);
  if (!confirm("정말 삭제하시겠습니까?")) return;
  try {
    await axios.delete(`/api/challenge/record/${id}`);
    await fetchUserRecords(); // 삭제 후 목록 갱신
    alert("삭제 완료");
  } catch (e) {
    alert("삭제 실패: " + e);
  }
}

// 미션 정보 불러오기
onMounted(async () => {
  //const type = route.params.type;
  // 저장 용
  const response = await axios.get(`/api/challenge/stamp/${type}`);
  mission.value = response.data;

  // 불러오기 용
  const response2 = await axios.get(`/api/challenge/stamplist`, {
    params: { userId, type },
  });
  //userRecords.value = response2.data;

  await fetchUserRecords();
});

// 미션 당 업로드 개수
const progressPercent = computed(() => {
  if (!mission.value || !mission.value.totalCount) return 0;
  return Math.round((userRecords.value.length / mission.value.totalCount) * 100);
});
</script>
