import { defineStore } from "pinia";
export const useUserStore = defineStore("user", {
  state: () => ({
    user: null,
    isLogin: false,
  }),
  // Pinia userStore
  actions: {
    setUser(user) {
      this.user = user;
      this.isLogin = true;
      localStorage.setItem("user", JSON.stringify(user));
    },
    logout() {
      this.user = null;
      this.isLogin = false;
      localStorage.removeItem("user");
    },
  },
});
