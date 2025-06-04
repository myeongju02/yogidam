<template>
  <div>
    <h2 class="text-2xl font-bold mb-6">관광지 검색</h2>
    <div class="relative mb-6">
      <div class="flex w-full items-center gap-2">
        <div class="flex w-1/2 gap-2">
          <select v-model="selectedSido" @change="loadSigunguList(selectedSido)"
            class="w-1/2 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-200 transition">
            <option value="">시/도 선택</option>
            <option value="">전체</option>
            <option v-for="sido in sidoList" :key="sido.code" :value="sido.code">
              {{ sido.name }}
            </option>
          </select>
          <select v-model="selectedSigungu" :disabled="!selectedSido"
            class="w-1/2 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-200 transition">
            <option value="">구/군 선택</option>
            <option v-for="sigungu in sigunguList" :key="sigungu.code" :value="sigungu.code">
              {{ sigungu.name }}
            </option>
          </select>
          <select v-model="selectedCategory"
            class="w-1/3 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-200 transition">
            <option value="">관광유형 선택</option>
            <option v-for="cat in categoryList" :key="cat.code" :value="cat.code">
              {{ cat.name }}
            </option>
          </select>
        </div>
        <div class="relative w-1/2">
          <input v-model="searchKeyword" type="text" placeholder="관광지명, 도시 또는 지역을 입력하세요"
            class="w-full py-3 px-4 pr-12 rounded-lg border border-gray-300 focus:outline-none focus:border-primary-500 focus:ring-2 focus:ring-primary-200 shadow-sm transition-all duration-300"
            @keyup.enter="onSearch" />
          <button @click="onSearch"
            class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-primary-500 transition-colors duration-300">
            <span class="material-symbols-outlined">search</span>
          </button>
        </div>
      </div>
      <div class="flex flex-wrap gap-2 mb-6">
        <span v-for="tag in tags" :key="tag"
          class="px-3 py-1 bg-gray-100 rounded-full text-sm hover:bg-primary-100 hover:text-primary-600 cursor-pointer transition-all duration-300"
          @click="onTagClick(tag)">
          #{{ tag }}
        </span>
      </div>
      <button @click="goToMyLocation" class="location-btn">내 위치로 가기</button>
    </div>
    <div class="flex flex-row lg:flex-row gap-6">
      <!-- 지도 -->
      <div
        class="lg:w-2/3 shadow-lg rounded-lg overflow-hidden h-[500px] bg-gray-100 border border-gray-200 relative group">
        <div id="map_div" ref="mapContainer" class="w-full h-full">
          <div
            class="absolute bottom-4 right-4 bg-white rounded-full p-2 shadow-md hover:shadow-lg transform hover:scale-105 transition-all duration-300 group-hover:opacity-100 opacity-80"
            @click="goToMyLocation">
            <span class="material-symbols-outlined">my_location</span>
          </div>
        </div>
      </div>
      <!-- 여행 계획/리스트 영역 -->
      <div class="lg:w-1/3">
        <!-- 임시 여행 리스트 (저장 전) -->
        <div class="bg-white shadow-md rounded-lg p-4 mb-4">
          <h3 class="font-medium mb-3">여행 리스트</h3>
          <input v-model="planTitle" placeholder="계획 제목" class="mb-2 w-full border px-2 py-1 rounded" />
          <input v-model="planStartDate" type="date" class="mb-2 w-full border px-2 py-1 rounded" />
          <input v-model="planEndDate" type="date" class="mb-2 w-full border px-2 py-1 rounded" />
          <div class="space-y-4">
            <div v-for="place in travelList" :key="place.contentid"
              class="flex gap-3 p-2 rounded-lg hover:bg-gray-50 transition-colors duration-300 cursor-pointer"
              @click="onPlaceClick(place)">
              <div class="h-16 w-16 rounded-md bg-gray-200 flex-shrink-0 overflow-hidden">
                <img :src="place.firstimage" :alt="place.title"
                  class="object-cover w-full h-full hover:scale-110 transition-transform duration-300" />
              </div>
              <div>
                <h4 class="font-medium">{{ place.title }}</h4>
                <p class="text-sm text-gray-500">{{ place.addr1 }}</p>
                <button @click.stop="deletePlace(place)" class="ml-2 text-xs text-red-500">삭제</button>
              </div>
            </div>
          </div>
          <button @click="deleteAll"
            class="w-full mt-2 py-2 text-sm bg-red-100 text-red-600 rounded-lg hover:bg-red-200 transition-all duration-300">
            전체 삭제
          </button>
          <button @click="saveTravelPlan"
            class="w-full mt-2 py-2 text-sm bg-primary-500 text-white rounded-lg hover:bg-primary-600 transition-all duration-300">
            여행 계획 저장
          </button>
        </div>
      </div>
    </div>
    <!-- 주변 관광지 UI는 기존대로 유지 -->
    <div class="mt-8 bg-gray-50 rounded-lg p-5 shadow-sm grid grid-cols-2 gap-6">

      <!-- 내 여행 계획 목록 -->
      <div class="mb-6 bg-white rounded-lg shadow p-5">
        <h4 class="font-semibold text-lg mb-4">내 여행 계획</h4>
        <div class="space-y-2">
          <div v-for="plan in myPlans" :key="plan.planId"
            class="flex items-center justify-between p-3 rounded-lg hover:bg-gray-50 transition">
            <div class="flex items-center gap-3">
              <button @click="loadPlanAttractions(plan.planId)" class="text-primary-700 text-sm hover:underline">
                {{ plan.title }}
              </button>
              <span class="text-xs text-gray-400">{{ plan.startDate }} ~ {{ plan.endDate }}</span>
            </div>
            <button @click="deletePlan(plan.planId)"
              class="text-xs text-red-500 hover:text-red-700 px-2 py-1 rounded transition">
              삭제
            </button>
          </div>
        </div>
      </div>

      <!-- 선택한 계획의 관광지 리스트 -->
      <div v-if="selectedPlanId" class="bg-white rounded-lg shadow p-5 mb-6">
        <div class="flex items-center justify-between mb-4">
          <h5 class="font-semibold text-base">선택한 계획의 관광지</h5>
          <button @click="goToRoutePage(selectedPlanId)"
            class="bg-primary-500 text-white px-4 py-1 rounded hover:bg-primary-600 transition text-sm font-medium">
            경로 보기
          </button>
        </div>
        <div class="space-y-3">
          <div v-for="place in planAttractions" :key="place.contentid"
            class="flex gap-4 items-center p-3 rounded-lg hover:bg-gray-50 transition">
            <div class="h-16 w-16 rounded-md bg-gray-200 flex-shrink-0 overflow-hidden shadow">
              <img :src="place.firstimage" :alt="place.title" class="object-cover w-full h-full" />
            </div>
            <div>
              <h4 class="font-medium text-base">{{ place.title }}</h4>
              <p class="text-sm text-gray-500">{{ place.addr1 }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, watch, nextTick } from 'vue';
