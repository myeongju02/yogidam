<template>
  <!-- Hero Section -->
  <div class="mb-12 ">
    <div class="relative h-[400px] rounded-2xl overflow-hidden mb-6">
      <img src="https://images.unsplash.com/photo-1501785888041-af3ef285b470" alt="Scenic landscape view"
        class="w-full h-full object-cover" />
      <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex flex-col justify-end p-8">
        <h2 class="text-3xl text-white font-bold mb-2">나만의 힐링 여행을 시작하세요</h2>
        <p class="text-white/90 mb-6 max-w-md">미션과 기록을 통해 즐겁고 의미 있는 여행을 시작해 보세요</p>
        <!-- 시작하기 버튼: 여행계획 페이지로 이동 -->
        <router-link to="/tour/plan"
          class="bg-white text-primary-700 px-6 py-2 rounded-full w-fit hover:bg-primary-50 transition-transform hover:scale-105">
          시작하기
        </router-link>
      </div>
    </div>
    <div class="bg-white rounded-xl p-6 shadow-sm">
      <div class="flex justify-between items-center mb-4">
        <h2 class="text-xl font-bold">오늘의 추천 관광지</h2>
        <div class="flex items-center space-x-2">
          <span class="material-symbols-outlined text-blue-500">
            location_on
          </span>
          <span class="text-sm">현재 위치: 서울 강남구</span>
          <button class="text-sm text-primary-600 hover:underline">
            위치 변경
          </button>
        </div>
      </div>
      <!-- 태그 필터 버튼 -->
      <div class="flex space-x-2 mb-4 overflow-x-auto pb-2">
        <button v-for="tag in tags" :key="tag" @click="onTagClick(tag)" :class="[
          'px-4 py-1 rounded-full text-sm whitespace-nowrap transition-colors',
          selectedTag === tag
            ? 'bg-primary-600 text-white'
            : 'bg-gray-100 hover:bg-gray-200'
        ]">
          {{ tag }}
        </button>
      </div>
      <!-- 관광지 리스트 -->
      <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4">
        <div v-for="spot in visibleSpots" :key="spot.contentid"
          class="bg-gray-50 rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-all transform hover:-translate-y-1">
          <div class="relative h-[160px]">
            <img :src="spot.firstimage" :alt="spot.title" class="w-full h-full object-cover" />
            <span class="absolute top-2 right-2 bg-white/90 px-2 py-1 rounded-full text-xs font-medium">
              ⭐ {{ spot.rating }}
            </span>
          </div>
          <div class="p-4">
            <h3 class="font-bold">{{ spot.title }}</h3>
            <p class="text-sm text-gray-600">{{ spot.category }}</p>
            <div class="flex items-center justify-between mt-2">
              <button class="text-primary-600 text-sm hover:underline" @click="goToPlanWithSearch(spot.title)">
                자세히
              </button>
            </div>
            <div class="flex flex-wrap gap-1 mt-2">
              <span v-for="tag in spot.tags" :key="tag" class="bg-blue-100 text-blue-600 text-xs px-2 py-0.5 rounded">{{
                tag }}</span>
            </div>
          </div>
        </div>
        <div v-if="visibleSpots.length === 0" class="col-span-full text-center text-gray-400 py-8">
          해당 태그에 맞는 관광지가 없습니다.
        </div>
      </div>
      <div v-if="filteredSpots.length > 4 && !showAll" class="text-center mt-6">
        <button class="inline-flex items-center px-4 py-2 rounded-md bg-gray-100 hover:bg-gray-200 transition-colors"
          @click="showAll = true">
          더 보기 <span class="material-symbols-outlined ml-1">expand_more</span>
        </button>
      </div>
    </div>
  </div>


  <!-- ... 이하 기존 챌린지, 마이페이지, 내 여행 기록 등 기존 UI 그대로 ... -->
  <div class="mb-12">
    <div class="bg-white rounded-xl p-6 shadow-sm">
      <h2 class="text-xl font-bold mb-4">진행 중인 챌린지</h2>
      <p class="text-gray-600 mb-6">참여하고 포인트와 뱃지를 획득하세요!</p>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <div
    v-for="challenge in challenges"
    :key="challenge.type"
    class="border border-gray-200 rounded-xl overflow-hidden hover:border-primary-300 transition-all hover:shadow-md"
  >
    <div class="h-[160px] relative bg-gradient-to-r ..." :class="challenge.color">
      <div class="absolute inset-0 flex items-center justify-center">
        <span class="material-symbols-outlined text-white text-5xl">{{ challenge.icon }}</span>
      </div>
    </div>
    <div class="p-4">
      <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold">{{ challenge.title }}</h3>
        <span class="bg-green-100 text-green-700 text-xs px-2 py-1 rounded-full">NEW!</span>
      </div>
      <div v-if="userStore.user">
      <p class="text-sm text-gray-600 mb-3">{{ challenge.desc }}</p>
      <div class="mb-3">
        <div class="h-2 bg-gray-100 rounded-full">
          <div
            class="h-full bg-primary-500 rounded-full transition-all duration-300"
            :style="{ width: challenge.percent + '%' }"
          ></div>
        </div>
        <div class="flex justify-between text-xs mt-1">
          <span>{{ challenge.progress.done }}/10 완료</span>
          <span>포인트: {{ challenge.point }}</span>
        </div>
      </div>
      <router-link
        :to="`/challenge/stamp/${challenge.type}`"
        class="w-full block py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors text-center"
      >
        도전하기
      </router-link>
      </div>
      <div else>
         <span class="text-gray-400 text-xs">로그인하면 진척도를 볼 수 있습니다.</span>
      </div>
      </div>
    </div>
      </div>
    </div>
  </div>
  <div class="mb-12">
    <div class="bg-white rounded-xl p-6 shadow-sm">
      <h2 class="text-xl font-bold mb-4">내 여행 기록</h2>
      <!-- 내 여행 기록: 내 후기 게시글 표시 -->
      <div v-if="myReviews.length > 0" class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
        <div v-for="review in myReviews" :key="review.id" class="bg-gray-50 rounded-lg p-4 shadow-sm"
          @click="goToReviewDetail(review.id)">
          <div class="font-semibold mb-1">{{ review.title }}</div>
          <div class="text-xs text-gray-500 mb-2">{{ review.date }}</div>
          <div class="text-sm text-gray-700 mb-2 line-clamp-2">{{ review.content }}</div>
          <div class="flex flex-wrap gap-1">
            <span v-for="tag in review.tags" :key="tag"
              class="bg-green-100 text-green-600 text-xs px-2 py-0.5 rounded">#{{ tag }}</span>
          </div>
        </div>
      </div>
      <div v-else class="bg-gray-50 rounded-lg p-4 mb-6 text-center text-gray-500">
        아직 작성한 여행 후기가 없습니다.
      </div>
      <!-- 이하 기존 "여행 기록이란?" 설명 등 기존 UI 그대로 -->
      <details class="group">
        <summary
          class="flex justify-between items-center cursor-pointer list-none bg-gray-50 rounded-lg p-4 hover:bg-gray-100 transition-colors">
          <h3 class="font-medium">여행 기록이란?</h3>
          <span class="material-symbols-outlined transform group-open:rotate-180 transition-transform">
            expand_more
          </span>
        </summary>
        <div class="p-4 bg-gray-50 rounded-b-lg mt-1">
          <p class="text-sm text-gray-600 mb-2">여행 기록을 통해 당신의 소중한 경험을 저장하고 공유할 수 있습니다.</p>
          <ul class="list-disc list-inside text-sm text-gray-600 space-y-1">
            <li>방문한 장소, 맛집, 숙소 정보 기록</li>
            <li>사진과 함께 특별한 순간 저장</li>
            <li>여행 경로 지도로 보기</li>
            <li>다른 여행자들과 경험 공유</li>
          </ul> <br>
          <router-link to="/community"
            class="mt-4 px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
            기록하기
          </router-link>
        </div>
      </details>
    </div>
  </div>
  <!-- ... 이하 기존 마이페이지 등 기존 UI 그대로 ... -->
