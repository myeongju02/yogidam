<template>
  <div id="webcrumbs">
    <div class="w-[1024px] p-6 mx-auto font-sans bg-gradient-to-br from-gray-50 to-gray-100 rounded-xl shadow-lg">
      <div class="flex flex-col lg:flex-row gap-8">
        <div class="lg:w-1/3">
          <div class="bg-white rounded-xl shadow-md p-6 mb-6 transition-all duration-300 hover:shadow-lg">
            <div class="flex flex-col items-center" v-if="user">
              <div class="relative group">
                <div class="w-32 h-32 rounded-full overflow-hidden border-4 border-primary-300 shadow-md">
                  <img :src="profileImg" alt="Profile" class="w-full h-full object-cover"
                    keywords="profile, user, avatar, person" />
                </div>
                <div class="absolute bottom-0 right-0"></div>
              </div>
              <h2 class="text-2xl font-bold mt-4">{{ user.nickname }}</h2>
              <p class="text-gray-500 text-sm mb-4">{{ user.email }}</p>
              <div class="bg-primary-50 px-4 py-2 rounded-full text-primary-700 font-medium text-sm">
                {{ user.profileTitle }}
              </div>
            </div>
          </div>
          <div class="bg-white rounded-xl shadow-md p-6 mb-6 transition-all duration-300 hover:shadow-lg">
            <h3 class="text-lg font-bold mb-3 flex items-center">
              <span class="material-symbols-outlined mr-2 text-primary-500">savings</span> 포인트
              현황
            </h3>
            <div v-if="user" class="flex items-center justify-between p-3 bg-gray-50 rounded-lg mb-4">
              <span class="text-gray-600">현재 보유</span>
              <span class="text-xl font-bold text-primary-600">{{ user.point }}P</span>
            </div>
            <h4 class="text-sm font-semibold mb-2 text-gray-600">교환 가능 아이템</h4>
            <div class="grid grid-cols-2 gap-2">
              <div
                class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center">
                <span class="material-symbols-outlined text-2xl text-amber-500 mb-1">redeem</span>
                <p class="text-xs text-center">커피 쿠폰</p>
                <p class="text-xs font-bold">1,000 P</p>
              </div>
              <div
                class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center">
                <span class="material-symbols-outlined text-2xl text-blue-500 mb-1">luggage</span>
                <p class="text-xs text-center">캐리어 태그</p>
                <p class="text-xs font-bold">2,500 P</p>
              </div>
              <div
                class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center">
                <span class="material-symbols-outlined text-2xl text-green-500 mb-1">hotel</span>
                <p class="text-xs text-center">숙박 할인</p>
                <p class="text-xs font-bold">5,000 P</p>
              </div>
              <div
                class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center">
                <span class="material-symbols-outlined text-2xl text-purple-500 mb-1">flight</span>
                <p class="text-xs text-center">항공 마일리지</p>
                <p class="text-xs font-bold">10,000 P</p>
              </div>
            </div>
          </div>
        </div>
        <div class="lg:w-2/3">
          <div class="bg-white rounded-xl shadow-md p-6 mb-6 transition-all duration-300 hover:shadow-lg">
            <h3 class="text-lg font-bold mb-4 flex items-center">
              <span class="material-symbols-outlined mr-2 text-primary-500">workspace_premium</span>
              나의 뱃지
            </h3>
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
              <div v-for="badge in badges" :key="badge.missionId" class="group flex flex-col items-center">
                <div
                  class="w-16 h-16 rounded-full bg-amber-100 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform">
                  <span class="material-symbols-outlined text-3xl text-amber-500">
                    workspace_premium
                  </span>
                </div>
                <p class="text-xs font-medium text-center">{{ badge.missionId }}</p>
              </div>
            </div>
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mt-6">
              <h4 class="col-span-full text-sm font-semibold mb-2 text-gray-600">
                획득 가능한 뱃지
              </h4>
            </div>
          </div>
          <div class="bg-white rounded-xl shadow-md p-6 transition-all duration-300 hover:shadow-lg">
            <h3 class="text-lg font-bold mb-4 flex items-center">
              <span class="material-symbols-outlined mr-2 text-primary-500">manage_accounts</span>
              회원 정보 관리
            </h3>
            <div class="flex justify-center">
              <router-link to="/log/detail"
                class="inline-flex items-center px-6 py-3 bg-primary-500 text-white rounded-lg hover:bg-primary-600 transition-all duration-300 transform hover:scale-105 shadow-md hover:shadow-lg">
                <span class="material-symbols-outlined mr-2">settings</span> 회원 정보 관리 페이지로
                이동 <span class="material-symbols-outlined ml-2">arrow_forward</span>
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from "vue";
import axios from "axios";
import { useUserStore } from "@/stores/user";

const userStore = useUserStore();
const user = computed(() => userStore.user);

const profileImg = computed(() => {
  const profile = user.value?.profile;
  if (profile && profile.trim() !== "") return profile;
  return "https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/defaultprofileImg.png";
});

// ① badges 배열 추가
const badges = ref([]);

// ② onMounted에서 뱃지 목록도 함께 불러오기
onMounted(async () => {
  try {
    const response = await axios.get("/api/mypage/detail", { withCredentials: true });
    userStore.setUser(response.data);

    // 뱃지 목록 불러오기
    const badgeRes = await axios.get("/api/mypage/badges");
    badges.value = badgeRes.data;
  } catch (error) {
    alert("실패 " + error);
  }
});
</script>
