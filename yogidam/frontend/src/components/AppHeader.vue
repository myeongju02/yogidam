<!-- src/components/AppHeader.vue -->
<template>
  <header class="w-[1200px] mx-auto flex justify-between items-center mb-8">
    <div class="flex items-center space-x-2">
      <img :src="logoImg" alt="LogoImage" style="width: 50px; height: 50px" />
      <router-link to="/" class="text-2xl font-bold text-primary-700">여기담</router-link>
    </div>
    <nav class="hidden md:flex items-center space-x-6">
      <router-link to="/" class="font-medium hover:text-primary-600 transition-colors">홈</router-link>
      <router-link to="/challenge/stampform"
        class="font-medium hover:text-primary-600 transition-colors">챌린지</router-link>
      <router-link to="/tour/plan" class="font-medium hover:text-primary-600 transition-colors">여행계획</router-link>
      <router-link to="/community" class="font-medium hover:text-primary-600 transition-colors">커뮤니티</router-link>
    </nav>
    <div class="flex items-center space-x-4">
      <template v-if="userStore.user">
        <div class="relative">
          <details class="group">
            <summary class="list-none cursor-pointer flex items-center gap-2">
              <!-- 바깥쪽: 보라색 배경, 안쪽: 이미지 -->
              <div
                class="w-12 h-12 rounded-full flex items-center justify-center border-2 border-white shadow-sm hover:shadow-md transition-all duration-200">
                <div class="w-10 h-10 rounded-full bg-white overflow-hidden flex items-center justify-center">
                  <img :src="profileImg" alt=" Profile" class="w-full h-full object-cover"
                    keywords="profile, user, avatar, person" />
                </div>
              </div>

            </summary>
            <div
              class="absolute right-0 mt-2 bg-white rounded-lg shadow-lg border border-gray-200 w-48 z-10 overflow-hidden">
              <div class="p-3 border-b border-gray-100">
                <p class="font-medium">{{ userStore.user.nickname }}</p>
                <p class="text-sm text-gray-500">{{ userStore.user.email }}</p>
              </div>
              <ul>
                <li class="hover:bg-gray-50 transition-colors duration-150">
                  <button @click="mypage" class="block px-4 py-2 text-sm">
                    <div class="flex items-center gap-2">
                      <span class="material-symbols-outlined text-gray-500"> person </span>
                      Profile
                    </div>
                  </button>
                </li>

                <li class="hover:bg-red-50 transition-colors duration-150">
                  <a button @click="logout" class="block px-4 py-2 text-sm text-red-600">
                    <div class="flex items-center gap-2">
                      <span class="material-symbols-outlined"> logout </span>
                      Logout
                    </div>
                  </a>
                </li>
              </ul>
            </div>
          </details>
        </div>
        <!--
        <span>{{ userStore.user.nickname }}님 환영합니다!</span>
        <button
          @click="mypage"
          class="px-4 py-2 rounded-full border border-primary-500 hover:bg-primary-50 transition-colors"
        >
          마이페이지
        </button>
        <button
          @click="logout"
          class="px-4 py-2 bg-primary-600 text-white rounded-full hover:bg-primary-700 transition-colors"
        >
          로그아웃
        </button>
        -->
      </template>
      <template v-else>
        <button @click="goLogin"
          class="px-4 py-2 rounded-full border border-primary-500 hover:bg-primary-50 transition-colors">
          로그인
        </button>
        <router-link to="/log/register"
          class="px-4 py-2 bg-primary-600 text-white rounded-full hover:bg-primary-700 transition-colors">회원가입</router-link>
        <LoginForm v-if="showLogin" @login-success="onLoginSuccess" />
      </template>
    </div>

    <button class="md:hidden">
      <span class="material-symbols-outlined text-2xl">menu</span>
    </button>
  </header>
</template>

<script setup>
import { useUserStore } from "@/stores/user";
import { ref, computed } from "vue";
import { useRouter } from "vue-router";
import logoImg from "@/assets/YogidamLogo.png";
import LoginForm from "../views/log/login.vue";

const userStore = useUserStore();
const user = computed(() => userStore.user);
const showLogin = ref(false);
const router = useRouter();

const profileImg = computed(() => {
  const profile = user.value?.profile;
  if (profile && profile.trim() !== "") return profile;
  return "https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/defaultprofileImg.png";
});

function goLogin() {
  router.push("/log/login");
}

function onLoginSuccess(userInfo) {
  userStore.setUser(userInfo);
  showLogin.value = false;
}

function logout() {
  localStorage.removeItem("accessToken");
  sessionStorage.removeItem("accessToken");
  userStore.logout();
  localStorage.removeItem("user");
  router.push("/");
}

function mypage() {
  router.push("/log/mypage");
}
</script>