</template>


<script setup>
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from '@/stores/user';
import axios from 'axios';

const router = useRouter();
const myReviews = ref([]);
const userStore = useUserStore();
const currentUser = userStore.user?.id || 'guest';
const myPlans = ref([]);

//const userId = userStore.user.id;


onMounted(async () => {
  if (userStore.isLogin && userStore.user) {
    const userId = userStore.user.id;
    for (const challenge of challenges.value) {
      const res = await axios.get("/api/challenge/progress", {
        params: { userId, type: challenge.type }
      });
      challenge.progress = res.data;
      challenge.percent = challenge.progress.total === 0
        ? 0
        : Math.round((challenge.progress.done / 10) * 100);
    }
  }

  loadMyPlans();
  loadMyReviews();
})

import { watch } from 'vue';

const challenges = ref([
  {
    type: 1,
    title: "나만의 감성 사진",
    desc: "특별한 순간을 사진에 담아보세요",
    icon: "photo_camera",
    color: "from-blue-500 to-purple-500",
    point: 10,
    progress: { done: 0, total: 0 },
    percent: 0,
  },
  {
    type: 3,
    title: "도보 챌린지",
    desc: "여행을 즐기며 만보를 채워보세요.",
    icon: "spa",
    color: "from-green-500 to-teal-500",
    point: 10,
    progress: { done: 0, total: 0 },
    percent: 0,
  },
  {
    type: 2,
    title: "혼밥 챌린지",
    desc: "혼자서도 맛있는 식사를 즐기는 떠나보세요.",
    icon: "restaurant",
    color: "from-yellow-500 to-orange-500",
    point: 20,
    progress: { done: 0, total: 0 },
    percent: 0,
  }
]);

