<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상세 페이지</title>
<link rel="stylesheet" href="/css/main.css">
<style>
@import url(https://fonts.googleapis.com/css2?family=Lato&display=swap);

@import
	url(https://fonts.googleapis.com/css2?family=Open+Sans&display=swap);

@import
	url(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200)
	;
</style>
</head>
<body>
	<div id="webcrumbs">
		<div
			class="w-[400px] p-8 bg-white rounded-xl shadow-lg transition-transform hover:shadow-xl hover:scale-[1.01] mx-auto md:mx-0">
			<h3 class="text-lg font-bold mb-4 flex items-center">
				<span class="material-symbols-outlined mr-2 text-primary-500">manage_accounts</span>
				회원 정보 관리
			</h3>
			<div class="space-y-4">
				<form action="/mypage/update" method="post" class="flex flex-col space-y-4">
					<div class="flex flex-col space-y-2">
						<label class="text-sm font-medium text-gray-700">닉네임</label>
						<div class="flex">
							<input type="text" name="nickname"
								class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300"
								value='<sec:authentication property="principal.nickname"/>' />

						</div>
					</div>
					<div class="flex flex-col space-y-2">
						<label class="text-sm font-medium text-gray-700">비밀번호</label>
						<div class="flex">
							<input type="password" name="password"
								class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300"
								placeholder="미입력 시, 기존의 비밀번호가 유지됩니다" />
						</div>
					</div>
					<div class="flex flex-col space-y-2">
						<label class="text-sm font-medium text-gray-700">이메일</label>
						<div class="flex">
							<input type="email" name="email"
								class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300"
								value='<sec:authentication property="principal.email"/>' />
						</div>
					</div>
					<div class="flex flex-col space-y-2">
						<label class="text-sm font-medium text-gray-700">한마디</label>
						<div class="flex">
							<input type="text" name="profiletitle"
								class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300"
								value='<sec:authentication property="principal.profiletitle"/>'/>
						</div>
					</div>
					
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="flex justify-end">
						<button
							class="px-4 py-2 bg-primary-500 text-white rounded-lg hover:bg-primary-600 transition-colors">
							변경</button>
					</div>
				</form>


				<details class="group">
					<summary class="flex items-center justify-between cursor-pointer">
						<span class="text-sm font-medium text-red-500">회원 탈퇴</span> <span
							class="material-symbols-outlined text-gray-500 group-open:rotate-180 transition-transform">expand_more</span>
					</summary>
					<div class="mt-3 pt-3 border-t border-gray-100">
						<p class="text-sm text-gray-600 mb-3">탈퇴 사유를 간략히 알려주시면 서비스 개선에
							도움이 됩니다.</p>
						<textarea
							class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300 h-24 mb-3"
							placeholder="탈퇴 사유를 입력해주세요 (선택사항)"></textarea>
						<div class="flex justify-end">
							<form action="/mypage/delete" method="post"
								onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
								<button type="submit"
									class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition-colors">
									회원 탈퇴 진행</button>
							</form>
						</div>

					</div>
				</details>
			</div>
		</div>
	</div>
	</div>
	<script src="https://cdn.tailwindcss.com"></script>
	<script>
            tailwind.config = {
                content: ["./src/**/*.{html,js}"],
                theme: {
                    name: "Custom",
                    fontFamily: {
                        sans: [
                            "Open Sans",
                            "ui-sans-serif",
                            "system-ui",
                            "sans-serif",
                            '"Apple Color Emoji"',
                            '"Segoe UI Emoji"',
                            '"Segoe UI Symbol"',
                            '"Noto Color Emoji"'
                        ]
                    },
                    extend: {
                        fontFamily: {
                            title: [
                                "Lato",
                                "ui-sans-serif",
                                "system-ui",
                                "sans-serif",
                                '"Apple Color Emoji"',
                                '"Segoe UI Emoji"',
                                '"Segoe UI Symbol"',
                                '"Noto Color Emoji"'
                            ],
                            body: [
                                "Open Sans",
                                "ui-sans-serif",
                                "system-ui",
                                "sans-serif",
                                '"Apple Color Emoji"',
                                '"Segoe UI Emoji"',
                                '"Segoe UI Symbol"',
                                '"Noto Color Emoji"'
                            ]
                        },
                        colors: {
                            neutral: {
                                50: "#f0fafa",
                                100: "#e2f3f3",
                                200: "#cee5e8",
                                300: "#a7d4d8",
                                400: "#78bfca",
                                500: "#59a7b2",
                                600: "#488b95",
                                700: "#31727c",
                                800: "#2a5c67",
                                900: "#244c5d",
                                950: "#142a40"
                            },
                            primary: {
                                50: "#fcf7fc",
                                100: "#f8eef9",
                                200: "#f1dbf3",
                                300: "#e7bfe8",
                                400: "#d899d9",
                                500: "#c370c5",
                                600: "#aa52aa",
                                700: "#8a4188",
                                800: "#723670",
                                900: "#5e315b",
                                950: "#3c163a",
                                DEFAULT: "#aa52aa"
                            }
                        }
                    },
                    fontSize: {
                        xs: ["12px", {lineHeight: "19.200000000000003px"}],
                        sm: ["14px", {lineHeight: "21px"}],
                        base: ["16px", {lineHeight: "25.6px"}],
                        lg: ["18px", {lineHeight: "27px"}],
                        xl: ["20px", {lineHeight: "28px"}],
                        "2xl": ["24px", {lineHeight: "31.200000000000003px"}],
                        "3xl": ["30px", {lineHeight: "36px"}],
                        "4xl": ["36px", {lineHeight: "41.4px"}],
                        "5xl": ["48px", {lineHeight: "52.800000000000004px"}],
                        "6xl": ["60px", {lineHeight: "66px"}],
                        "7xl": ["72px", {lineHeight: "75.60000000000001px"}],
                        "8xl": ["96px", {lineHeight: "100.80000000000001px"}],
                        "9xl": ["128px", {lineHeight: "134.4px"}]
                    },
                    borderRadius: {
                        none: "0px",
                        sm: "6px",
                        DEFAULT: "12px",
                        md: "18px",
                        lg: "24px",
                        xl: "36px",
                        "2xl": "48px",
                        "3xl": "72px",
                        full: "9999px"
                    },
                    spacing: {
                        0: "0px",
                        1: "4px",
                        2: "8px",
                        3: "12px",
                        4: "16px",
                        5: "20px",
                        6: "24px",
                        7: "28px",
                        8: "32px",
                        9: "36px",
                        10: "40px",
                        11: "44px",
                        12: "48px",
                        14: "56px",
                        16: "64px",
                        20: "80px",
                        24: "96px",
                        28: "112px",
                        32: "128px",
                        36: "144px",
                        40: "160px",
                        44: "176px",
                        48: "192px",
                        52: "208px",
                        56: "224px",
                        60: "240px",
                        64: "256px",
                        72: "288px",
                        80: "320px",
                        96: "384px",
                        px: "1px",
                        0.5: "2px",
                        1.5: "6px",
                        2.5: "10px",
                        3.5: "14px"
                    }
                },
                plugins: [],
                important: "#webcrumbs"
            }
        </script>
</body>