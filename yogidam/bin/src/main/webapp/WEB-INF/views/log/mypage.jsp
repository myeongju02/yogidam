<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>마이 페이지</title>
        <style>
            @import url(https://fonts.googleapis.com/css2?family=Lato&display=swap);
            @import url(https://fonts.googleapis.com/css2?family=Open+Sans&display=swap);
            @import url(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200);
        </style>
    </head>
    <body>
        <div id="webcrumbs">
            <div class="w-[1200px] p-6 font-sans bg-gray-50" >
            <%@ include file="/WEB-INF/views/fragments/header.jsp"%>
                <div class="flex flex-row lg:flex-row gap-8">
                    <div class="lg:w-1/3">
                        <div class="bg-white rounded-xl shadow-md p-6 mb-6 transition-all duration-300 hover:shadow-lg">
                            <div class="flex flex-col items-center">
                                <div class="relative group">
                                    <div
                                        class="w-32 h-32 rounded-full overflow-hidden border-4 border-primary-300 shadow-md"
                                    >
                                        <img
                                            src="https://images.unsplash.com/photo-1511367461989-f85a21fda167?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8MTc0NjY2MTA3M3ww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080"
                                            alt="Profile"
                                            class="w-full h-full object-cover"
                                            keywords="profile, user, avatar, person"
                                        />
                                    </div>
                                    <div class="absolute bottom-0 right-0">
                                        <button
                                            class="bg-primary-500 text-white p-2 rounded-full hover:bg-primary-600 transition-colors shadow-md"
                                        >
                                            <span class="material-symbols-outlined text-sm">edit</span>
                                        </button>
                                    </div>
                                </div>
                                <h2 class="text-2xl font-bold mt-4"><sec:authentication property="principal.nickname"/></h2>
                                <p class="text-gray-500 text-sm mb-4"><sec:authentication property="principal.email"/></p>
                                <div class="bg-primary-50 px-4 py-2 rounded-full text-primary-700 font-medium text-sm">
                                    <sec:authentication property="principal.profiletitle"/>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white rounded-xl shadow-md p-6 mb-6 transition-all duration-300 hover:shadow-lg">
                            <h3 class="text-lg font-bold mb-3 flex items-center">
                                <span class="material-symbols-outlined mr-2 text-primary-500">savings</span> 포인트 현황
                            </h3>
                            <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg mb-4">
                                <span class="text-gray-600">현재 보유</span>
                                <span class="text-xl font-bold text-primary-600"><sec:authentication property="principal.point"/></span>
                            </div>
                            <h4 class="text-sm font-semibold mb-2 text-gray-600">교환 가능 아이템</h4>
                            <div class="grid grid-cols-2 gap-2">
                                <div
                                    class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center"
                                >
                                    <span class="material-symbols-outlined text-2xl text-amber-500 mb-1">redeem</span>
                                    <p class="text-xs text-center">커피 쿠폰</p>
                                    <p class="text-xs font-bold">1,000 P</p>
                                </div>
                                <div
                                    class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center"
                                >
                                    <span class="material-symbols-outlined text-2xl text-blue-500 mb-1">luggage</span>
                                    <p class="text-xs text-center">캐리어 태그</p>
                                    <p class="text-xs font-bold">2,500 P</p>
                                </div>
                                <div
                                    class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center"
                                >
                                    <span class="material-symbols-outlined text-2xl text-green-500 mb-1">hotel</span>
                                    <p class="text-xs text-center">숙박 할인</p>
                                    <p class="text-xs font-bold">5,000 P</p>
                                </div>
                                <div
                                    class="p-3 border border-gray-200 rounded-lg hover:bg-gray-50 cursor-pointer transition-colors flex flex-col items-center"
                                >
                                    <span class="material-symbols-outlined text-2xl text-purple-500 mb-1">flight</span>
                                    <p class="text-xs text-center">항공 마일리지</p>
                                    <p class="text-xs font-bold">10,000 P</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="lg:w-2/3">
                        <div class="bg-white rounded-xl shadow-md p-6 mb-6 transition-all duration-300 hover:shadow-lg">
                            <h3 class="text-lg font-bold mb-4 flex items-center">
                                <span class="material-symbols-outlined mr-2 text-primary-500">workspace_premium</span>
                                나의 뱃지
                            </h3>
                            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                                <div class="group flex flex-col items-center">
                                    <div
                                        class="w-16 h-16 rounded-full bg-amber-100 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform"
                                    >
                                        <span class="material-symbols-outlined text-3xl text-amber-500"
                                            >restaurant</span
                                        >
                                    </div>
                                    <p class="text-xs font-medium text-center">맛집 탐험가</p>
                                    <p class="text-[10px] text-gray-500">10곳 방문 완료</p>
                                </div>
                                <div class="group flex flex-col items-center">
                                    <div
                                        class="w-16 h-16 rounded-full bg-rose-100 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform"
                                    >
                                        <span class="material-symbols-outlined text-3xl text-rose-500"
                                            >photo_camera</span
                                        >
                                    </div>
                                    <p class="text-xs font-medium text-center">사진왕</p>
                                    <p class="text-[10px] text-gray-500">50장 업로드 완료</p>
                                </div>
                                <div class="group flex flex-col items-center">
                                    <div
                                        class="w-16 h-16 rounded-full bg-green-100 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform"
                                    >
                                        <span class="material-symbols-outlined text-3xl text-green-500">nature</span>
                                    </div>
                                    <p class="text-xs font-medium text-center">힐링 마스터</p>
                                    <p class="text-[10px] text-gray-500">5곳 힐링 명소 방문</p>
                                </div>
                            </div>
                            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mt-6">
                                <h4 class="col-span-full text-sm font-semibold mb-2 text-gray-600">획득 가능한 뱃지</h4>
                                <div class="group flex flex-col items-center">
                                    <div
                                        class="w-16 h-16 rounded-full bg-gray-200 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform"
                                    >
                                        <span class="material-symbols-outlined text-3xl text-gray-400">hiking</span>
                                    </div>
                                    <p class="text-xs font-medium text-center text-gray-400">등산 마니아</p>
                                    <p class="text-[10px] text-gray-500">8곳 중 3곳 방문</p>
                                </div>
                                <div class="group flex flex-col items-center">
                                    <div
                                        class="w-16 h-16 rounded-full bg-gray-200 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform"
                                    >
                                        <span class="material-symbols-outlined text-3xl text-gray-400"
                                            >beach_access</span
                                        >
                                    </div>
                                    <p class="text-xs font-medium text-center text-gray-400">해변 러버</p>
                                    <p class="text-[10px] text-gray-500">10곳 중 4곳 방문</p>
                                </div>
                                <div class="group flex flex-col items-center">
                                    <div
                                        class="w-16 h-16 rounded-full bg-gray-200 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform"
                                    >
                                        <span class="material-symbols-outlined text-3xl text-gray-400">reviews</span>
                                    </div>
                                    <p class="text-xs font-medium text-center text-gray-400">리뷰 달인</p>
                                    <p class="text-[10px] text-gray-500">20개 중 8개 작성</p>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white rounded-xl shadow-md p-6 transition-all duration-300 hover:shadow-lg">
                            <h3 class="text-lg font-bold mb-4 flex items-center">
                                <span class="material-symbols-outlined mr-2 text-primary-500">manage_accounts</span>
                                회원 정보 관리
                            </h3>
                            <div class="flex justify-center">
                                <a href="/mypage/detail"
                                    class="inline-flex items-center px-6 py-3 bg-primary-500 text-white rounded-lg hover:bg-primary-600 transition-all duration-300 transform hover:scale-105 shadow-md hover:shadow-lg">
                                    <span class="material-symbols-outlined mr-2">settings</span> 회원 정보 관리 페이지로 이동 <span class="material-symbols-outlined ml-2">arrow_forward</span>
                                </a>
                            </div>
                        </div>
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
