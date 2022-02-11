<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popcorn Box</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container-fluid">
		<header class="jumbotron text-center">
			<h1>메인 페이지</h1>
		</header>

		<nav>
			<ul>
				<c:if test="${empty signInUserNickname}">
					<%-- 로그인 되어 있지 않은 경우 --%>
					<li><a href="./user/register">회원가입</a></li>
					<li><a href="./user/signin">로그인</a></li>
				</c:if>
				<c:if test="${not empty signInUserNickname}">
					<%-- 로그인 되어 있는 경우 --%>
					<li><a href="./user/register">회원가입</a></li>
					<li><span>${signInUserNickname}</span> <a
						href="./user/signout">로그아웃</a></li>
				</c:if>
				<li><a href="./user/mypage">마이페이지</a></li>
				<li><a href="./movie/mainlist">무비목록테스트</a></li>
			</ul>
		</nav>
		<div>
			<input type="hidden" name="msg" value="${msg}" />
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function() {
			var message = '${msg}';
			if (message != null && message != '') {
				alert(message);
			}
		});
	</script>
</body>
</html>
