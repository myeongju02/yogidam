<template
    ><div id="webcrumbs" class="flex justify-center mb-8">
        <div class="w-[1024px] p-6 font-sans bg-gray-50 min-h-screen">
            <div class="mb-8">
                <div class="flex justify-center mb-8">
                <div class="flex rounded-full bg-white shadow-md p-1">
                    <router-link to="/challenge/stampform" class="px-6 py-3 rounded-full bg-[#AA52AA] text-white shadow-lg transition-all hover:bg-[#954795] transform hover:scale-105">
                        <span class="flex items-center gap-2">
                            <span class="material-symbols-outlined">local_activity</span> 스탬프 챌린지
                        </span>
                    </router-link>
                    <router-link to="/challenge/triplistform"
                        class="px-6 py-3 rounded-full transition-all hover:bg-gray-100"
                    >
                        <span class="flex items-center gap-2">
                            <span class="material-symbols-outlined">map</span> 여행지 리스트 챌린지
                        </span>
                    </router-link>
                </div>
            </div>
                <div id="stampChallenge" class="transition-all duration-300 ease-in-out">
                    <h2 class="text-2xl font-bold text-center mb-8">스탬프 챌린지</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div v-for="mission in missions" :key="mission.mission_id">
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
                                <h3 class="text-lg font-semibold text-center">{{ mission.mission_id }}</h3>
                                <p class="text-gray-500 text-center mt-2">{{ mission.description }}</p>
                                <router-link  :to="`/challenge/stamp/${mission.type}`"
                                    class="mt-4 py-2 px-4 bg-primary-500 text-white rounded-full hover:bg-primary-600 transition-colors transform hover:scale-105 active:scale-95"
                                >
                                    도전하기
                                </router-link>
                            </div>
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
                                            전통적인 한옥과 좁은 골목길이 있는 역사적인 지역입니다. 다양한 문화 체험도
                                            가능합니다.
                                        </p>
                                        <div class="flex flex-wrap gap-2">
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                >역사</span
                                            >
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                >문화</span
                                            >
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
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
                                            한국에서 가장 유명한 해변 중 하나로, 아름다운 해안선과 다양한 식당, 카페가
                                            있습니다.
                                        </p>
                                        <div class="flex flex-wrap gap-2">
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                >바다</span
                                            >
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                >맛집</span
                                            >
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
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
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                >자연</span
                                            >
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
                                                >일출</span
                                            >
                                            <span class="bg-primary-100 text-primary-800 px-3 py-1 rounded-full text-sm"
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
            
        </div>
    </div>
</template>


<script setup>
const missions = [
  { type: 1, mission_id: '감성 사진 스탬프', description: '특별한 순간을 사진에 담아보세요', icon:"emotion" },
  { type: 2, mission_id: '혼밥 스탬프', description: '혼자서 맛있는 식사를 즐겨보세요', icon:"soloeat" },
    { type: 3, mission_id: '도보 스탬프', description: '만보를 채워보세요', icon: "stepcnt" },
    { type: 4, mission_id: '문화 체험 스탬프', description: '다양한 문화를 체험해보세요', icon: "culture" },
    { type: 5, mission_id: '밤하늘 감상 스탬프', description: '밤하늘의 별을 감상해보세요', icon: "night" },
  { type: 6, mission_id: '감성 산책 스탬프', description: '여유로운 산책을 즐겨보세요', icon:"walk" },
]
</script>

