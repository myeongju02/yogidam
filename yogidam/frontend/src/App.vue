<script setup>
import AppHeader from "./components/AppHeader.vue";
import AppFooter from "./components/AppFooter.vue";
import { onMounted } from "vue";
import { useUserStore } from "@/stores/user";
import axios from "axios";

const userStore = useUserStore();

onMounted(async () => {
  try {
    await axios.get("/api/auth/check", { withCredentials: true });
  } catch (error) {
    userStore.logout();
    localStorage.removeItem("user");
    sessionStorage.removeItem("user");
  }
});
</script>

<template>
  <div id="webcrumbs">
    <div class="bg-gradient-to-br from-gray-50 to-gray-100 p-4 md:p-6 lg:p-8">
      <div class="w-[1200px] mx-auto p-6 font-sans">
        <header class="flex justify-between items-center mb-8">
          <AppHeader />
        </header>
        <div class="w-[1200px] p-6 font-sans bg-gray-50">
          <router-view />
        </div>
        <footer class="mt-12 border-t border-gray-200 pt-8 pb-6">
          <AppFooter />
        </footer>
      </div>
    </div>
  </div>
</template>

<style scoped></style>
