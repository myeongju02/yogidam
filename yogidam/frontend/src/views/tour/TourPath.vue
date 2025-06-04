<template>
  <div class="max-w-4xl mx-auto py-8 relative">
    <h2 class="text-2xl font-bold mb-6">최적 경로 보기</h2>

    <!-- 출발/도착 선택 섹션 -->
    <div class="bg-white p-4 rounded-lg shadow-md mb-6">
      <div class="flex gap-x-4">
        <div class="flex-1">
          <label class="block text-sm font-medium mb-2">출발지 선택</label>
          <select v-model="selectedStartId" class="w-full p-2 border rounded-md">
            <option v-for="spot in attractions" :value="spot.contentid" :key="spot.contentid">
              {{ spot.title }}
            </option>
          </select>
        </div>
        <div class="flex-1">
          <label class="block text-sm font-medium mb-2">도착지 선택</label>
          <select v-model="selectedEndId" class="w-full p-2 border rounded-md">
            <option v-for="spot in attractions" :value="spot.contentid" :key="spot.contentid">
              {{ spot.title }}
            </option>
          </select>
        </div>
        <button @click="findOptimalRoute"
          class="w-fit px-6 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors self-end">
          경로 찾기
        </button>
      </div>
    </div>

    <div class="flex flex-col md:flex-row gap-6">
      <!-- 지도 영역 -->
      <div class="md:w-2/3 shadow-lg rounded-lg overflow-hidden h-[500px] bg-gray-100 border border-gray-200 relative">
        <div id="tmap_route_map" ref="mapContainer" class="w-full h-full"></div>
      </div>

      <!-- 경로 리스트 -->
      <div class="md:w-1/3">
        <div class="bg-white shadow-md rounded-lg p-4 mb-4">
          <h3 class="font-medium mb-3">최적 경로 순서</h3>
          <div class="list-decimal ml-6">
            <ul v-for="(spot, idx) in orderedAttractions" :key="spot.contentid" class="mb-2">
              <span class="font-bold text-primary-600 mr-2">#{{ idx + 1 }}</span>
              {{ spot.title }}<br>
              <span class="text-xs text-gray-400">{{ spot.addr1 }}</span>
            </ul>
          </div>
          <div v-if="routeSummary" class="mt-4 text-sm text-gray-600">
            {{ routeSummary }}
          </div>
        </div>
      </div>
    </div>

    <button @click="goBack"
      class="px-4 py-2 rounded-full border border-primary-500 hover:bg-primary-50 transition-colors absolute right-6 bottom-6">
      목록으로
    </button>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';

const route = useRoute();
const router = useRouter();
const planId = route.params.planId;

const mapContainer = ref(null);
const map = ref(null);
const markerArr = ref([]);
const polylineArr = ref([]);
const attractions = ref([]);
const orderedAttractions = ref([]);
const selectedStartId = ref(null);
const selectedEndId = ref(null);
const routeSummary = ref('');

const selectedStart = computed(() =>
  attractions.value.find(spot => spot.contentid === selectedStartId.value)
);
const selectedEnd = computed(() =>
  attractions.value.find(spot => spot.contentid === selectedEndId.value)
);
const isSelectionValid = computed(() =>
  selectedStart.value &&
  selectedEnd.value &&
  selectedStartId.value !== selectedEndId.value
);

const loadAttractions = async () => {
  try {
    const res = await axios.get(`/api/plans/${planId}/attractions`);
    attractions.value = (res.data || []).map(spot => ({
      ...spot,
      mapx: parseFloat(spot.mapx),
      mapy: parseFloat(spot.mapy)
    }));
    if (attractions.value.length > 0) {
      selectedStartId.value = attractions.value[0].contentid;
      selectedEndId.value = attractions.value[attractions.value.length - 1].contentid;
      orderedAttractions.value = [...attractions.value];
    }
  } catch (e) {
    alert('관광지 정보를 불러오지 못했습니다.');
  }
};

function initTmap(centerLat, centerLng) {
  if (!window.Tmapv2) return;
  if (!map.value) {
    map.value = new window.Tmapv2.Map(mapContainer.value, {
      center: new window.Tmapv2.LatLng(centerLat, centerLng),
      width: '100%',
      height: '500px',
      zoom: 14,
      zoomControl: true,
      scrollwheel: true,
    });
  } else {
    map.value.setCenter(new window.Tmapv2.LatLng(centerLat, centerLng));
  }
  markerArr.value.forEach(m => m.setMap(null));
  markerArr.value = [];
  polylineArr.value.forEach(l => l.setMap(null));
  polylineArr.value = [];
}

