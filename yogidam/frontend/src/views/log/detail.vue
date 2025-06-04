<template>
    <div class="flex justify-center">
  <div id="webcrumbs" class="w-[400px] p-8 bg-white rounded-xl shadow-lg transition-transform hover:shadow-xl hover:scale-[1.01] mx-auto md:mx-0">
    <h3 class="text-lg font-bold mb-4 flex items-center">
      <span class="material-symbols-outlined mr-2 text-primary-500">manage_accounts</span>
      회원 정보 관리
    </h3>
    <div class="space-y-4">
      <form @submit.prevent="submitUpdate" class="flex flex-col space-y-4">
        <div class="flex flex-col space-y-2">
          <label class="text-sm font-medium text-gray-700" for="nickname">닉네임</label>
          <input id="nickname" v-model="form.nickname" type="text" placeholder="닉네임" 
                 class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300" />
        </div>
        <div class="flex flex-col space-y-2">
          <label class="text-sm font-medium text-gray-700" for="password">비밀번호</label>
          <input id="password" v-model="form.password" type="password" placeholder="미입력 시, 기존의 비밀번호가 유지됩니다"
                 class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300" />
        </div>
        <div class="flex flex-col space-y-2">
          <label class="text-sm font-medium text-gray-700" for="email">이메일</label>
          <input id="email" v-model="form.email" type="email" placeholder="이메일" 
                 class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300" />
        </div>
        <div class="flex flex-col space-y-2">
          <label class="text-sm font-medium text-gray-700" for="profileTitle">한마디</label>
          <input id="profileTitle" v-model="form.profileTitle" type="text" placeholder="한마디"
                 class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300" />
        </div>
        <div class="flex justify-end">
          <button type="submit" 
                  class="px-4 py-2 bg-primary-500 text-white rounded-lg hover:bg-primary-600 transition-colors">
            변경
          </button>
        </div>
      </form>

      <details class="group">
        <summary class="flex items-center justify-between cursor-pointer">
          <span class="text-sm font-medium text-red-500">회원 탈퇴</span>
          <span class="material-symbols-outlined text-gray-500 group-open:rotate-180 transition-transform">expand_more</span>
        </summary>
        <div class="mt-3 pt-3 border-t border-gray-100">
          <p class="text-sm text-gray-600 mb-3">탈퇴 사유를 간략히 알려주시면 서비스 개선에 도움을 줍니다.</p>
          <textarea v-model="form.reason" rows="4" placeholder="탈퇴 사유를 입력해주세요 (선택사항)"
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300 mb-3"></textarea>
          <div class="flex justify-end">
            <button @click="submitDelete" 
                    class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors">
              회원 탈퇴 진행
            </button>
          </div>
        </div>
      </details>
    </div>
  </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import axios from 'axios'
import { useUserStore } from "@/stores/user";
const userStore = useUserStore();

const form = ref({
  nickname: '',
  password: '',
  email: '',
  profileTitle: '',
  reason: ''
})

// userStore.user가 바뀔 때마다 form도 동기화
watch(
  () => userStore.user,
  (newUser) => {
    if (newUser) {
      form.value.nickname = newUser.nickname
      form.value.email = newUser.email
      form.value.profileTitle = newUser.profileTitle
    }
  },
  { immediate: true }
)

onMounted(async () => {
  try {
    const response = await axios.get('/api/mypage/detail')
    userStore.setUser(response.data)
  } catch (error) {
    console.error('Failed to load profile', error)
  }
})

async function submitUpdate() {
  try {
    const payload = {
      nickname: form.value.nickname,
      password: form.value.password || undefined,
      email: form.value.email,
      profileTitle: form.value.profileTitle
    }
    await axios.put('/api/mypage/update', payload)
    const response = await axios.get('/api/mypage/detail')
    userStore.setUser(response.data)
    alert('정보가 성공적으로 업데이트되었습니다.')
    window.location.href = '/log/mypage'
  } catch (error) {
    alert('정보 업데이트에 실패했습니다.'+error)
  }
}

async function submitDelete() {    
  try {
    await axios.delete('/api/mypage/delete')
    userStore.logout()
    localStorage.removeItem('user')
    sessionStorage.removeItem('user')
    alert('탈퇴가 완료되었습니다.')
    window.location.href = '/'
  } catch (error) {
    alert('탈퇴 진행 중 오류가 발생했습니다.'+error)
  }
}

</script>