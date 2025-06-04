<!-- /WEB-INF/views/fragments/header.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
	<script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="/css/main.css">

</head>


<header class="flex justify-between items-center mb-8">
	<div class="flex items-center space-x-2">
		<img alt="LogoImage" src="/img/여기담logo.png" style="width:50px; height:50px;">
		
		<h1 class="text-2xl font-bold text-primary-700">여기담</h1>
	</div>
	<nav class="hidden md:flex items-center space-x-6">
		<a href="/"
			class="font-medium hover:text-primary-600 transition-colors"> 홈 </a>
		<a href="/challenge/triplist"
			class="font-medium hover:text-primary-600 transition-colors"> 챌린지
		</a> 
		<a href="/tour/plan"
			class="font-medium hover:text-primary-600 transition-colors">
			여행계획 </a>
		<a href="#"
			class="font-medium hover:text-primary-600 transition-colors">
			여행기록 </a>
		<a href="#"
			class="font-medium hover:text-primary-600 transition-colors">
			커뮤니티 </a>
	</nav>
	<div class="flex items-center space-x-4">
		<sec:authorize access="isAuthenticated()">
		    <span><sec:authentication property="principal.nickname"/>님 환영합니다!</span>
			 <a href="/mypage/mypage-form"
				class="hidden sm:flex items-center space-x-1 hover:text-primary-600 transition-colors">
				<span class="material-symbols-outlined">person</span> <span>마이페이지</span>
			</a>
			<a href="/member/logout">
				<span>로그아웃</span>
			</a>
		</sec:authorize>
		<sec:authorize access="!isAuthenticated()">
		    <a href="/member/login"	class="px-4 py-2 rounded-full border border-primary-500 hover:bg-primary-50 transition-colors"> 로그인 </a>
		    <a href="/member/regist-member-form"
				class="px-4 py-2 bg-primary-600 text-white rounded-full hover:bg-primary-700 transition-colors">회원가입 </a>
		</sec:authorize>
	</div>
	<button class="md:hidden">
		<span class="material-symbols-outlined text-2xl">menu</span>
	</button>
</header>
