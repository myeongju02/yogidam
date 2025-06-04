import axios from "axios";

export default {
  // 로그인
  login(loginData) {
    return axios.post("/api/member/login", loginData, {
      headers: { "Content-Type": "application/json" },
      withCredentials: true,
    });
  },
  // 글 작성
  createBoard(formData) {
    return axios.post("/api/boards", formData, {
      headers: { "Content-Type": "multipart/form-data" },
      withCredentials: true, // ★ 이 부분이 반드시 필요!
    });
  },
};