import axios from 'axios';
import { useUserStore } from '@/stores/user';
import { useRouter } from 'vue-router';
import { useRoute } from 'vue-router';

const router = useRouter();
const userStore = useUserStore();
const currentUser = userStore.user?.id || 'guest';
const route = useRoute();

const selectedSido = ref('');
const selectedSigungu = ref('');
const selectedCategory = ref('');
const searchKeyword = ref('');
const sidoList = ref([]);
const sigunguList = ref([]);
const categoryList = ref([]);
const mapCenter = ref({ lat: 37.5665, lng: 126.9780 });
const markers = ref([]);
const travelList = ref([]);        // 임시 여행 계획(저장 전)
const planAttractions = ref([]);   // 선택한 계획의 관광지(조회용)
const nearbySpots = ref([]);
const tags = ref(['자연', '역사', '쇼핑', '맛집']);
const mapContainer = ref('');
const map = ref(null);
const markerArr = ref([]);
const searchResults = ref([]);
const infoWindow = ref(null);

const planTitle = ref('');
const planStartDate = ref('');
const planEndDate = ref('');
const myPlans = ref([]);
const selectedPlanId = ref('');

// 지도 초기화
onMounted(() => {
  loadSidoList();
  loadCategories();
  initTmap();
  loadMyPlans();
  if (route.query && route.query.search) {
    searchKeyword.value = route.query.search
    onSearch()
  }
});

