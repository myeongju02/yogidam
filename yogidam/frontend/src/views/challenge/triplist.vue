<template>
  <div id="webcrumbs">
    <div class="flex justify-center mb-8">
      <div class="flex rounded-full bg-white shadow-md p-1">
        <router-link
          to="/challenge/stampform"
          class="px-6 py-3 rounded-full transition-all hover:bg-gray-100"
        >
          <span class="flex items-center gap-2">
            <span class="material-symbols-outlined">local_activity</span> 스탬프 챌린지
          </span>
        </router-link>
        <router-link
          to="/challenge/triplistform"
          class="px-6 py-3 rounded-full bg-[#AA52AA] text-white shadow-lg transition-all hover:bg-[#954795] transform hover:scale-105"
        >
          <span class="flex items-center gap-2">
            <span class="material-symbols-outlined">map</span> 여행지 리스트 챌린지
          </span>
        </router-link>
      </div>
    </div>
    <h1 v-if="plan.title" class="text-3xl font-bold text-center mb-8 border-b pb-4 text-[#AA52AA]">
      {{ plan.title }}
    </h1>
    <h1 v-else>여행 계획 정보를 불러올 수 없습니다.</h1>
    <div>
      <div class="w-full bg-gray-200 h-4 rounded-full overflow-hidden">
        <div
          class="bg-primary-500 h-full rounded-full transition-all duration-500 ease-in-out"
          :style="{ width: progressPercent + '%' }"
        ></div>
      </div>
      <div class="text-right text-xs font-bold mt-1 text-primary-500">{{ progressPercent }}%</div>
      <div class="flex justify-between mt-2 text-sm text-gray-600">
        <span v-if="userRecords.length < totalMissions">진행 중</span>
        <span v-else>완료</span>
        <span>{{ userRecords.length }}/{{ totalMissions }} 완료됨</span>
      </div>
    </div>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div
        v-for="item in attractions"
        :key="item.planAttractionId"
        class="bg-gray-50 rounded-xl overflow-hidden shadow-md transition-all hover:shadow-lg hover:translate-y-[-5px]"
      >
        <div class="h-48 overflow-hidden relative group">
          <!-- 미리보기 이미지 -->
          <img
            v-if="imageUrls[item.planAttractionId] || item.imageUrl"
            :src="imageUrls[item.planAttractionId] || item.imageUrl"
            alt="Challenge location"
            class="w-full h-full object-cover"
          />
          <!-- 사진이 없을 때: 안내 문구/아이콘 (클릭 가능하게) -->
          <div
            v-else
            class="flex flex-col items-center justify-center w-full h-full text-gray-400 cursor-pointer"
            @click="onEditClick(item.planAttractionId)"
          >
            <span class="material-symbols-outlined text-6xl mb-2">add_a_photo</span>
            <span>사진을 선택하세요</span>
          </div>
          <!-- edit 버튼 (이미지 위에 뜨게) -->
          <button
            v-if="imageUrls[item.planAttractionId]"
            class="absolute bottom-2 right-2 bg-white text-gray-800 p-2 rounded-full shadow group-hover:opacity-100 opacity-80 transition"
            @click="onEditClick(item.planAttractionId)"
            type="button"
          >
            <span class="material-symbols-outlined">edit</span>
          </button>
          <!-- 파일 input (숨김) -->
          <input
            :ref="(el) => setFileInputRef(item.planAttractionId, el)"
            type="file"
            accept="image/*"
            class="hidden"
            @click="$event.target.value = ''"
            @change="(event) => uploadPhoto(event, item)"
          />
        </div>
        <div class="p-4">
          <div class="flex justify-between items-center mb-2">
            <h3 class="font-bold text-xl">{{ item.attractionTitle }}</h3>
          </div>
          <button
            @click="() => saveRecord(item)"
            class="flex items-center gap-1 bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition-colors duration-300 shadow-md hover:shadow-lg"
          >
            <span>저장하기</span>
            <span class="material-symbols-outlined">save</span>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, watch } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";

const route = useRoute();
const plan = ref({});
const attractions = ref([]);

// 카드별 이미지 상태
const imageUrls = ref({});
const fileInputs = ref({});

// 포인트 관리
const pointGiven = ref(false);

// 전체 미션 개수
const totalMissions = computed(() => attractions.value.length);
// 완료된 미션 개수 (예: imageUrl이 있으면 완료)
const userRecords = computed(() => attractions.value.filter((item) => item.imageUrl));

const progressPercent = computed(() => {
  if (totalMissions.value === 0) return 0;
  return Math.round((userRecords.value.length / totalMissions.value) * 100);
});

function setFileInputRef(id, el) {
  if (el) fileInputs.value[id] = el;
}

function onEditClick(planAttractionId) {
  fileInputs.value[planAttractionId]?.click();
}

async function uploadPhoto(event, item) {
  const file = event.target.files[0];
  if (!file) {
    alert("파일이 선택되지 않았습니다.");
    return;
  }
  const formData = new FormData();
  formData.append("file", file);
  formData.append("planAttractionId", item.planAttractionId);

  try {
    const res = await axios.post("/api/challenge/listupload", formData);
    const s3Url = res.data.imageUrl; // S3에서 받은 진짜 URL
    imageUrls.value[item.planAttractionId] = s3Url;
  } catch (err) {
    alert("이미지 업로드 실패");
    console.error(err);
  }
  event.target.value = "";
}

async function saveRecord(item) {
  try {
    // 예시: 서버에 이미지 URL과 planAttractionId 저장
    await axios.post("/api/challenge/save", {
      planAttractionId: item.planAttractionId,
      imageUrl: imageUrls.value[item.planAttractionId],
    });
    item.imageUrl = imageUrls.value[item.planAttractionId];

    alert("저장되었습니다!");
  } catch (err) {
    alert("저장 실패");
    console.error(err);
  }
}

// 진척도 100% 달성 감지
watch(progressPercent, async (newVal, oldVal) => {
  if (progressPercent.value === 100) {
    await axios.post("/api/challenge/listcomplete", {
      userId: plan.value.userId,
    });
  }
});

onMounted(async () => {
  const planId = route.params.planId;
  try {
    const planRes = await axios.get(`/api/challenge/plan/${planId}`);
    plan.value = planRes.data;
  } catch (err) {
    console.error("Plan API 오류:", err);
  }

  try {
    const attres = await axios.get(`/api/challenge/triplistdetail/${planId}`);
    attractions.value = attres.data;
    attres.data.forEach((item) => {
      if (item.imageUrl) {
        imageUrls.value[item.planAttractionId] = item.imageUrl;
      }
    });
  } catch (err) {
    console.log(err);
  }
});
</script>
