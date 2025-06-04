<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/main.css">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
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
	<div id="webcrumbs">
		<div
			class="w-[400px] p-8 bg-white rounded-xl shadow-lg transition-transform hover:shadow-xl hover:scale-[1.01] mx-auto md:mx-0">
			<h2 class="text-2xl font-bold mb-6 text-primary-600">로그인</h2>

			<form class="space-y-4" action="/member/login" method="post">
				<div class="space-y-2">
				
					<label for="username" class="block font-medium">아이디</label> 
					<input type="text" name="id" value="${cookie.loginId.value != null ? cookie.loginId.value : ''}"
					class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all"
						placeholder="아이디를 입력하세요">
					
					<!-- <input
						type="text" id="id" name="id"
						class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all"
						placeholder="아이디를 입력하세요" /> -->
				</div>
				<div class="flex flex-col space-y-2">
						<label class="text-sm font-medium text-gray-700">비밀번호</label>
						<div class="flex">
							<input type="password" name="password"
								class="flex-grow px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-300"
								placeholder="비밀번호를 입력하세요" />
						</div>
					</div>
				<div class="flex items-center">
					<input type="checkbox" id="remember-me" name="remember-id"  checked
						class="w-4 h-4 text-primary-600 border-gray-300 rounded focus:ring-primary-500" />
					<label for="remember-me" class="ml-2 text-sm">아이디 저장</label> <a
						href="#"
						class="ml-auto text-sm text-gray-600 hover:text-primary-600 hover:underline transition-colors">
						비밀번호 찾기 </a>
				</div>
				<button type="submit"
					class="w-full py-3 bg-primary-600 text-white font-medium rounded-lg hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2 transition-colors">
					로그인</button>
				<div class="mt-4 text-center">
					<span class="text-gray-600">계정이 없으신가요?</span> <a
						href="/member/regist-member-form"
						class="ml-2 font-medium text-primary-600 hover:text-primary-700 hover:underline transition-colors">
						회원가입 </a>
				</div>
			</form>
		</div>
	</div>

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
							"50" : "#fdf6fd",
							"100" : "#f8edfa",
							"200" : "#f2d9f5",
							"300" : "#eabbec",
							"400" : "#dd93df",
							"500" : "#cb68cd",
							"600" : "#ba57ba",
							"700" : "#923990",
							"800" : "#773174",
							"900" : "#632c60",
							"950" : "#3f133c",
							"DEFAULT" : "#ba57ba"
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