import { createRouter, createWebHistory } from "vue-router";
import { useUserStore } from "@/stores/user";
import { getActivePinia } from "pinia";

import Home from "../views/Home.vue";
import Login from "../views/log/login.vue";
import Regist from "../views/log/register.vue";
import MyPage from "../views/log/mypage.vue";
import Detail from "../views/log/detail.vue";
import Board from "@/views/board/CommunityBoard.vue";
import TourPlan from "@/views/tour/TourPlan.vue";
import TourPath from "@/views/tour/TourPath.vue";
import NewBoard from "@/views/board/NewBoard.vue";
import BoardDetail from "@/views/board/BoardDetail.vue";
import BoardEdit from "@/views/board/BoardEdit.vue";
import Stamp from "@/views/challenge/stamp.vue";
import StampForm from "@/views/challenge/stampform.vue";
import TripList from "@/views/challenge/triplist.vue";
import TripListForm from "@/views/challenge/triplistform.vue";

const routes = [
  { path: "/", name: "Home", component: Home },
  { path: "/log/login", name: "Login", component: Login },
  { path: "/log/register", name: "Regist", component: Regist },
  { path: "/log/mypage", component: MyPage, name: "MyPage", meta: { requiresAuth: true } },
  { path: "/log/detail", name: "Detail", component: Detail },
  { path: "/community", component: Board },
  { path: "/tour/plan", component: TourPlan },
  { path: "/tour/:planId", name: "TourPlan", component: TourPath },
  { path: "/new-board", name: "NewBoard", component: NewBoard },
  { path: "/boards/:id", name: "BoardDetail", component: BoardDetail },
  { path: "/boards/:id/edit", name: "BoardEdit", component: BoardEdit },
  { path: "/challenge/stamp/:type", name: "stamp", component: Stamp },
  { path: "/challenge/stampform", name: "stampform", component: StampForm },
  { path: "/challenge/triplistform", name: "triplistform", component: TripListForm },
  { path: "/challenge/triplist/:planId", name: "TripList", component: TripList },
  // ...필요한 라우트 추가
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const userStore = useUserStore(getActivePinia());
  if (to.meta.requiresAuth && !userStore.user) {
    next("/log/login");
  } else {
    next();
  }
});

export default router;
