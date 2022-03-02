<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 | POPCORN BOX</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">

<script src="https://kit.fontawesome.com/a39158855c.js"
	crossorigin="anonymous"></script>

</head>
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<ul>
					<c:if test="${empty signInUserNickname}">
						<%-- 로그인 되어 있지 않은 경우 --%>
						<li><a href="../user/signin">로그인</a></li>
						<li><a href="../user/register">회원가입</a></li>
						<li><a href="../user/mypage">마이페이지</a></li>
					</c:if>
					<c:if test="${not empty signInUserNickname}">
						<%-- 로그인 되어 있는 경우 --%>
						<c:if test="${empty accessToken}">
							<%-- 일반 로그인의 경우 --%>
							<li><span>${signInUserNickname} 님</span></li>
							<li><a href="../user/signout">로그아웃</a></li>
							<li><a href="../user/mypage">마이페이지</a></li>
						</c:if>
						<c:if test="${not empty accessToken}">
							<%-- 카카오 로그인의 경우 --%>
							<li><span>${signInUserNickname} 님</span></li>
							<li><a
								href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">로그아웃</a></li>
							<li><a href="../user/mypage">마이페이지</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>POPCORN BOX</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7">
						<div class="header__top__left">
							<a href="../"><img src="../resources/img/popcornbox_logo.png"
								alt="logo"></a>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<c:if test="${empty signInUserNickname}">
									<%-- 로그인 되어 있지 않은 경우 --%>
									<a href="../user/signin"><i class="fa-solid fa-lock"></i>로그인</a>
									<a href="../user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
									<a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
								</c:if>
								<c:if test="${not empty signInUserNickname}">
									<%-- 로그인 되어 있는 경우 --%>
									<c:if test="${empty accessToken}">
										<%-- 일반 로그인의 경우 --%>
										<span>${signInUserNickname} 님</span>
										<br>
										<a href="../user/signout"><i class="fa-solid fa-lock"></i>로그아웃</a>
										<a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
									</c:if>
									<c:if test="${not empty accessToken}">
										<%-- 카카오 로그인의 경우 --%>
										<span>${signInUserNickname} 님</span>
										<br>
										<a
											href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
											<i class="fa-solid fa-lock"></i>로그아웃
										</a>
										<a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row" class="header__row__">

				<div class="col-md-7 col-md-4">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="../">홈</a></li>
							<li><a href="../movie/mainlist">차트</a></li>
							<li class="active"><a href="../board/main">커뮤니티</a></li>
							<li><a href="../event/main">이벤트</a></li>
						</ul>
					</nav>
				</div>
				<div class="search_option">
					<div class="header__nav__option">
						<div></div>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->


	<div class="contact__form">
		<form action="./update" method="post">

			<c:if test="${signInUserNickname == board.user_nickname}">
				<div style="margin-left: auto; margin-right: 30px;">
					<!-- 로그인 사용자 아이디와 글 작성자 아이디가 일치할 때만 수정 메뉴를 보여줌. -->
					<ul
						style="display: inline-flex; list-style: none; font-size: 14px;">

						<li><a id="menu-delete"
							href="./delete?board_no=${board.board_no}">삭제</a></li>
					</ul>
				</div>
			</c:if>

			<div>
				<input type="hidden" name="board_no" value="${board.board_no}"
					required readonly />
			</div>
			<div>
				<input type="hidden" name="board_update_time" value="<fmt:formatDate value="${board.board_update_time}" pattern="yyyy/MM/dd HH:mm" />"
					required readonly />
					
			</div>

			<div>
				<textarea id="board_title" name="board_title" maxlength="35"
					rows="1" onkeyup="resize(this)" required>${board.board_title}</textarea>


			</div>
			<div>
				<textarea id="board_content" name="board_content" rows="15"
					onkeyup="resize(this)" required autofocus>${board.board_content}
                        </textarea>
			</div>


			<div style="display: flex;">
				<a href="./main" class="primary-btn">수정 취소</a>
			
			<div style="width: 80%;"></div>
				<input class="primary-btn btn-outline-dark" type="submit" id="menu-update" value="수정 완료" style="color: #fff" />
			</div>


		</form>
	</div>



	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container" style="display: flex;">
			<div class="footer__about" style="width: 30%; margin: -10px;">
				<div class="footer__logo">
					<a href=""><img src="../resources/img/logo_gray.png"></a>
				</div>
			</div>
			<div class="footer_text">
				<div>
					<p
						footer_text" style="font-weight: 600; font-size: 12px; color: 555555;">(06234)
						서울특별시 강남구 테헤란로 124 4층</p>
					<p footer_text" style="font-weight: 600; font-size: 12px;">POP
						COMPANY | 대표 김유은 | 사업자 등록번호 11110 22220 3333</p>
					<p footer_text" style="font-weight: 600; font-size: 12px;">
						Copyright ©
						<script>
							document.write(new Date().getFullYear());
						</script>
						POPCORN BOX. All rights reserved
					</p>
					<p>
						<a href="">서비스 소개 </a> | <a href="">이용약관 </a> | <a href="">개인정보
							처리 방침 </a> | <a href="">고객센터 </a> | <a
							href="https://github.com/PopcornBox/popcorn_box">Github </a>
					</p>
				</div>
			</div>
			<div class="sns_btn" style="margin-left: 60px; font-size: 30px;">
				<a href=""><i class="fa-brands fa-instagram"
					style="color: #666; padding-left: 20px;"></i></a> <a href=""></a><i
					class="fa-brands fa-facebook-f"
					style="color: #666; padding-left: 20px;"></i></a> <a href=""><i
					class="fa-brands fa-twitter"
					style="color: #666; padding-left: 20px;"></i></a> <a href=""><i
					class="fa-brands fa-github"
					style="color: #666; padding-left: 20px;"></i></a>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function resize(obj) {
			obj.style.height = '350px';
			obj.style.height = (12 + obj.scrollHeight) + 'px';
		}
		$(document).ready(function() {
			$('#menu-delete').click(function(event) {
				event.preventDefault(); // 링크를 클릭했을 때의 기본 동작인 요청 보내기를 하지 않음.
				var result = confirm('정말 삭제할까요?');
				if (result) { // 사용자가 YES를 선택했을 때
					location = $(this).attr('href'); // 원래 이동하려고 했던 요청 주소로 요청 보내기.
				}
			});
			$('#menu-update').click(function(event) {
				var result = alert('수정 완료되었습니다.');
				if (result) { // 사용자가 YES를 선택했을 때
					location = $(this).attr('href'); // 원래 이동하려고 했던 요청 주소로 요청 보내기.
				}
			});
		});
	</script>
	<!-- Js Plugins -->
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.nice-select.min.js"></script>
	<script src="../resources/js/jquery.nicescroll.min.js"></script>
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/jquery.countdown.min.js"></script>
	<script src="../resources/js/jquery.slicknav.js"></script>
	<script src="../resources/js/mixitup.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>