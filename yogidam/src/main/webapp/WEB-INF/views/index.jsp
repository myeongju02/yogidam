<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main page</title>
<style>
@import
	url(https://fonts.googleapis.com/css2?family=Poppins&display=swap);

@import
	url(https://fonts.googleapis.com/css2?family=Roboto&display=swap);

@import
	url(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200)
	;

@import
	url(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css)
	;
</style>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="/css/main.css">
</head>


<body>
	<div id="webcrumbs">
		<div class="w-[1200px] p-6 font-sans bg-gray-50">

			<%@ include file="/WEB-INF/views/fragments/header.jsp"%>


			<main>
				<section class="mb-12">
					<div class="relative h-[400px] rounded-2xl overflow-hidden mb-6">
						<img
							src="https://images.unsplash.com/photo-1501785888041-af3ef285b470"
							alt="Scenic landscape view" class="w-full h-full object-cover"
							keywords="travel, landscape, nature, scenic view" />
						<div
							class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex flex-col justify-end p-8">
							<h2 class="text-3xl text-white font-bold mb-2">나만의 힐링 여행을
								시작하세요</h2>
							<p class="text-white/90 mb-6 max-w-md">혼자여도 좋은 여행, 당신의 성향에 맞는
								장소를 찾아드립니다.</p>
							<button
								class="bg-white text-primary-700 px-6 py-2 rounded-full w-fit hover:bg-primary-50 transition-transform hover:scale-105">
								시작하기</button>
						</div>
					</div>
					<div class="bg-white rounded-xl p-6 shadow-sm">
						<div class="flex justify-between items-center mb-4">
							<h2 class="text-xl font-bold">오늘의 추천 관광지</h2>
							<div class="flex items-center space-x-2">
								<span class="material-symbols-outlined text-blue-500">
									location_on </span> <span class="text-sm">현재 위치: 서울 강남구</span>
								<button class="text-sm text-primary-600 hover:underline">
									위치 변경</button>
							</div>
						</div>
						<div class="flex space-x-2 mb-4 overflow-x-auto pb-2">
							<button
								class="px-4 py-1 bg-primary-600 text-white rounded-full text-sm whitespace-nowrap">
								전체</button>
							<button
								class="px-4 py-1 bg-gray-100 rounded-full text-sm hover:bg-gray-200 transition-colors whitespace-nowrap">
								혼밥하기 좋은</button>
							<button
								class="px-4 py-1 bg-gray-100 rounded-full text-sm hover:bg-gray-200 transition-colors whitespace-nowrap">
								조용한 장소</button>
							<button
								class="px-4 py-1 bg-gray-100 rounded-full text-sm hover:bg-gray-200 transition-colors whitespace-nowrap">
								인증샷 명소</button>
							<button
								class="px-4 py-1 bg-gray-100 rounded-full text-sm hover:bg-gray-200 transition-colors whitespace-nowrap">
								카페</button>
							<button
								class="px-4 py-1 bg-gray-100 rounded-full text-sm hover:bg-gray-200 transition-colors whitespace-nowrap">
								자연 경관</button>
						</div>
						<div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4">
							<div
								class="bg-gray-50 rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-all transform hover:-translate-y-1">
								<div class="relative h-[160px]">
									<img
										src="https://images.unsplash.com/photo-1548115184-bc6544d06a58"
										alt="남산 서울타워" class="w-full h-full object-cover"
										keywords="남산 서울타워, 랜드마크, tourism, korea" /> <span
										class="absolute top-2 right-2 bg-white/90 px-2 py-1 rounded-full text-xs font-medium">
										⭐ 4.8 </span>
								</div>
								<div class="p-4">
									<h3 class="font-bold">남산 서울타워</h3>
									<p class="text-sm text-gray-600">랜드마크</p>
									<div class="flex items-center justify-between mt-2">
										<span
											class="text-xs bg-primary-100 text-primary-700 px-2 py-1 rounded-full">
											5km 이내 </span>
										<button class="text-primary-600 text-sm hover:underline">
											자세히</button>
									</div>
								</div>
							</div>
							<div
								class="bg-gray-50 rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-all transform hover:-translate-y-1">
								<div class="relative h-[160px]">
									<img
										src="https://images.unsplash.com/photo-1601621915196-2621bfb0cd6e"
										alt="한강공원" class="w-full h-full object-cover"
										keywords="한강공원, 공원, tourism, korea" /> <span
										class="absolute top-2 right-2 bg-white/90 px-2 py-1 rounded-full text-xs font-medium">
										⭐ 4.6 </span>
								</div>
								<div class="p-4">
									<h3 class="font-bold">한강공원</h3>
									<p class="text-sm text-gray-600">공원</p>
									<div class="flex items-center justify-between mt-2">
										<span
											class="text-xs bg-primary-100 text-primary-700 px-2 py-1 rounded-full">
											5km 이내 </span>
										<button class="text-primary-600 text-sm hover:underline">
											자세히</button>
									</div>
								</div>
							</div>
							<div
								class="bg-gray-50 rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-all transform hover:-translate-y-1">
								<div class="relative h-[160px]">
									<img
										src="https://images.unsplash.com/photo-1548117515-6bf235333382"
										alt="경복궁" class="w-full h-full object-cover"
										keywords="경복궁, 문화유산, tourism, korea" /> <span
										class="absolute top-2 right-2 bg-white/90 px-2 py-1 rounded-full text-xs font-medium">
										⭐ 4.9 </span>
								</div>
								<div class="p-4">
									<h3 class="font-bold">경복궁</h3>
									<p class="text-sm text-gray-600">문화유산</p>
									<div class="flex items-center justify-between mt-2">
										<span
											class="text-xs bg-primary-100 text-primary-700 px-2 py-1 rounded-full">
											5km 이내 </span>
										<button class="text-primary-600 text-sm hover:underline">
											자세히</button>
									</div>
								</div>
							</div>
							<div
								class="bg-gray-50 rounded-lg overflow-hidden shadow-sm hover:shadow-md transition-all transform hover:-translate-y-1">
								<div class="relative h-[160px]">
									<img
										src="https://images.unsplash.com/photo-1540306858653-e07f3ff23fe5"
										alt="북촌 한옥마을" class="w-full h-full object-cover"
										keywords="북촌 한옥마을, 문화거리, tourism, korea" /> <span
										class="absolute top-2 right-2 bg-white/90 px-2 py-1 rounded-full text-xs font-medium">
										⭐ 4.7 </span>
								</div>
								<div class="p-4">
									<h3 class="font-bold">북촌 한옥마을</h3>
									<p class="text-sm text-gray-600">문화거리</p>
									<div class="flex items-center justify-between mt-2">
										<span
											class="text-xs bg-primary-100 text-primary-700 px-2 py-1 rounded-full">
											5km 이내 </span>
										<button class="text-primary-600 text-sm hover:underline">
											자세히</button>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center mt-6">
							<button
								class="inline-flex items-center px-4 py-2 rounded-md bg-gray-100 hover:bg-gray-200 transition-colors">
								더 보기 <span class="material-symbols-outlined ml-1">expand_more</span>
							</button>
						</div>
					</div>
				</section>
				<section class="mb-12">
					<div class="bg-white rounded-xl p-6 shadow-sm">
						<h2 class="text-xl font-bold mb-4">진행 중인 챌린지</h2>
						<p class="text-gray-600 mb-6">참여하고 포인트와 뱃지를 획득하세요!</p>
						<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
							<div
								class="border border-gray-200 rounded-xl overflow-hidden hover:border-primary-300 transition-all hover:shadow-md">
								<div
									class="h-[160px] bg-gradient-to-r from-blue-500 to-purple-500 relative">
									<div class="absolute inset-0 flex items-center justify-center">
										<span class="material-symbols-outlined text-white text-5xl">
											photo_camera </span>
									</div>
								</div>
								<div class="p-4">
									<div class="flex justify-between items-start mb-2">
										<h3 class="font-bold">인증샷 챌린지</h3>
										<span
											class="bg-green-100 text-green-700 text-xs px-2 py-1 rounded-full">
											진행중 </span>
									</div>
									<p class="text-sm text-gray-600 mb-3">유명 관광지에서 창의적인 사진을 찍고
										인증하세요!</p>
									<div class="mb-3">
										<div class="h-2 bg-gray-100 rounded-full">
											<div class="h-full w-1/3 bg-primary-500 rounded-full"></div>
										</div>
										<div class="flex justify-between text-xs mt-1">
											<span>3/9 완료</span> <span>포인트: 500</span>
										</div>
									</div>
									<button
										class="w-full py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
										도전하기</button>
								</div>
							</div>
							<div
								class="border border-gray-200 rounded-xl overflow-hidden hover:border-primary-300 transition-all hover:shadow-md">
								<div
									class="h-[160px] bg-gradient-to-r from-green-500 to-teal-500 relative">
									<div class="absolute inset-0 flex items-center justify-center">
										<span class="material-symbols-outlined text-white text-5xl">
											spa </span>
									</div>
								</div>
								<div class="p-4">
									<div class="flex justify-between items-start mb-2">
										<h3 class="font-bold">힐링 마스터</h3>
										<span
											class="bg-yellow-100 text-yellow-700 text-xs px-2 py-1 rounded-full">
											새로운 </span>
									</div>
									<p class="text-sm text-gray-600 mb-3">조용한 자연 속에서 마음의 평화를 찾는
										여행을 경험하세요.</p>
									<div class="mb-3">
										<div class="h-2 bg-gray-100 rounded-full">
											<div class="h-full w-0 bg-primary-500 rounded-full"></div>
										</div>
										<div class="flex justify-between text-xs mt-1">
											<span>0/5 완료</span> <span>포인트: 700</span>
										</div>
									</div>
									<button
										class="w-full py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
										시작하기</button>
								</div>
							</div>
							<div
								class="border border-gray-200 rounded-xl overflow-hidden hover:border-primary-300 transition-all hover:shadow-md">
								<div
									class="h-[160px] bg-gradient-to-r from-yellow-500 to-orange-500 relative">
									<div class="absolute inset-0 flex items-center justify-center">
										<span class="material-symbols-outlined text-white text-5xl">
											restaurant </span>
									</div>
								</div>
								<div class="p-4">
									<div class="flex justify-between items-start mb-2">
										<h3 class="font-bold">혼밥 챌린지</h3>
										<span
											class="bg-blue-100 text-blue-700 text-xs px-2 py-1 rounded-full">
											인기 </span>
									</div>
									<p class="text-sm text-gray-600 mb-3">혼자서도 맛있는 식사를 즐기는 미식
										여행을 떠나보세요.</p>
									<div class="mb-3">
										<div class="h-2 bg-gray-100 rounded-full">
											<div class="h-full w-3/5 bg-primary-500 rounded-full"></div>
										</div>
										<div class="flex justify-between text-xs mt-1">
											<span>6/10 완료</span> <span>포인트: 600</span>
										</div>
									</div>
									<button
										class="w-full py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
										계속하기</button>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="mb-12">
					<div class="bg-white rounded-xl p-6 shadow-sm">
						<h2 class="text-xl font-bold mb-4">내 여행 기록</h2>
						<div class="bg-gray-50 rounded-lg p-4 mb-6">
							<div class="flex items-center justify-between">
								<div>
									<p class="text-gray-600">아직 기록된 여행이 없습니다.</p>
									<p class="text-sm mt-1">첫 여행을 기록해보세요!</p>
								</div>
								<button
									class="px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
									여행 기록하기</button>
							</div>
						</div>
						<details class="group">
							<summary
								class="flex justify-between items-center cursor-pointer list-none bg-gray-50 rounded-lg p-4 hover:bg-gray-100 transition-colors">
								<h3 class="font-medium">여행 기록이란?</h3>
								<span
									class="material-symbols-outlined transform group-open:rotate-180 transition-transform">
									expand_more </span>
							</summary>
							<div class="p-4 bg-gray-50 rounded-b-lg mt-1">
								<p class="text-sm text-gray-600 mb-2">여행 기록을 통해 당신의 소중한 경험을
									저장하고 공유할 수 있습니다.</p>
								<ul
									class="list-disc list-inside text-sm text-gray-600 space-y-1">
									<li>방문한 장소, 맛집, 숙소 정보 기록</li>
									<li>사진과 함께 특별한 순간 저장</li>
									<li>여행 경로 지도로 보기</li>
									<li>다른 여행자들과 경험 공유</li>
								</ul>
								<button
									class="mt-4 px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
									자세히 알아보기</button>
							</div>
						</details>
					</div>
				</section>
				<section id="mypage" class="hidden">
					<div class="bg-white rounded-xl p-6 shadow-sm">
						<div class="flex flex-col md:flex-row gap-6">
							<div class="md:w-1/3">
								<div class="bg-gray-50 p-6 rounded-xl">
									<div class="flex flex-col items-center">
										<div
											class="w-24 h-24 bg-gray-200 rounded-full overflow-hidden mb-4">
											<img
												src="https://images.unsplash.com/photo-1511367461989-f85a21fda167?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3MzkyNDZ8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8MTc0NjE1OTI5OHww&amp;ixlib=rb-4.0.3&amp;q=80&amp;w=1080"
												alt="User profile" class="w-full h-full object-cover"
												keywords="profile, avatar, user" />
										</div>
										<h2 class="text-xl font-bold mb-1">여행하는토끼</h2>
										<p class="text-sm text-gray-600">가입일: 2023.05.15</p>
										<div class="w-full mt-6 p-3 bg-primary-50 rounded-lg">
											<h3 class="font-medium text-center mb-2">나의 여행 성향</h3>
											<div class="flex flex-wrap justify-center gap-2">
												<span
													class="bg-primary-100 text-primary-700 px-3 py-1 rounded-full text-xs">
													힐링 위주 </span> <span
													class="bg-primary-100 text-primary-700 px-3 py-1 rounded-full text-xs">
													자연 탐험 </span> <span
													class="bg-primary-100 text-primary-700 px-3 py-1 rounded-full text-xs">
													맛집 탐방 </span>
											</div>
										</div>
										<button
											class="mt-4 w-full py-2 border border-gray-300 rounded-md hover:bg-gray-50 transition-colors">
											프로필 수정</button>
									</div>
								</div>
								<div class="mt-4 bg-gray-50 p-6 rounded-xl">
									<div class="flex justify-between items-center mb-4">
										<h3 class="font-bold">보유 포인트</h3>
										<span class="text-lg font-bold text-primary-600">
											2,450P </span>
									</div>
									<div class="border-t border-gray-200 pt-4">
										<h4 class="font-medium text-sm mb-3">교환 가능 아이템</h4>
										<div class="grid grid-cols-2 gap-2">
											<div
												class="bg-white p-2 rounded-lg text-center hover:shadow-md transition-shadow">
												<span
													class="material-symbols-outlined text-orange-500 text-2xl">
													coffee </span>
												<p class="text-xs font-medium mt-1">커피쿠폰</p>
												<p class="text-xs text-gray-600">1,000P</p>
											</div>
											<div
												class="bg-white p-2 rounded-lg text-center hover:shadow-md transition-shadow">
												<span
													class="material-symbols-outlined text-blue-500 text-2xl">
													movie </span>
												<p class="text-xs font-medium mt-1">영화티켓</p>
												<p class="text-xs text-gray-600">3,000P</p>
											</div>
										</div>
										<button
											class="mt-3 w-full py-1.5 text-sm text-primary-600 border border-primary-200 rounded-md hover:bg-primary-50 transition-colors">
											포인트샵 가기</button>
									</div>
								</div>
							</div>
							<div class="md:w-2/3">
								<div class="bg-gray-50 p-6 rounded-xl mb-6">
									<h3 class="font-bold mb-4">획득한 뱃지</h3>
									<div
										class="grid grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-3">
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-white transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-green-500 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													flight_takeoff </span>
											</div>
											<p class="text-xs font-medium text-center ">첫 여행</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-white transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-blue-500 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													photo_camera </span>
											</div>
											<p class="text-xs font-medium text-center ">사진작가</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-white transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-yellow-500 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													restaurant </span>
											</div>
											<p class="text-xs font-medium text-center ">맛집 탐험가</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-gray-200 transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-gray-400 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													tour </span>
											</div>
											<p class="text-xs font-medium text-center text-gray-500">
												명소 마스터</p>
											<p class="text-xs text-gray-500 mt-1">미획득</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-gray-200 transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-gray-400 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													hiking </span>
											</div>
											<p class="text-xs font-medium text-center text-gray-500">
												혼행 챔피언</p>
											<p class="text-xs text-gray-500 mt-1">미획득</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-gray-200 transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-gray-400 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													museum </span>
											</div>
											<p class="text-xs font-medium text-center text-gray-500">
												복돌이</p>
											<p class="text-xs text-gray-500 mt-1">미획득</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-white transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-green-500 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													spa </span>
											</div>
											<p class="text-xs font-medium text-center ">힐링 전문가</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-gray-200 transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-gray-400 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													attractions </span>
											</div>
											<p class="text-xs font-medium text-center text-gray-500">
												체험 고수</p>
											<p class="text-xs text-gray-500 mt-1">미획득</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-gray-200 transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-gray-400 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													wb_sunny </span>
											</div>
											<p class="text-xs font-medium text-center text-gray-500">
												일출 감상</p>
											<p class="text-xs text-gray-500 mt-1">미획득</p>
										</div>
										<div
											class="flex flex-col items-center p-3 rounded-lg bg-white transition-transform hover:scale-105">
											<div
												class="w-10 h-10 rounded-full bg-blue-500 flex items-center justify-center mb-2">
												<span class="material-symbols-outlined text-white">
													water </span>
											</div>
											<p class="text-xs font-medium text-center ">바다 여행</p>
										</div>
									</div>
								</div>
								<div class="bg-gray-50 p-6 rounded-xl">
									<h3 class="font-bold mb-4">회원 정보 관리</h3>
									<div class="space-y-4">
										<div>
											<label class="block text-sm font-medium mb-1"> 이메일 </label>
											<div class="flex">
												<input type="email" disabled=""
													class="w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md"
													value="user@example.com" />
												<button
													class="ml-2 px-3 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition-colors">
													변경</button>
											</div>
										</div>
										<div>
											<label class="block text-sm font-medium mb-1"> 비밀번호 </label>
											<button
												class="w-full px-3 py-2 border border-gray-300 rounded-md hover:bg-gray-100 transition-colors text-left">
												비밀번호 변경하기</button>
										</div>
										<div>
											<label class="block text-sm font-medium mb-1"> 닉네임 </label>
											<div class="flex">
												<input type="text"
													class="w-full px-3 py-2 border border-gray-300 rounded-md"
													value="여행하는토끼" />
												<button
													class="ml-2 px-3 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors">
													저장</button>
											</div>
										</div>
										<div class="pt-4 border-t border-gray-200">
											<details class="group">
												<summary
													class="list-none cursor-pointer flex items-center text-sm text-red-600">
													<span class="material-symbols-outlined mr-1 text-sm">
														delete </span> 회원 탈퇴하기 <span
														class="material-symbols-outlined ml-1 transform group-open:rotate-180 transition-transform">
														expand_more </span>
												</summary>
												<div class="mt-2 p-3 bg-red-50 rounded-md">
													<p class="text-sm mb-2">탈퇴 사유를 알려주시면 서비스 개선에 도움이 됩니다.</p>
													<select
														class="w-full px-3 py-2 border border-gray-300 rounded-md mb-2">
														<option>사유 선택</option>
														<option>서비스 이용이 불편함</option>
														<option>다른 서비스를 이용함</option>
														<option>콘텐츠가 부족함</option>
														<option>개인 정보 보호 우려</option>
														<option>기타</option>
													</select>
													<textarea
														class="w-full px-3 py-2 border border-gray-300 rounded-md h-20 mb-2"
														placeholder="추가 의견이 있으시면 자유롭게 남겨주세요."></textarea>
													<button
														class="w-full py-2 bg-red-600 text-white rounded-md hover:bg-red-700 transition-colors">
														탈퇴하기</button>
												</div>
											</details>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</main>
			<%@ include file="/WEB-INF/views/fragments/footer.jsp"%>
		</div>
	</div>


</body>
</html>
