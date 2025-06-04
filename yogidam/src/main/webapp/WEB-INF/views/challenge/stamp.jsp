<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>챌린지</title>
        <style>
            @import url(https://fonts.googleapis.com/css2?family=Lato&display=swap);
            @import url(https://fonts.googleapis.com/css2?family=Open+Sans&display=swap);
        </style>
    </head>
    <body>
        <div id="webcrumbs">
            <div class="w-[1200px] p-6 font-sans bg-gray-50">
            <%@ include file="/WEB-INF/views/fragments/header.jsp"%>
                <div class="mb-8">
                    <div class="flex gap-4 justify-center mb-10">
                        <button
                            id="stampBtn"
                            class="py-3 px-6 bg-primary-500/90 text-white rounded-lg font-medium shadow-md hover:bg-primary-600/90 transition-all transform hover:scale-105 active:scale-95 focus:outline-none focus:ring-2 focus:ring-primary-400/70 focus:ring-offset-2"
                        >
                            스탬프 챌린지
                        </button>
                        <button
                            id="travelListBtn"
                            class="py-3 px-6 bg-gray-200 text-gray-700 rounded-lg font-medium shadow-md hover:bg-gray-300 transition-all transform hover:scale-105 active:scale-95"
                        >
                            여행지 리스트 챌린지
                        </button>
                    </div>
                    <div id="stampChallenge" class="transition-all duration-300 ease-in-out">
                        <h2 class="text-2xl font-bold text-center mb-8">스탬프 챌린지</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                            <div
                                class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
                            >
                                <div class="p-6 flex flex-col items-center">
                                    <div
                                        class="w-24 h-24 bg-primary-100 rounded-full flex items-center justify-center mb-4 hover:bg-primary-200 transition-colors"
                                    >
                                        <svg
                                            class="w-12 h-12 text-primary-600"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"
                                            ></path>
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"
                                            ></path>
                                        </svg>
                                    </div>
                                    <h3 class="text-lg font-semibold text-center">나만의 감성 사진</h3>
                                    <p class="text-gray-500 text-center mt-2">특별한 순간을 사진에 담아보세요</p>
                                    <button
                                        class="mt-4 py-2 px-4 bg-primary-500 text-white rounded-full hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                    >
                                        도전하기
                                    </button>
                                </div>
                            </div>
                            <div
                                class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
                            >
                                <div class="p-6 flex flex-col items-center">
                                    <div
                                        class="w-24 h-24 bg-primary-100 rounded-full flex items-center justify-center mb-4 hover:bg-primary-200 transition-colors"
                                    >
                                        <svg
                                            class="w-12 h-12 text-primary-600"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                                            ></path>
                                        </svg>
                                    </div>
                                    <h3 class="text-lg font-semibold text-center">혼밥</h3>
                                    <p class="text-gray-500 text-center mt-2">혼자서 맛있는 식사를 즐겨보세요</p>
                                    <button
                                        class="mt-4 py-2 px-4 bg-primary-500 text-white rounded-full hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                    >
                                        도전하기
                                    </button>
                                </div>
                            </div>
                            <div
                                class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
                            >
                                <div class="p-6 flex flex-col items-center">
                                    <div
                                        class="w-24 h-24 bg-primary-100 rounded-full flex items-center justify-center mb-4 hover:bg-primary-200 transition-colors"
                                    >
                                        <svg
                                            class="w-12 h-12 text-primary-600"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"
                                            ></path>
                                        </svg>
                                    </div>
                                    <h3 class="text-lg font-semibold text-center">도보 챌린지</h3>
                                    <p class="text-gray-500 text-center mt-2">걸으면서 새로운 발견을 해보세요</p>
                                    <button
                                        class="mt-4 py-2 px-4 bg-primary-500 text-white rounded-full hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                    >
                                        도전하기
                                    </button>
                                </div>
                            </div>
                            <div
                                class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
                            >
                                <div class="p-6 flex flex-col items-center">
                                    <div
                                        class="w-24 h-24 bg-primary-100 rounded-full flex items-center justify-center mb-4 hover:bg-primary-200 transition-colors"
                                    >
                                        <svg
                                            class="w-12 h-12 text-primary-600"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M12 8v13m0-13V6a2 2 0 112 2h-2zm0 0V5.5A2.5 2.5 0 109.5 8H12zm-7 4h14M5 12a2 2 0 110-4h14a2 2 0 110 4M5 12v7a2 2 0 002 2h10a2 2 0 002-2v-7"
                                            ></path>
                                        </svg>
                                    </div>
                                    <h3 class="text-lg font-semibold text-center">문화 체험 챌린지</h3>
                                    <p class="text-gray-500 text-center mt-2">다양한 문화를 체험해보세요</p>
                                    <button
                                        class="mt-4 py-2 px-4 bg-primary-500 text-white rounded-full hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                    >
                                        도전하기
                                    </button>
                                </div>
                            </div>
                            <div
                                class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
                            >
                                <div class="p-6 flex flex-col items-center">
                                    <div
                                        class="w-24 h-24 bg-primary-100 rounded-full flex items-center justify-center mb-4 hover:bg-primary-200 transition-colors"
                                    >
                                        <svg
                                            class="w-12 h-12 text-primary-600"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
                                            ></path>
                                        </svg>
                                    </div>
                                    <h3 class="text-lg font-semibold text-center">밤하늘 감상 챌린지</h3>
                                    <p class="text-gray-500 text-center mt-2">밤하늘의 별을 감상해보세요</p>
                                    <button
                                        class="mt-4 py-2 px-4 bg-primary-500 text-white rounded-full hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                    >
                                        도전하기
                                    </button>
                                </div>
                            </div>
                            <div
                                class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
                            >
                                <div class="p-6 flex flex-col items-center">
                                    <div
                                        class="w-24 h-24 bg-primary-100 rounded-full flex items-center justify-center mb-4 hover:bg-primary-200 transition-colors"
                                    >
                                        <svg
                                            class="w-12 h-12 text-primary-600"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                        >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                                            ></path>
                                        </svg>
                                    </div>
                                    <h3 class="text-lg font-semibold text-center">감성 산책 챌린지</h3>
                                    <p class="text-gray-500 text-center mt-2">여유로운 산책을 즐겨보세요</p>
                                    <button
                                        class="mt-4 py-2 px-4 bg-primary-500 text-white rounded-full hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                    >
                                        도전하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="travelListChallenge" class="hidden transition-all duration-300 ease-in-out">
                        <h2 class="text-2xl font-bold text-center mb-8">여행지 리스트 챌린지</h2>
                        <div class="bg-white rounded-xl shadow-md p-6">
                            <div class="flex justify-between items-center mb-6">
                                <h3 class="text-lg font-semibold">나의 여행지 리스트</h3>
                                <button
                                    class="py-2 px-4 bg-primary-500 text-white rounded-lg hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                >
                                    새 여행지 추가
                                </button>
                            </div>
                            <div class="space-y-6">
                                <div class="border rounded-lg p-4 hover:shadow-md transition-shadow">
                                    <div class="flex flex-col md:flex-row gap-4">
                                        <div
                                            class="md:w-1/3 relative h-48 bg-gray-100 rounded-lg overflow-hidden flex items-center justify-center"
                                        >
                                            <svg
                                                class="w-12 h-12 text-gray-400"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke="currentColor"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="2"
                                                    d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"
                                                ></path>
                                            </svg>
                                            <button
                                                class="absolute inset-0 w-full h-full bg-black bg-opacity-50 opacity-0 hover:opacity-100 transition-opacity flex items-center justify-center text-white"
                                            >
                                                사진 업로드
                                            </button>
                                        </div>
                                        <div class="md:w-2/3">
                                            <h4 class="text-lg font-medium mb-2">서울 북촌 한옥마을</h4>
                                            <p class="text-gray-600 mb-4">
                                                전통적인 한옥과 좁은 골목길이 있는 역사적인 지역입니다. 다양한 문화
                                                체험도 가능합니다.
                                            </p>
                                            <div class="flex flex-wrap gap-2">
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >역사</span
                                                >
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >문화</span
                                                >
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >도보여행</span
                                                >
                                            </div>
                                            <div class="mt-4 flex justify-end">
                                                <button class="text-primary-600 hover:underline">수정</button>
                                                <span class="mx-2">|</span>
                                                <button class="text-red-600 hover:underline">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="border rounded-lg p-4 hover:shadow-md transition-shadow">
                                    <div class="flex flex-col md:flex-row gap-4">
                                        <div
                                            class="md:w-1/3 relative h-48 bg-gray-100 rounded-lg overflow-hidden flex items-center justify-center"
                                        >
                                            <svg
                                                class="w-12 h-12 text-gray-400"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke="currentColor"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="2"
                                                    d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"
                                                ></path>
                                            </svg>
                                            <button
                                                class="absolute inset-0 w-full h-full bg-black bg-opacity-50 opacity-0 hover:opacity-100 transition-opacity flex items-center justify-center text-white"
                                            >
                                                사진 업로드
                                            </button>
                                        </div>
                                        <div class="md:w-2/3">
                                            <h4 class="text-lg font-medium mb-2">부산 해운대</h4>
                                            <p class="text-gray-600 mb-4">
                                                한국에서 가장 유명한 해변 중 하나로, 아름다운 해안선과 다양한 식당,
                                                카페가 있습니다.
                                            </p>
                                            <div class="flex flex-wrap gap-2">
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >바다</span
                                                >
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >맛집</span
                                                >
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >휴식</span
                                                >
                                            </div>
                                            <div class="mt-4 flex justify-end">
                                                <button class="text-primary-600 hover:underline">수정</button>
                                                <span class="mx-2">|</span>
                                                <button class="text-red-600 hover:underline">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="border rounded-lg p-4 hover:shadow-md transition-shadow">
                                    <div class="flex flex-col md:flex-row gap-4">
                                        <div
                                            class="md:w-1/3 relative h-48 bg-gray-100 rounded-lg overflow-hidden flex items-center justify-center"
                                        >
                                            <svg
                                                class="w-12 h-12 text-gray-400"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke="currentColor"
                                            >
                                                <path
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                    stroke-width="2"
                                                    d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"
                                                ></path>
                                            </svg>
                                            <button
                                                class="absolute inset-0 w-full h-full bg-black bg-opacity-50 opacity-0 hover:opacity-100 transition-opacity flex items-center justify-center text-white"
                                            >
                                                사진 업로드
                                            </button>
                                        </div>
                                        <div class="md:w-2/3">
                                            <h4 class="text-lg font-medium mb-2">제주 성산일출봉</h4>
                                            <p class="text-gray-600 mb-4">
                                                유네스코 세계자연유산으로 등재된 화산 분화구로, 장관을 이루는 일출
                                                명소입니다.
                                            </p>
                                            <div class="flex flex-wrap gap-2">
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >자연</span
                                                >
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >일출</span
                                                >
                                                <span
                                                    class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                    >트레킹</span
                                                >
                                            </div>
                                            <div class="mt-4 flex justify-end">
                                                <button class="text-primary-600 hover:underline">수정</button>
                                                <span class="mx-2">|</span>
                                                <button class="text-red-600 hover:underline">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    const stampBtn = document.getElementById("stampBtn")
                    const travelListBtn = document.getElementById("travelListBtn")
                    const stampChallenge = document.getElementById("stampChallenge")
                    const travelListChallenge = document.getElementById("travelListChallenge")
                    stampBtn.addEventListener("click", function () {
                        stampBtn.classList.remove("bg-gray-200", "text-gray-700")
                        stampBtn.classList.add("bg-primary-600", "text-white")
                        travelListBtn.classList.remove("bg-primary-600", "text-white")
                        travelListBtn.classList.add("bg-gray-200", "text-gray-700")
                        stampChallenge.classList.remove("hidden")
                        travelListChallenge.classList.add("hidden")
                    })
                    travelListBtn.addEventListener("click", function () {
                        travelListBtn.classList.remove("bg-gray-200", "text-gray-700")
                        travelListBtn.classList.add("bg-primary-600", "text-white")
                        stampBtn.classList.remove("bg-primary-600", "text-white")
                        stampBtn.classList.add("bg-gray-200", "text-gray-700")
                        travelListChallenge.classList.remove("hidden")
                        stampChallenge.classList.add("hidden")
                    })
                </script>
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
                                50: "#f7f7f7",
                                100: "#eeeeee",
                                200: "#e0e0e0",
                                300: "#cacaca",
                                400: "#b1b1b1",
                                500: "#999999",
                                600: "#7f7f7f",
                                700: "#676767",
                                800: "#545454",
                                900: "#464646",
                                950: "#282828"
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
</html>
