<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
	</head>
	<body>
					 	<!-- 변경예정 -->
		<h1 onclick = "mainlogo">
			<a href="/pjt">메인로고</a>
			<ul>
				<li><span>${signInUserNickname}</span><span>님 환영합니다!</span>
			</ul>
		</h1>
		<ul>
			<li><a href="./userInfo">회원정보확인</a></li>
		</ul>
		<button type="button">전체활동기록</button>
		<button type="button">작성한 게시글</button>
		<button type="button">작성한 댓글</button>
		<button type="button">좋아요한 영화</button>
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>