const searchQuery = computed(() => route.query?.search || '')
watch(searchQuery, (newVal) => {
  if (newVal) {
    searchKeyword.value = newVal
    nextTick(() => {
      onSearch()
    })
  }
}, { immediate: true })

const goToRoutePage = (planId) => {
  router.push(`/tour/${planId}`);
  // 또는 router.push(`/route/${planId}`);
};

const initTmap = async () => {
  map.value = new Tmapv2.Map(mapContainer.value, {
    center: new Tmapv2.LatLng(37.5652045, 126.98702028),
    zoom: 18,
    zoomControl: true,
    scrollwheel: true,
    zIndexInfoWindow: 9999
  });
};

const loadSidoList = async () => {
  try {
    const res = await axios.get('/api/tour/regions/sido');
    sidoList.value = res.data || [];
  } catch (error) {
    sidoList.value = [];
  }
};

const loadSigunguList = async (sidoCode) => {
  try {
    if (!sidoCode) {
      sigunguList.value = [];
      return;
    }
    const res = await axios.get('/api/tour/regions/sigungu', { params: { sidoCode } });
    sigunguList.value = res.data || [];
  } catch (e) {
    sigunguList.value = [];
  }
};

const loadCategories = async () => {
  try {
    const res = await axios.get('/api/tour/categories');
    categoryList.value = res.data || [];
  } catch (e) {
    categoryList.value = [];
  }
};

const onSearch = async () => {
  const params = {
    areaCode: selectedSido.value,
    sigunguCode: selectedSigungu.value,
    cat1: selectedCategory.value
  };

  let spots;
  if (searchKeyword.value && searchKeyword.value.trim() !== '') {
    // 검색어가 있으면 키워드 기반 검색
    spots = await fetchData('/api/tour/search', {
      ...params,
      keyword: searchKeyword.value
    });
  } else {
    // 검색어가 없으면 지역 기반 검색
    spots = await fetchData('/api/tour/search/region', params);
  }

  if (spots && spots.length > 0) {
    updateMapMarkers(spots);
    searchResults.value = spots;
  } else {
    searchResults.value = [];
    updateMapMarkers([]);
    alert('검색 결과가 없습니다.');
  }
};

const onPlaceClick = (place) => {
  if (map.value && place.mapy && place.mapx) {
    map.value.setCenter(new window.Tmapv2.LatLng(parseFloat(place.mapy), parseFloat(place.mapx)));
  }
  showDetail(place);
};

const addToTravelList = (spot) => {
  // API 응답이 contentid(소문자)로 내려오므로, contentid만 사용
  const contentId = spot.contentid;
  if (!contentId) {
    alert('유효하지 않은 관광지입니다.');
    return;
  }
  const isDuplicate = travelList.value.some(item => item.contentid === contentId);
  if (isDuplicate) {
    alert('이미 리스트에 있습니다');
    return;
  }


  console.log(spot);
  travelList.value.push({ ...spot, contentid: contentId });

};

const onMarkerClick = (spot) => {
  if (infoWindow.value && infoWindow.value.getMap()) {
    infoWindow.value.setMap(null);
    infoWindow.value = null;
  }
  const contentHtml = `
    <div style="min-width:200px;max-width:270px;padding:8px;">
      <div style="font-weight:bold;font-size:16px;">${spot.title}</div>
      <div style="font-size:12px;color:#666;margin-bottom:4px;">${spot.addr1 || ''}</div>
      <button id="addToListBtn" style="margin-right:8px;background:#3182f6;color:#fff;padding:4px 8px;border:none;border-radius:4px;cursor:pointer;">리스트 추가</button>
      <button id="closeInfoBtn" style="background:#eee;color:#333;padding:4px 8px;border:none;border-radius:4px;cursor:pointer;">닫기</button>
    </div>
  `;
  infoWindow.value = new window.Tmapv2.InfoWindow({
    position: new window.Tmapv2.LatLng(parseFloat(spot.mapy), parseFloat(spot.mapx)),
    content: contentHtml,
    type: 2,
    map: map.value,
    zIndex: 9999
  });
  setTimeout(() => {
    const addBtn = document.getElementById('addToListBtn');
    if (addBtn) addBtn.onclick = () => addToTravelList(spot);
    const closeBtn = document.getElementById('closeInfoBtn');
    if (closeBtn) {
      closeBtn.onclick = () => {
        if (infoWindow.value && infoWindow.value.getMap()) {
          infoWindow.value.setMap(null);
          infoWindow.value = null;
        }
      };
    }
  }, 10);
};

