<template>
  <div id="webcrumbs">
    <div
      class="w-[500px] p-8 bg-white shadow-lg rounded-xl mx-auto my-10 transform hover:shadow-xl transition-all duration-300"
    >
      <h1 class="text-3xl font-bold text-center mb-8 text-primary-600">회원가입</h1>
      <form class="space-y-6" @submit.prevent="onSubmit">
        <div class="space-y-2">
          <label for="id" class="block font-medium">아이디</label>
          <input
            type="text"
            id="id"
            v-model="form.id"
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 outline-none"
            placeholder="아이디를 입력해주세요"
            required
          />
        </div>
        <div class="space-y-2">
          <label for="password" class="block font-medium">비밀번호</label>
          <input
            type="password"
            id="password"
            v-model="form.password"
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 outline-none"
            placeholder="비밀번호를 입력해주세요"
            required
          />
        </div>
        <div class="space-y-2">
          <label for="nickname" class="block font-medium">닉네임</label>
          <input
            type="text"
            id="nickname"
            v-model="form.nickname"
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 outline-none"
            placeholder="닉네임을 입력해주세요"
            required
          />
        </div>
        <div class="space-y-2">
          <label for="email" class="block font-medium">이메일</label>
          <input
            type="email"
            id="email"
            v-model="form.email"
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 outline-none"
            placeholder="이메일을 입력해주세요"
            required
          />
        </div>
        <div class="space-y-2">
          <label for="birth" class="block font-medium">생년월일</label>
          <input
            type="date"
            id="birth"
            v-model="form.birth"
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 outline-none"
            required
          />
        </div>
        <button
          type="submit"
          class="w-full bg-primary-600 hover:bg-primary-700 text-white font-bold py-3 px-4 rounded-lg transform hover:scale-[1.02] transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-opacity-50 mt-8"
        >
          회원가입
        </button>
        <div class="text-center mt-6">
          <p class="text-sm text-gray-600">
            이미 계정이 있으신가요?
            <router-link to="/log/login" class="text-primary-600 font-medium ml-1 hover:underline">로그인</router-link>
          </p>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from "vue-router";

const router = useRouter();

const form = ref({
  id: '',
  password: '',
  nickname: '',
  email: '',
  birth: ''
})

async function onSubmit() {
  try {
    const response = await axios.post(
      '/api/member/register',
      form.value,
      { headers: { 'Content-Type': 'application/json' } }
    );
    alert('회원가입 성공! 로그인 후 이용해주세요');
    router.push({ name: 'Home' })
  } catch (error) {
    alert('회원가입 실패: ' + (error.response?.data || error.message));
  }
}

</script>
