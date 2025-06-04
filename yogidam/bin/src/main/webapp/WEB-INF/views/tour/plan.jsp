<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>plan</title>
<style>
@import
	url(https://fonts.googleapis.com/css2?family=Poppins&display=swap);

@import
	url(https://fonts.googleapis.com/css2?family=Roboto&display=swap);

@import
	url(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200)
	;
</style>
</head>
<body>
	<div id="webcrumbs" class="w-[1250px] p-6 font-sans bg-gray-50">
		<div class="w-[1200px] p-6 font-sans">
			<%@ include file="/WEB-INF/views/fragments/header.jsp"%>
			<div class="mb-8">
				<h2 class="text-2xl font-bold mb-6">관광지 검색</h2>
				<div class="relative mb-6">
					<div class="flex w-full items-center gap-2">
						<div class="flex w-1/2 gap-2">
							<select id="sidoSelect" name="sidoCode"
								class="w-1/3 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-200 transition">
								<option value="">시/도 선택</option>
								<option value="">전체</option>
								<c:forEach var="sido" items="${sidoList}">
									<option value="${sido.code}"
										<c:if test="${param.sidoCode == sido.code}">selected</c:if>>
										${sido.name}</option>
								</c:forEach>
							</select>
							<select id="sigunguSelect" name="sigunguCode"
								class="w-1/3 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-200 transition"
								<c:if test="${empty sigunguList}">disabled</c:if>>
								<option value="">구/군 선택</option>
								<c:forEach var="sigungu" items="${sigunguList}">
									<option value="${sigungu.code}"
										<c:if test="${param.sigunguCode == sigungu.code}">selected</c:if>>
										${sigungu.name}</option>
								</c:forEach>
							</select>
							<select id=categorySelect name="cat1"
								class="w-1/3 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-200 transition">
								<option value="">관광유형 선택</option>
								<c:forEach var="cat" items="${categoryList}">
									<option value="${cat.code}"
										<c:if test="${param.cat1 == cat.code}">selected</c:if>>
										${cat.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="relative w-1/2">
							<input id="searchInput" type="text"
								placeholder="관광지명, 도시 또는 지역을 입력하세요"
								class="w-full py-3 px-4 pr-12 rounded-lg border border-gray-300 focus:outline-none focus:border-primary-500 focus:ring-2 focus:ring-primary-200 shadow-sm transition-all duration-300" />
							<button id="searchButton"
								class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-primary-500 transition-colors duration-300">
								<span class="material-symbols-outlined">search</span>
							</button>
						</div>
					</div>
					<button id="myLocationBtn" class="location-btn">내 위치로 가기</button>
					<div class="flex flex-wrap gap-2 mb-6">
						<span
							class="px-3 py-1 bg-gray-100 rounded-full text-sm hover:bg-primary-100 hover:text-primary-600 cursor-pointer transition-all duration-300">
							#서울 </span> <span
							class="px-3 py-1 bg-gray-100 rounded-full text-sm hover:bg-primary-100 hover:text-primary-600 cursor-pointer transition-all duration-300">
							#제주도 </span> <span
							class="px-3 py-1 bg-gray-100 rounded-full text-sm hover:bg-primary-100 hover:text-primary-600 cursor-pointer transition-all duration-300">
							#부산 </span> <span
							class="px-3 py-1 bg-gray-100 rounded-full text-sm hover:bg-primary-100 hover:text-primary-600 cursor-pointer transition-all duration-300">
							#경주 </span> <span
							class="px-3 py-1 bg-gray-100 rounded-full text-sm hover:bg-primary-100 hover:text-primary-600 cursor-pointer transition-all duration-300">
							#강원도 </span> <span
							class="px-3 py-1 bg-gray-100 rounded-full text-sm hover:bg-primary-100 hover:text-primary-600 cursor-pointer transition-all duration-300">
							#전주 </span>
					</div>
					<div class="flex flex-row lg:flex-row gap-6">
						<div
							class="lg:w-2/3 shadow-lg rounded-lg overflow-hidden h-[500px] bg-gray-100 border border-gray-200 relative group">
							<div class="absolute inset-0 flex items-center justify-center">
								<div id="map" class="w-full h-full"></div>

							</div>
							<div
								class="absolute bottom-4 right-4 bg-white rounded-full p-2 shadow-md hover:shadow-lg transform hover:scale-105 transition-all duration-300 group-hover:opacity-100 opacity-80">
								<span class="material-symbols-outlined">my_location</span>
							</div>
						</div>
						<div class="lg:w-1/3">
							<div class="bg-white shadow-md rounded-lg p-4 mb-4">
								<h3 class="font-medium mb-3">여행 리스트</h3>
								<div class="space-y-4">
									<!-- TODO : plan.jsp 여행 리스트 만들기 
							여기서 부터 리스트 제작 여행 경로에 추가 및 삭제 기능 구현 필요 -->
									<div
										class="flex gap-3 p-2 rounded-lg hover:bg-gray-50 transition-colors duration-300 cursor-pointer">
										<div
											class="h-16 w-16 rounded-md bg-gray-200 flex-shrink-0 overflow-hidden">
											<img
												src="https://images.unsplash.com/photo-1656013831021-28c17c92b5d7?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHwlRUElQjIlQkQlRUIlQjMlQjUlRUElQjYlODF8ZW58MHx8fHwxNzQ2NTc2ODQzfDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080"
												alt="경복궁"
												class="object-cover w-full h-full hover:scale-110 transition-transform duration-300"
												keywords="경복궁, 서울, 고궁, 관광지" />
										</div>
										<div>
											<h4 class="font-medium">경복궁</h4>
											<p class="text-sm text-gray-500">서울 종로구</p>
											<div class="flex items-center mt-1">
												<span
													class="material-symbols-outlined text-yellow-400 text-sm">
													star </span> <span class="text-xs ml-1">4.7</span>
											</div>
										</div>
									</div>
									<div
										class="flex gap-3 p-2 rounded-lg hover:bg-gray-50 transition-colors duration-300 cursor-pointer">
										<div
											class="h-16 w-16 rounded-md bg-gray-200 flex-shrink-0 overflow-hidden">
											<img
												src="https://images.unsplash.com/photo-1650994150048-186e95d4e85b?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHwlRUQlOTUlQjQlRUMlOUElQjQlRUIlOEMlODB8ZW58MHx8fHwxNzQ2NTc2ODU3fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080"
												alt="해운대"
												class="object-cover w-full h-full hover:scale-110 transition-transform duration-300"
												keywords="해운대, 부산, 해변, 관광지" />
										</div>
										<div>
											<h4 class="font-medium">해운대 해수욕장</h4>
											<p class="text-sm text-gray-500">부산 해운대구</p>
											<div class="flex items-center mt-1">
												<span
													class="material-symbols-outlined text-yellow-400 text-sm">
													star </span> <span class="text-xs ml-1">4.5</span>
											</div>
										</div>
									</div>
									<div
										class="flex gap-3 p-2 rounded-lg hover:bg-gray-50 transition-colors duration-300 cursor-pointer">
										<div
											class="h-16 w-16 rounded-md bg-gray-200 flex-shrink-0 overflow-hidden">
											<img
												src="https://images.unsplash.com/photo-1738235465257-3a1d378e04c1?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHwlRUMlODQlQjElRUMlODIlQjAlRUMlOUQlQkMlRUMlQjYlOUMlRUIlQjQlODl8ZW58MHx8fHwxNzQ2NTc2ODk3fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080"
												alt="성산일출봉"
												class="object-cover w-full h-full hover:scale-110 transition-transform duration-300"
												keywords="성산일출봉, 제주도, 관광지" />
										</div>
										<div>
											<h4 class="font-medium">성산일출봉</h4>
											<p class="text-sm text-gray-500">제주 서귀포시</p>
											<div class="flex items-center mt-1">
												<span
													class="material-symbols-outlined text-yellow-400 text-sm">
													star </span> <span class="text-xs ml-1">4.8</span>
											</div>
										</div>
									</div>
								</div>
								<button
									class="w-full mt-4 py-2 text-sm text-gray-600 hover:text-primary-600 border border-gray-200 rounded-lg hover:border-primary-300 transition-all duration-300">
									더보기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="mt-8 bg-gray-50 rounded-lg p-5 shadow-sm">
					<h3 class="font-medium mb-3">내 주변 관광지</h3>
					<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
						<div
							class="bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-shadow duration-300 group">
							<div class="h-32 bg-gray-200 relative overflow-hidden">
								<img
									src="https://images.unsplash.com/photo-1620144959655-1d797e251a1b?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHwlRUMlOUQlQjglRUMlODIlQUMlRUIlOEYlOTl8ZW58MHx8fHwxNzQ2NTc2OTk0fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080"
									alt="인사동"
									class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
									keywords="인사동, 서울, 전통, 관광지" />
								<div
									class="absolute top-2 right-2 bg-white/80 backdrop-blur-sm rounded-full p-1.5 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
									<span
										class="material-symbols-outlined text-primary-500 text-sm">
										favorite </span>
								</div>
							</div>
							<div class="p-3">
								<h4 class="font-medium">인사동</h4>
								<p class="text-xs text-gray-500 mb-2">서울 종로구 · 1.2km 거리</p>
								<div class="flex justify-between items-center">
									<div class="flex items-center">
										<span
											class="material-symbols-outlined text-yellow-400 text-sm">
											star </span> <span class="text-xs ml-1">4.3 (128)</span>
									</div>
									<button
										class="text-xs bg-primary-50 text-primary-600 px-2 py-1 rounded hover:bg-primary-100 transition-colors duration-300">
										상세보기</button>
								</div>
							</div>
						</div>
						<div
							class="bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-shadow duration-300 group">
							<div class="h-32 bg-gray-200 relative overflow-hidden">
								<img
									src="https://images.unsplash.com/photo-1746239989395-9aac1772db9e?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHwlRUIlODIlQTglRUMlODIlQjAlRUQlODMlODAlRUMlOUIlOEN8ZW58MHx8fHwxNzQ2NTc3MTI4fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080"
									alt="남산타워"
									class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
									keywords="남산타워, 서울, 타워, 관광지" />
								<div
									class="absolute top-2 right-2 bg-white/80 backdrop-blur-sm rounded-full p-1.5 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
									<span
										class="material-symbols-outlined text-primary-500 text-sm">
										favorite </span>
								</div>
							</div>
							<div class="p-3">
								<h4 class="font-medium">남산서울타워</h4>
								<p class="text-xs text-gray-500 mb-2">서울 중구 · 2.8km 거리</p>
								<div class="flex justify-between items-center">
									<div class="flex items-center">
										<span
											class="material-symbols-outlined text-yellow-400 text-sm">
											star </span> <span class="text-xs ml-1">4.6 (256)</span>
									</div>
									<button
										class="text-xs bg-primary-50 text-primary-600 px-2 py-1 rounded hover:bg-primary-100 transition-colors duration-300">
										상세보기</button>
								</div>
							</div>
						</div>
						<div
							class="bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-shadow duration-300 group">
							<div class="h-32 bg-gray-200 relative overflow-hidden">
								<img
									src="https://images.unsplash.com/photo-1648875839646-e94f38338657?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHwlRUIlOEYlOTklRUIlOEMlODAlRUIlQUMlQjh8ZW58MHx8fHwxNzQ2NTc3MjkzfDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080"
									alt="동대문시장"
									class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
									keywords="동대문, 서울, 쇼핑, 관광지" />
								<div
									class="absolute top-2 right-2 bg-white/80 backdrop-blur-sm rounded-full p-1.5 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
									<span
										class="material-symbols-outlined text-primary-500 text-sm">
										favorite </span>
								</div>
							</div>
							<div class="p-3">
								<h4 class="font-medium">동대문 디자인 플라자</h4>
								<p class="text-xs text-gray-500 mb-2">서울 중구 · 3.5km 거리</p>
								<div class="flex justify-between items-center">
									<div class="flex items-center">
										<span
											class="material-symbols-outlined text-yellow-400 text-sm">
											star </span> <span class="text-xs ml-1">4.4 (189)</span>
									</div>
									<button
										class="text-xs bg-primary-50 text-primary-600 px-2 py-1 rounded hover:bg-primary-100 transition-colors duration-300">
										상세보기</button>
								</div>
							</div>
						</div>
					</div>
					<button
						class="mt-4 py-2 px-4 text-sm border border-gray-300 rounded-lg hover:border-primary-400 hover:text-primary-600 mx-auto block transition-all duration-300">
						더 많은 장소 보기</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="/js/map.js"></script>

	<script src="https://cdn.tailwindcss.com"></script>
	<script>
		tailwind.config = {
			content : [ "./src/**/*.{html,js}" ],
			theme : {
				"name" : "Custom",
				"fontFamily" : {
					"sans" : [ "Poppins", "ui-sans-serif", "system-ui",
							"sans-serif", "\"Apple Color Emoji\"",
							"\"Segoe UI Emoji\"", "\"Segoe UI Symbol\"",
							"\"Noto Color Emoji\"" ]
				},
				"extend" : {
					"fontFamily" : {
						"title" : [ "Poppins", "ui-sans-serif", "system-ui",
								"sans-serif", "\"Apple Color Emoji\"",
								"\"Segoe UI Emoji\"", "\"Segoe UI Symbol\"",
								"\"Noto Color Emoji\"" ],
						"body" : [ "Roboto", "ui-sans-serif", "system-ui",
								"sans-serif", "\"Apple Color Emoji\"",
								"\"Segoe UI Emoji\"", "\"Segoe UI Symbol\"",
								"\"Noto Color Emoji\"" ]
					},
					"colors" : {
						"neutral" : {
							"50" : "#E0F7FA",
							"100" : "#D9F0F3",
							"200" : "#D3E8EB",
							"300" : "#CCE1E4",
							"400" : "#C5D9DC",
							"500" : "#BED2D5",
							"600" : "#5A6364",
							"700" : "#434A4B",
							"800" : "#2D3132",
							"900" : "#161919",
							"DEFAULT" : "#E0F7FA"
						},
						"primary" : {
							"50" : "#fcf7fc",
							"100" : "#f8eef9",
							"200" : "#f1dbf3",
							"300" : "#e7bfe8",
							"400" : "#d899d9",
							"500" : "#c370c5",
							"600" : "#aa52aa",
							"700" : "#8a4188",
							"800" : "#723670",
							"900" : "#5e315b",
							"950" : "#3c163a",
							"DEFAULT" : "#aa52aa"
						}
					}
				},
				"fontSize" : {
					"xs" : [ "12px", {
						"lineHeight" : "19.200000000000003px"
					} ],
					"sm" : [ "14px", {
						"lineHeight" : "21px"
					} ],
					"base" : [ "16px", {
						"lineHeight" : "25.6px"
					} ],
					"lg" : [ "18px", {
						"lineHeight" : "27px"
					} ],
					"xl" : [ "20px", {
						"lineHeight" : "28px"
					} ],
					"2xl" : [ "24px", {
						"lineHeight" : "31.200000000000003px"
					} ],
					"3xl" : [ "30px", {
						"lineHeight" : "36px"
					} ],
					"4xl" : [ "36px", {
						"lineHeight" : "41.4px"
					} ],
					"5xl" : [ "48px", {
						"lineHeight" : "52.800000000000004px"
					} ],
					"6xl" : [ "60px", {
						"lineHeight" : "66px"
					} ],
					"7xl" : [ "72px", {
						"lineHeight" : "75.60000000000001px"
					} ],
					"8xl" : [ "96px", {
						"lineHeight" : "100.80000000000001px"
					} ],
					"9xl" : [ "128px", {
						"lineHeight" : "134.4px"
					} ]
				},
				"borderRadius" : {
					"none" : "0px",
					"sm" : "6px",
					"DEFAULT" : "12px",
					"md" : "18px",
					"lg" : "24px",
					"xl" : "36px",
					"2xl" : "48px",
					"3xl" : "72px",
					"full" : "9999px"
				},
				"spacing" : {
					"0" : "0px",
					"1" : "4px",
					"2" : "8px",
					"3" : "12px",
					"4" : "16px",
					"5" : "20px",
					"6" : "24px",
					"7" : "28px",
					"8" : "32px",
					"9" : "36px",
					"10" : "40px",
					"11" : "44px",
					"12" : "48px",
					"14" : "56px",
					"16" : "64px",
					"20" : "80px",
					"24" : "96px",
					"28" : "112px",
					"32" : "128px",
					"36" : "144px",
					"40" : "160px",
					"44" : "176px",
					"48" : "192px",
					"52" : "208px",
					"56" : "224px",
					"60" : "240px",
					"64" : "256px",
					"72" : "288px",
					"80" : "320px",
					"96" : "384px",
					"px" : "1px",
					"0.5" : "2px",
					"1.5" : "6px",
					"2.5" : "10px",
					"3.5" : "14px"
				}
			},
			plugins : [],
			important : '#webcrumbs'
		};
	</script>
</body>
</html>