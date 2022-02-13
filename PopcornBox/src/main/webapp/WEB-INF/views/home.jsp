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

			<div> <!-- 검색 기능 UI -->
<form name="search" align="right" style="margin-right:40px;" method = "get"  
action ="Search.jsp" onsubmit="return keyword_check()">
                    <select name="type">
                        <option value="1">제목</option>
                        <option value="2">배우</option>
                        <option value="3">감독</option>
                        <option value="4">쟝르</option>


<!-- align : 정렬 , style : 스타일 정보 포함 (margin : 여백 설정) , 
method : 전달 방식 ,  action : submit 시 이동 경로 ,
onsubmit : submit 클릭시 호출 조건 (true 일 때 action으로 넘어감 )-->

<td>

  <input type="text" name="keyword"> 

  </td>

<td>

<input type="submit" value="search">

</td>  

</form>
            
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
				<li><a href="./board/main">자유게시판</a></li>
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