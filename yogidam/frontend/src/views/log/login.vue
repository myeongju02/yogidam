<template>
  <div id="webcrumbs">
    <div
      class="w-[400px] p-8 bg-white rounded-xl shadow-lg transition-transform hover:shadow-xl hover:scale-[1.01] mx-auto"
    >
      <h2 class="text-2xl font-bold mb-6 text-primary-600">로그인</h2>
      <form class="space-y-4" @submit.prevent="login">
        <div class="space-y-2">
          <label for="username" class="block font-medium">아이디</label>
          <input
            type="text"
            id="username"
            v-model="userId"
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all"
            placeholder="아이디를 입력하세요"
          />
        </div>
        <div class="space-y-2">
          <label for="password" class="block font-medium">비밀번호</label>
          <div class="relative">
            <input
              type="password"
              id="password"
              v-model="password"
              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all"
              placeholder="비밀번호를 입력하세요"
            />
            <span
              class="absolute right-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-gray-500 cursor-pointer hover:text-primary-600 transition-colors"
            >
              visibility_off
            </span>
          </div>
        </div>
        <div class="flex items-center">
          <input
            type="checkbox"
            id="remember"
            class="w-4 h-4 text-primary-600 border-gray-300 rounded focus:ring-primary-500"
          />
          <label for="remember" class="ml-2 text-sm">아이디 저장</label>
          <a
            href="#"
            class="ml-auto text-sm text-gray-600 hover:text-primary-600 hover:underline transition-colors"
          >
            비밀번호 찾기
          </a>
        </div>
        <button
          type="submit"
          class="w-full py-3 bg-primary-600 text-white font-medium rounded-lg hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2 transition-colors"
        >
          로그인
        </button>
        <div class="mt-4 text-center">
          <span class="text-gray-600">계정이 없으신가요?</span>
          <router-link
            to="/log/register"
            class="ml-2 font-medium text-primary-600 hover:text-primary-700 hover:underline transition-colors"
          >
            회원가입
          </router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import api from "@/api/axios.js";
import { useUserStore } from "@/stores/user";

export default {
  data() {
    return {
      userId: "",
      password: "",
      error: null,
    };
  },
  methods: {
    async login() {
      const userStore = useUserStore();
      try {
        const res = await api.login({
          userId: this.userId,
          password: this.password,
        });

        userStore.setUser(res.data);
        localStorage.setItem("user", JSON.stringify(res.data));

        this.$emit("login-success", res.data); // 부모 컴포넌트에 알리거나 상태관리 저장
        this.error = null;
        this.$router.push({ name: "Home" }); // 로그인 후 메인페이지 이동
      } catch (err) {
        this.error = "로그인 실패 ID, PW 확인하세요";
        alert(this.error);
      }
    },
  },
};
</script>
