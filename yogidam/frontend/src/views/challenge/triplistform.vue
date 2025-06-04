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
    <header data-id="RyhT" class="mb-8">
      <h1 data-id="Pgix" class="text-3xl font-bold text-gray-800 mb-2">여행 버킷리스트</h1>
      <p data-id="Q6j-" class="text-gray-600">다음 여행지로 어디를 갈지 계획해보세요.</p>
    </header>
    <div v-if="myPlans.length === 0" class="text-gray-500 text-center py-8">
      등록된 여행 계획이 없습니다.
    </div>

    <div data-id="c8qC" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <router-link :to="`/challenge/triplist/${plan.planId}`"
        v-for="plan in myPlans"
        :key="plan.plan_id"
        data-id="0FDv"
        class="h-24 bg-primary-200 rounded-full flex items-center justify-center mb-4 hover:bg-primary-200 transition-colors"
        >
        <div data-id="HuxD" class="flex justify-between items-start mb-4">
          <h2 data-id="hNlO" class="text-xl font-semibold text-gray-800">{{ plan.title }}</h2>
          
        </div>
        <div data-id="048Q" class="flex justify-between items-center">
        </div>
      </router-link>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

const myPlans = ref([]);

async function fetchMyPlans() {
  return axios.get("/api/challenge/triplist");
}

onMounted(async () => {
  const res = await fetchMyPlans();
  myPlans.value = res.data;
});
</script>
