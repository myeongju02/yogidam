module.exports = {
  devServer: {
    proxy: {
      "/api": {
        target: "http://localhost:8080", // Spring Boot 주소
        changeOrigin: true,
        pathRewrite: {
          "^/api": "",
        },
      },
    },
  },
};