// 로그인 상태가 바뀔 때마다 진척도 API 호출
watch(
  () => userStore.isLogin,
  async (isLogin) => {
    if (isLogin && userStore.user) {
      const userId = userStore.user.id;
      for (const challenge of challenges.value) {
        const res = await axios.get("/api/challenge/progress", {
          params: { userId, type: challenge.type }
        });
        challenge.progress = res.data;
        challenge.percent = challenge.progress.total === 0
          ? 0
          : Math.round((challenge.progress.done / 10) * 100);
      }
    } else {
      // 로그아웃 시 진척도 초기화
      for (const challenge of challenges.value) {
        challenge.progress = { done: 0, total: 0 };
        challenge.percent = 0;
      }
    }
  },
  { immediate: true } // 컴포넌트 마운트 시에도 한 번 실행
);


function goToReviewDetail(id) {
  router.push({ name: 'BoardDetail', params: { id } })
}

const loadMyReviews = async () => {
  try {
    const res = await axios.get('/api/boards/my', { params: { userId: currentUser } });
    myReviews.value = res.data || [];
  } catch (e) {
    myReviews.value = [];
  }
};

const loadMyPlans = async () => {
  try {
    const res = await axios.get('/api/plans', { params: { userId: currentUser } });
    myPlans.value = res.data || [];
  } catch (e) {
    myPlans.value = [];
  }
};




