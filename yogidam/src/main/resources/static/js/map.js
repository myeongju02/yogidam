
document.addEventListener('DOMContentLoaded', function() {
	// Kakao Maps SDK 동적 로드
	(function loadKakaoMap() {
		const script = document.createElement('script');
		script.src = '//dapi.kakao.com/v2/maps/sdk.js?appkey=67c5589e8fdcb574ae32622b3b168fd1&autoload=false';
		script.onload = () => { 
			// SDK 로드가 완료된 후에만 kakao.maps.load 호출
			kakao.maps.load(initializeMap);
		};
		document.head.appendChild(script);
	})();

	// 전역 변수
	let map;
	let markers = [];

	// 지도 초기화
	function initializeMap() {
		const container = document.getElementById('map');
		const options = {
			center: new kakao.maps.LatLng(37.5665, 126.9780), // 서울시청 기본 위치
			level: 6
		};
		map = new kakao.maps.Map(container, options);

		// 내 위치 버튼 이벤트
		document.querySelector('.location-btn').addEventListener('click', moveToCurrentLocation);

		// 초기 시/도 목록 로드
		loadSidoList();
		loadCategories();
	}

	// 현재 위치로 이동
	function moveToCurrentLocation() {
		if (!navigator.geolocation) {
			alert('Geolocation을 지원하지 않는 브라우저입니다.');
			return;
		}

		navigator.geolocation.getCurrentPosition(
			position => {
				const lat = position.coords.latitude;
				const lng = position.coords.longitude;
				map.setCenter(new kakao.maps.LatLng(lat, lng));
			},
			error => {
				alert('위치 정보를 가져올 수 없습니다.');
				console.error('Geolocation error:', error);
			}
		);
	}

	// 시/도 목록 로드
	function loadSidoList() {
		fetch('/api/tour/regions/sido')
			.then(response => response.json())
			.then(data => {
				const sidoSelect = document.getElementById('sidoSelect');
				sidoSelect.innerHTML = '<option value="">전체</option>'; // "전체" 옵션 추가
				data.forEach(region => {
					const option = new Option(region.name, region.code);
					sidoSelect.appendChild(option);
				});
			})
			.catch(handleFetchError);
	}

	// 구/군 목록 로드
	function loadSigunguList(sidoCode) {
		fetch(`/api/tour/regions/sigungu?sidoCode=${sidoCode}`)
			.then(response => response.json())
			.then(data => {
				const sigunguSelect = document.getElementById('sigunguSelect');
				sigunguSelect.innerHTML = '<option value="">전체</option>'; // "전체" 옵션 추가
				data.forEach(region => {
					const option = new Option(region.name, region.code);
					sigunguSelect.appendChild(option);
				});
				sigunguSelect.disabled = false;
			})
			.catch(handleFetchError);
	}
	
	// 관광유형(대분류) 목록 로드
	function loadCategories() {
	    fetch('/api/tour/regions/categories')
	        .then(response => response.json())
	        .then(data => {
	            const categorySelect = document.getElementById('categorySelect');
	            categorySelect.innerHTML = '<option value="">전체</option>';
	            data.forEach(cat => {
	                const option = new Option(cat.name, cat.code);
	                categorySelect.appendChild(option);
	            });
	        });
	}

	// 검색 실행
	function executeSearch() {
		const params = new URLSearchParams({
			keyword: document.getElementById('searchInput').value,
			areaCode: document.getElementById('sidoSelect').value,
			sigunguCode: document.getElementById('sigunguSelect').value
		});

		/*		fetch(`/api/tour/regions/search?${params}`)
					.then(response => response.json())
					.then(data => updateMapMarkers(data))
					.catch(handleFetchError);
		*/
		fetch(`/api/tour/regions/search?${params}`)
			.then(response => {
				if (!response.ok) throw new Error('API 요청 실패: ' + response.status);
				return response.json();
			})
			.then(data => {
				if (!Array.isArray(data)) throw new Error('API 응답이 배열이 아님');
				updateMapMarkers(data);
			})
			.catch(handleFetchError);
	}

	// 마커 업데이트
	function updateMapMarkers(spots) {
		// 기존 마커 제거
		markers.forEach(marker => marker.setMap(null));
		markers = [];
		const bounds = new kakao.maps.LatLngBounds();

		let infowindows = [];

		spots.forEach((spot, idx) => {
			// ✅ DTO 필드명 확인: mapy(위도), mapx(경도)
			const lat = parseFloat(spot.mapy); // 문자열 → 숫자 변환 필수
			const lng = parseFloat(spot.mapx);

			// 좌표 유효성 검사 추가
			if (isNaN(lat) || isNaN(lng)) {
				console.error('Invalid coordinates:', spot);
				return;
			}

			const marker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(lat, lng), // 올바른 필드 사용
				map: map
			});
			markers.push(marker);
			bounds.extend(marker.getPosition());

			// 인포윈도우 내용 (변경 없음)
			const infowindowId = `infowindow-close-btn-${idx}`;
			const iwContent = `
			    <div style="position:relative; padding:15px; width:240px; border-radius:8px; background:#fff; box-shadow:0 2px 8px rgba(0,0,0,0.17);">
			        <button 
			            id="${infowindowId}" 
			            style="
			                position:absolute; top:10px; right:10px; width:22px; height:22px;
			                background:#eee; border-radius:50%; cursor:pointer; text-align:center; line-height:22px; font-size:16px; color:#888; font-weight:bold;
			                transition:background 0.2s;
			            "
			            title="닫기"
			        >×</button>
			        <div style="font-weight:bold; font-size:16px; margin-bottom:10px; color:#333;">${spot.title}</div>
			        <div style="font-size:13px; color:#666; margin-bottom:10px;">
			            <div style="margin-bottom:5px;">${spot.addr1 || '주소 정보 없음'}</div>
			            <div>${spot.tel || '연락처 정보 없음'}</div>
			        </div>
			        <button 
			            onclick="addToList('${spot.title.replace(/'/g, "\\'")}')" 
			            style="
			                background:#AA52AA;
			                color:white;
			                border:none;
			                padding:9px 0;
			                border-radius:16px;
			                cursor:pointer;
			                width:100%;
			                font-size:14px;
			                font-weight:500;
			                margin-top:8px;
			                transition:background 0.2s;
			            ">
			            내 리스트에 추가
			        </button>
			    </div>
			    `;
			const infowindow = new kakao.maps.InfoWindow({ content: iwContent });
			infowindows.push(infowindow);

			kakao.maps.event.addListener(marker, 'click', () => {
				if (infowindow.getMap()) {
					infowindow.close();
				} else {
					infowindow.open(map, marker);
				}
			});
		});

		// 지도 범위 조정
		if (spots.length > 0) {
			map.setBounds(bounds);
			kakao.maps.event.trigger(map, 'resize'); // 지도 강제 갱신
		}
		// 닫기 버튼 이벤트 리스너
		document.removeEventListener('click', closeHandler);
		function closeHandler(e) {
			if (e.target.id && e.target.id.startsWith('infowindow-close-btn-')) {
				infowindows.forEach(iw => iw.close());
			}
		}
		document.addEventListener('click', closeHandler);
	}

	// 공통 함수
	function populateSelect(elementId, data) {
		const select = document.getElementById(elementId);
		data.forEach(item => {
			select.appendChild(new Option(item.name, item.code));
		});
	}

	function handleFetchError(error) {
		console.error('Fetch error:', error);
		alert('데이터를 불러오는 데 실패했습니다.');
	}


	// 인포윈도우에서 호출 (리스트 추가)
	function addToList(title) {
		console.log(`${title}이(가) 리스트에 추가되었습니다.`);
		alert(`${title}이(가) 리스트에 추가되었습니다.`);
		// 여기에 실제 추가 로직 구현
	}

	// 이벤트 리스너 등록
	document.getElementById('sidoSelect').addEventListener('change', function() {
		if (this.value) {
			loadSigunguList(this.value);
		} else {
			document.getElementById('sigunguSelect').disabled = true;
		}
	});

	document.getElementById('searchButton').addEventListener('click', executeSearch);
});