function drawMarkers(spots) {
  markerArr.value.forEach(m => m.setMap(null));
  markerArr.value = [];
  spots.forEach((spot, idx) => {
    let icon = "https://yogidam.s3.ap-northeast-2.amazonaws.com/img/mapmarker.png";
    let iconSize = new window.Tmapv2.Size(24, 38);
    if (!spot.mapx || !spot.mapy || isNaN(spot.mapx) || isNaN(spot.mapy)) {
      console.warn('잘못된 좌표:', spot);
      return;
    }
    const marker = new window.Tmapv2.Marker({
      position: new window.Tmapv2.LatLng(spot.mapy, spot.mapx),
      icon: icon,
      iconSize: iconSize,
      map: map.value,
      title: spot.title,
    });
    markerArr.value.push(marker);
  });
}

function drawRoute(features, properties) {
  console.log('drawRoute features:', features); // features 배열 전체 확인

  polylineArr.value.forEach(l => l.setMap(null));
  polylineArr.value = [];
  const bounds = new window.Tmapv2.LatLngBounds();

  features.forEach(f => {
    if (f.geometry.type === 'LineString') {
      const coords = f.geometry.coordinates.map(
        ([lng, lat]) => {
          const latlng = new window.Tmapv2.LatLng(lat, lng);
          bounds.extend(latlng);
          return latlng;
        }
      );
      const polyline = new window.Tmapv2.Polyline({
        path: coords,
        strokeColor: "#A851A8",
        strokeWeight: 6,
        map: map.value,
      });
      polylineArr.value.push(polyline);
    } else if (f.geometry.type === 'Point') {
      const [lng, lat] = f.geometry.coordinates;
      bounds.extend(new window.Tmapv2.LatLng(lat, lng));
    }
  });

  // 지도 bounds 자동 맞춤
  if (!bounds.isEmpty()) {
    map.value.fitBounds(bounds);
  }

  // 경로 정보 표시 (옵션)
  if (properties) {
    routeSummary.value =
      `총 거리 : ${(properties.totalDistance / 1000).toFixed(1)}km ` +
      `총 시간 : ${(properties.totalTime / 60).toFixed(0)}분 ` +
      `총 요금 : ${properties.totalFare}원`;
    console.log('routeSummary:', routeSummary.value); // 추가
  } else {
    routeSummary.value = '';
  }
}


function findOptimalRoute() {
  if (!isSelectionValid.value) {
    alert('출발지와 도착지를 올바르게 선택해주세요.');
    return;
  }
  const waypoints = attractions.value.filter(
    spot =>
      spot.contentid !== selectedStart.value.contentid &&
      spot.contentid !== selectedEnd.value.contentid
  );
  const spots = [selectedStart.value, ...waypoints, selectedEnd.value];
  multiStopRoute(spots);
}


const multiStopRoute = async (spots) => {
  if (spots.length < 2) {
    orderedAttractions.value = spots;
    initTmap(spots[0].mapy, spots[0].mapx);
    drawMarkers(spots);
    routeSummary.value = '';
    return;
  }
  const start = spots[0];
  const end = spots[spots.length - 1];
  const passList = spots.slice(1, spots.length - 1)
    .map(spot => `${spot.mapx},${spot.mapy}`)
    .join('_');

  const reqData = {
    reqCoordType: "WGS84GEO",
    resCoordType: "WGS84GEO",
    startName: start.title,
    startX: Number(start.mapx),
    startY: Number(start.mapy),
    endName: end.title,
    endX: Number(end.mapx),
    endY: Number(end.mapy),
    searchOption: "0",
    passList: passList,
  };

  try {
    const { data } = await axios.post('/api/tmap/route/multistop', reqData);
    initTmap(start.mapy, start.mapx);
    orderedAttractions.value = spots;
    drawMarkers(orderedAttractions.value);
    drawRoute(data.features, data.properties);
  } catch (error) {
    alert('경로 안내에 실패했습니다.');
    orderedAttractions.value = spots;
    initTmap(spots[0].mapy, spots[0].mapx);
    drawMarkers(spots);
    routeSummary.value = '';
  }
};


function loadTmapScript() {
  return new Promise((resolve, reject) => {
    if (window.Tmapv2) return resolve();
    const script = document.createElement('script');
    script.src = "https://topopen.tmap.co.kr/tmapjs/v2.0.0/tmap.min.js";
    script.onload = () => resolve();
    script.onerror = () => reject();
    document.head.appendChild(script);
  });
}

const goBack = () => router.back();

onMounted(async () => {
  await loadTmapScript();
  await loadAttractions();
  if (attractions.value.length > 0) {
    initTmap(attractions.value[0].mapy, attractions.value[0].mapx);
    orderedAttractions.value = [...attractions.value];
    drawMarkers(orderedAttractions.value);
  }
});
</script>