function goToPlanWithSearch(title) {
  router.push({ path: '/tour/plan', query: { search: title } })
}
// 오늘의 추천 관광지 태그
const tags = [
  '전체',
  '혼밥하기 좋은',
  '조용한 장소',
  '인증샷 명소',
  '카페',
  '자연 경관'
]
const selectedTag = ref('전체')
const showAll = ref(false)
// 관광지 데이터 (카테고리별 설명 포함)
const spots = ref([
  // 1. 전체 (핵심 명소)
  {
    contentid: '1',
    title: '서울숲',
    firstimage: 'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
    rating: 4.8,
    category: '복합공원',
    desc: '자연, 산책, 인증샷, 카페 모두 가능한 힐링 명소',
    tags: ['전체', '인증샷 명소', '자연 경관', '카페']
  },
  {
    contentid: '2',
    title: '성수동',
    firstimage: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    rating: 4.7,
    category: '트렌디 거리',
    desc: '트렌디한 카페와 핫플 모음',
    tags: ['전체', '카페']
  },
  {
    contentid: '3',
    title: '연남동',
    firstimage: 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
    rating: 4.6,
    category: '감성 거리',
    desc: '혼밥, 조용한 분위기, 예쁜 카페',
    tags: ['전체', '혼밥하기 좋은', '카페', '조용한 장소']
  },
  {
    contentid: '4',
    title: '북촌 한옥마을',
    firstimage: 'https://images.unsplash.com/photo-1540998145333-e2eef1a9822d',
    rating: 4.8,
    category: '역사거리',
    desc: '조용한 골목, 인증샷, 역사적 분위기',
    tags: ['전체', '조용한 장소', '인증샷 명소']
  },

  // 2. 혼밥하기 좋은
  {
    contentid: '5',
    title: '혼밥인의만찬 (강남 등)',
    firstimage: 'https://images.unsplash.com/photo-1519864600265-abb23847ef2c',
    rating: 4.5,
    category: '1인 식당',
    desc: '1인 식당 전문 프랜차이즈',
    tags: ['혼밥하기 좋은']
  },
  {
    contentid: '6',
    title: '멘야산다이메 (홍대)',
    firstimage: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    rating: 4.6,
    category: '일본 라멘',
    desc: '바 좌석 위주의 일본 라멘집',
    tags: ['혼밥하기 좋은']
  },
  {
    contentid: '7',
    title: '이태원 함바그',
    firstimage: 'https://images.unsplash.com/photo-1523987355523-c7b5b0723c6e',
    rating: 4.7,
    category: '스테이크 함박',
    desc: '정갈한 1인 스테이크 함박 식당',
    tags: ['혼밥하기 좋은']
  },
  {
    contentid: '8',
    title: '파스타리카 (서울대입구)',
    firstimage: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    rating: 4.5,
    category: '파스타',
    desc: '1인 좌석이 잘 되어 있는 파스타집',
    tags: ['혼밥하기 좋은']
  },

  // 3. 조용한 장소
  {
    contentid: '9',
    title: '서울도서관',
    firstimage: 'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2',
    rating: 4.7,
    category: '도서관',
    desc: '클래식하고 조용한 열람실',
    tags: ['조용한 장소']
  },
  {
    contentid: '10',
    title: '백사실계곡',
    firstimage: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    rating: 4.6,
    category: '계곡',
    desc: '도심 속 조용한 자연 계곡',
    tags: ['조용한 장소', '자연 경관']
  },
  {
    contentid: '11',
    title: '불광천 산책길',
    firstimage: 'https://images.unsplash.com/photo-1465101178521-c1a9136a3c5c',
    rating: 4.5,
    category: '산책로',
    desc: '한적한 강변 산책로',
    tags: ['조용한 장소', '자연 경관']
  },
  {
    contentid: '12',
    title: '마포 석유비축기지',
    firstimage: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    rating: 4.4,
    category: '복합 공간',
    desc: '평일엔 매우 한적한 복합 공간',
    tags: ['조용한 장소']
  },

  // 4. 인증샷 명소
  {
    contentid: '13',
    title: 'DDP LED 장미정원',
    firstimage: 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
    rating: 4.7,
    category: '야경 포토스팟',
    desc: '야경 포토스팟',
    tags: ['인증샷 명소']
  },
  {
    contentid: '14',
    title: '익선동',
    firstimage: 'https://images.unsplash.com/photo-1507358522600-9f71e620c44e',
    rating: 4.6,
    category: '한옥거리',
    desc: '한옥과 현대적 감성의 조화',
    tags: ['인증샷 명소', '카페']
  },
  {
    contentid: '15',
    title: '남산타워 전망대',
    firstimage: 'https://images.unsplash.com/photo-1548115184-bc6544d06a58',
    rating: 4.8,
    category: '전망대',
    desc: '서울 전체를 담은 인증샷',
    tags: ['인증샷 명소', '자연 경관']
  },
  {
    contentid: '16',
    title: '서울식물원 온실',
    firstimage: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    rating: 4.7,
    category: '식물원',
    desc: '이국적인 느낌의 식물 인증샷',
    tags: ['인증샷 명소', '자연 경관']
  },

  // 5. 카페
  {
    contentid: '17',
    title: '카페 Layered (연남동)',
    firstimage: 'https://images.unsplash.com/photo-1519864600265-abb23847ef2c',
    rating: 4.6,
    category: '카페',
    desc: '스콘과 브런치, 인스타 감성',
    tags: ['카페']
  },
  {
    contentid: '18',
    title: 'Anthracite (한남/합정)',
    firstimage: 'https://images.unsplash.com/photo-1523987355523-c7b5b0723c6e',
    rating: 4.7,
    category: '카페',
    desc: '로스팅 맛집, 빈티지한 분위기',
    tags: ['카페']
  },
  {
    contentid: '19',
    title: '오월의 종 (망원동)',
    firstimage: 'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2',
    rating: 4.5,
    category: '카페',
    desc: '디저트 맛집 + 고요한 분위기',
    tags: ['카페', '조용한 장소']
  },
  {
    contentid: '20',
    title: '서울 앤드유 카페 (성수)',
    firstimage: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    rating: 4.5,
    category: '카페',
    desc: '루프탑에서 인증샷까지 가능',
    tags: ['카페', '인증샷 명소']
  },

  // 6. 자연 경관
  {
    contentid: '21',
    title: '하늘공원 (월드컵공원 내)',
    firstimage: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    rating: 4.8,
    category: '공원',
    desc: '억새밭과 탁 트인 전망',
    tags: ['자연 경관']
  },
  {
    contentid: '22',
    title: '남산 순환산책로',
    firstimage: 'https://images.unsplash.com/photo-1465101178521-c1a9136a3c5c',
    rating: 4.7,
    category: '산책로',
    desc: '숲길과 서울 전경',
    tags: ['자연 경관']
  },
  {
    contentid: '23',
    title: '북한산 둘레길',
    firstimage: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    rating: 4.6,
    category: '등산로',
    desc: '가볍게 걷기 좋은 도심 인근 등산길',
    tags: ['자연 경관']
  },
  {
    contentid: '24',
    title: '서울숲 내 숲 산책로',
    firstimage: 'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
    rating: 4.7,
    category: '산책로',
    desc: '사슴공원과 잔잔한 자연',
    tags: ['자연 경관']
  }
])

function onTagClick(tag) {
  selectedTag.value = tag
  showAll.value = false
}

const filteredSpots = computed(() => {
  if (selectedTag.value === '전체') return spots.value
  return spots.value.filter(spot => spot.tags.includes(selectedTag.value))
})

const visibleSpots = computed(() => {
  return showAll.value ? filteredSpots.value : filteredSpots.value.slice(0, 4)
})

// // 내 여행 기록(후기) 더미 데이터 (실제에선 API로 받아오면 됨)
// const myReviews = ref([
//   {
//     id: 1,
//     title: '경복궁에서의 힐링 산책',
//     date: '2025-05-25',
//     content: '경복궁은 조용하고 아름다워서 산책하기 정말 좋아요. 사진 찍기에도 딱!',
//     tags: ['조용한 장소', '인증샷 명소']
//   },
//   {
//     id: 2,
//     title: '한강공원에서 혼밥과 인증샷!',
//     date: '2025-05-20',
//     content: '한강공원에서 도시락 먹고 인증샷도 남겼어요. 추천합니다.',
//     tags: ['혼밥하기 좋은', '자연 경관']
//   }
// ])
</script>