const deletePlace = (place) => {
  const key = place.contentid;
  travelList.value = travelList.value.filter(item => item.contentid !== key);
};

const deleteAll = () => {
  travelList.value = [];
};

const saveTravelPlan = async () => {
  if (travelList.value.length === 0) {
    alert('저장할 여행지가 없습니다.');
    return;
  }
  if (!planTitle.value) {
    alert('계획 제목을 입력하세요.');
    return;
  }
  try {
    await axios.post('/api/plans/save', {
      userId: currentUser,
      title: planTitle.value,
      startDate: planStartDate.value || null,
      endDate: planEndDate.value || null,
      attractions: travelList.value
    });
    loadMyPlans();
    // 저장 성공 시 nearbySpots에 추가
    nearbySpots.value.push(...travelList.value);
    travelList.value = [];
    planTitle.value = '';
    planStartDate.value = '';
    planEndDate.value = '';

    alert('여행 계획이 저장되었습니다!');
  } catch (e) {
    console.error('저장 오류:', e.response?.data);
    alert('저장에 실패했습니다.');
  }
};

const loadMyPlans = async () => {
  try {
    const res = await axios.get('/api/plans', { params: { userId: currentUser } });
    myPlans.value = res.data || [];
  } catch (e) {
    myPlans.value = [];
    alert('내 여행 계획을 불러오지 못했습니다.');
  }
};

const loadPlanAttractions = async (planId) => {
  try {
    selectedPlanId.value = planId;
    const res = await axios.get(`/api/plans/${planId}/attractions`);
    planAttractions.value = res.data || [];
  } catch (e) {
    travelList.value = [];
    alert('계획의 관광지를 불러오지 못했습니다.');
  }
};

const deletePlan = async (planId) => {
  try {
    await axios.delete(`/api/plans/${planId}`);
    if (selectedPlanId.value === planId) {
      planAttractions.value = [];
      selectedPlanId.value = '';
    }
    loadMyPlans();
  } catch (e) {
    alert('계획 삭제에 실패했습니다.');
  }
};

const updateMapMarkers = async (spots) => {
  markerArr.value.forEach(marker => marker.setMap(null));
  markerArr.value = [];
  if (!map.value) return;
  let bounds = new window.Tmapv2.LatLngBounds();
  spots.forEach(spot => {
    const lat = parseFloat(spot.mapy);
    const lng = parseFloat(spot.mapx);
    const marker = new window.Tmapv2.Marker({
      position: new window.Tmapv2.LatLng(lat, lng),
      map: map.value,
      title: spot.title,
    });
    markerArr.value.push(marker);
    bounds.extend(new window.Tmapv2.LatLng(lat, lng));
    marker.addListener("click", () => onMarkerClick(spot));
  });
  if (spots.length > 0) {
    await nextTick();
    map.value.fitBounds(bounds);
  }
  markers.value = spots;
};

const goToMyLocation = () => {
  if (!navigator.geolocation) {
    alert('Geolocation을 지원하지 않는 브라우저입니다.');
    return;
  }
  navigator.geolocation.getCurrentPosition(
    (position) => {
      const lat = position.coords.latitude;
      const lng = position.coords.longitude;
      mapCenter.value = { lat, lng };
      if (map.value) {
        map.value.setCenter(new window.Tmapv2.LatLng(lat, lng));
      }
    },
    (error) => {
      alert('위치 정보를 가져올 수 없습니다.');
    }
  );
};

const fetchData = async (url, params = {}) => {
  try {
    const response = await axios.get(url, { params });
    return response.data;
  } catch (error) {
    alert('데이터를 불러오는 데 실패했습니다.');
  }
};

const showDetail = (spot) => {
  // 상세보기 구현 (모달 등)
};

const onTagClick = (tag) => {
  searchKeyword.value = tag;
  onSearch();
};

</script>
