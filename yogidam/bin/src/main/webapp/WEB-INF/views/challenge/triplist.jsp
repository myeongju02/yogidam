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
            @import url(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200);
        </style>
    </head>
    <body>
        <div id="webcrumbs" >
            <div class="w-[1200px] p-6 font-sans bg-gray-50">
            <%@ include file="/WEB-INF/views/fragments/header.jsp"%>
                <div class="flex justify-center mb-8">
                    <div class="flex rounded-full bg-white shadow-md p-1">
                        <button class="px-6 py-3 rounded-full transition-all hover:bg-gray-100">
                            <span class="flex items-center gap-2">
                                <span class="material-symbols-outlined">local_activity</span> 스탬프 챌린지
                            </span>
                        </button>
                        <button
                            class="px-6 py-3 rounded-full bg-[#AA52AA] text-white shadow-lg transition-all hover:bg-[#954795] transform hover:scale-105"
                        >
                            <span class="flex items-center gap-2">
                                <span class="material-symbols-outlined">map</span> 여행지 리스트 챌린지
                            </span>
                        </button>
                    </div>
                </div>
                <div>
                    <h1 class="text-3xl font-bold text-center mb-8 border-b pb-4 text-[#AA52AA]">
                        나의 여행지 리스트
                    </h1>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div
                            class="bg-gray-50 rounded-xl overflow-hidden shadow-md transition-all hover:shadow-lg hover:translate-y-[-5px]"
                        >
                            <div class="h-48 overflow-hidden">
                                <img
                                    src="https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2VvdWx8ZW58MHx8MHx8fDA%3D&amp;auto=format&amp;fit=crop&amp;w=600&amp;q=60"
                                    alt="Seoul City"
                                    class="w-full h-full object-cover transition-transform hover:scale-110"
                                    keywords="seoul, korea, city, night, skyline"
                                />
                            </div>
                            <div class="p-4">
                                <div class="flex justify-between items-center mb-2">
                                    <h3 class="font-bold text-xl">서울</h3>
                                    <span
                                        class="material-symbols-outlined text-yellow-500 cursor-pointer hover:text-yellow-600 transition-colors"
                                        >star</span
                                    >
                                </div>
                                <p class="text-gray-600 text-sm mb-3">
                                    대한민국의 수도, 현대적인 건물과 전통 사찰이 공존하는 도시
                                </p>
                                <div class="flex justify-between">
                                    <span class="text-xs bg-primary-100 text-primary-700 px-2 py-1 rounded-full"
                                        >아시아</span
                                    >
                                    <button
                                        class="text-[#AA52AA] hover:text-[#954795] flex items-center gap-1 text-sm transition-colors"
                                    >
                                        방문 완료 <span class="material-symbols-outlined text-sm">check_circle</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-gray-50 rounded-xl overflow-hidden shadow-md transition-all hover:shadow-lg hover:translate-y-[-5px]"
                        >
                            <div class="h-48 overflow-hidden">
                                <img
                                    src="https://images.unsplash.com/photo-1564507592333-c60657eea523?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dG9reW98ZW58MHx8MHx8fDA%3D&amp;auto=format&amp;fit=crop&amp;w=600&amp;q=60"
                                    alt="Tokyo, Japan"
                                    class="w-full h-full object-cover transition-transform hover:scale-110"
                                    keywords="tokyo, japan, city, urban, skyline"
                                />
                            </div>
                            <div class="p-4">
                                <div class="flex justify-between items-center mb-2">
                                    <h3 class="font-bold text-xl">도쿄</h3>
                                    <span
                                        class="material-symbols-outlined text-gray-400 cursor-pointer hover:text-yellow-500 transition-colors"
                                        >star</span
                                    >
                                </div>
                                <p class="text-gray-600 text-sm mb-3">일본의 수도, 전통과 미래가 공존하는 대도시</p>
                                <div class="flex justify-between">
                                    <span class="text-xs bg-primary-100 text-primary-700 px-2 py-1 rounded-full"
                                        >아시아</span
                                    >
                                    <button
                                        class="text-gray-500 hover:text-primary-500 flex items-center gap-1 text-sm transition-colors"
                                    >
                                        방문 예정 <span class="material-symbols-outlined text-sm">calendar_month</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-gray-50 rounded-xl overflow-hidden shadow-md transition-all hover:shadow-lg hover:translate-y-[-5px]"
                        >
                            <div class="h-48 overflow-hidden">
                                <img
                                    src="https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGFyaXN8ZW58MHx8MHx8fDA%3D&amp;auto=format&amp;fit=crop&amp;w=600&amp;q=60"
                                    alt="Paris, France"
                                    class="w-full h-full object-cover transition-transform hover:scale-110"
                                    keywords="paris, france, eiffel tower, europe, city"
                                />
                            </div>
                            <div class="p-4">
                                <div class="flex justify-between items-center mb-2">
                                    <h3 class="font-bold text-xl">파리</h3>
                                    <span
                                        class="material-symbols-outlined text-gray-400 cursor-pointer hover:text-yellow-500 transition-colors"
                                        >star</span
                                    >
                                </div>
                                <p class="text-gray-600 text-sm mb-3">프랑스의 수도, 예술과 낭만의 도시</p>
                                <div class="flex justify-between">
                                    <span class="text-xs bg-blue-100 text-blue-700 px-2 py-1 rounded-full">유럽</span>
                                    <button
                                        class="text-gray-500 hover:text-[#AA52AA] flex items-center gap-1 text-sm transition-colors"
                                    >
                                        방문 예정 <span class="material-symbols-outlined text-sm">calendar_month</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-gray-50 rounded-xl overflow-hidden shadow-md transition-all hover:shadow-lg hover:translate-y-[-5px]"
                        >
                            <div class="h-48 overflow-hidden">
                                <img
                                    src="https://images.unsplash.com/photo-1507358522600-9f71e620c44e?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FuJTIwZnJhbmNpc2NvfGVufDB8fDB8fHww&amp;auto=format&amp;fit=crop&amp;w=600&amp;q=60"
                                    alt="San Francisco, USA"
                                    class="w-full h-full object-cover transition-transform hover:scale-110"
                                    keywords="san francisco, usa, golden gate bridge, california, city"
                                />
                            </div>
                            <div class="p-4">
                                <div class="flex justify-between items-center mb-2">
                                    <h3 class="font-bold text-xl">샌프란시스코</h3>
                                    <span
                                        class="material-symbols-outlined text-gray-400 cursor-pointer hover:text-yellow-500 transition-colors"
                                        >star</span
                                    >
                                </div>
                                <p class="text-gray-600 text-sm mb-3">
                                    미국 캘리포니아주의 도시, 골든 게이트 브릿지로 유명
                                </p>
                                <div class="flex justify-between">
                                    <span class="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full">북미</span>
                                    <button
                                        class="text-gray-500 hover:text-[#AA52AA] flex items-center gap-1 text-sm transition-colors"
                                    >
                                        미방문 <span class="material-symbols-outlined text-sm">flight</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-gray-50 rounded-xl overflow-hidden shadow-md transition-all hover:shadow-lg hover:translate-y-[-5px]"
                        >
                            <div class="h-48 overflow-hidden bg-gray-200 flex items-center justify-center">
                                <span class="material-symbols-outlined text-6xl text-gray-400"
                                    >add_photo_alternate</span
                                >
                            </div>
                            <div class="p-4">
                                <div class="flex justify-between items-center mb-2">
                                    <h3 class="font-bold text-xl">사진 추가하기</h3>
                                    <span
                                        class="material-symbols-outlined text-primary-500 cursor-pointer hover:text-primary-700 transition-colors"
                                        >add_circle</span
                                    >
                                </div>
                                <p class="text-gray-600 text-sm mb-3">
                                    여기를 클릭하여 새로운 여행지 사진을 추가해보세요
                                </p>
                                <div class="flex justify-between">
                                    <span class="text-xs bg-gray-200 text-gray-700 px-2 py-1 rounded-full"
                                        >새 여행지</span
                                    >
                                    <button
                                        class="text-[#AA52AA] hover:text-[#954795] flex items-center gap-1 text-sm transition-colors"
                                    >
                                        사진 업로드 <span class="material-symbols-outlined text-sm">cloud_upload</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div
                            class="bg-[#F8E5F8] rounded-xl overflow-hidden shadow-md transition-all hover:shadow-lg hover:translate-y-[-5px] border-2 border-dashed border-[#D995D9] flex flex-col items-center justify-center p-6 h-[272px]"
                        >
                            <span class="material-symbols-outlined text-5xl text-[#AA52AA] mb-4">add_location</span>
                            <h3 class="font-bold text-xl text-primary-600 mb-2">새 여행지 추가하기</h3>
                            <p class="text-gray-600 text-sm text-center mb-4">
                                당신의 버킷리스트에 새로운 여행지를 추가해보세요
                            </p>
                            <button
                                class="bg-primary-500 text-white px-4 py-2 rounded-full hover:bg-primary-600 transition-colors"
                            >
                                추가하기
                            </button>
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
