<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopcornBox</title>

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
<link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
    <script src="https://kit.fontawesome.com/a39158855c.js" crossorigin="anonymous"></script>

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
			                <li><a href="./event/main">이벤트</a></li>
				</c:if>
				<c:if test="${not empty signInUserNickname}">
					<%-- 로그인 되어 있는 경우 --%>
					<li><span>${signInUserNickname} 님</span></li>
					<li>　</li>
					<li><a href="../user/signout">로그아웃</a></li>
					<li><a href="../user/register">회원가입</a></li>
					<li><a href="../user/mypage">마이페이지</a></li>
					<li><a href="../event/main">이벤트</a></li>
				</c:if>
            </ul>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>PopcornBox</p>
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
	                                  <a href="../"><img src="../resources/img/popcornbox_logo.png" alt="logo"></a>
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
												<span>${signInUserNickname} 님</span><br>
												<a href="../user/signout"><i class="fa-solid fa-lock"></i>로그아웃</a>
												<a href="../user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
			                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
		                                    </c:if>	 
		                                    <c:if test="${not empty accessToken}">
		                                    	<%-- 카카오 로그인의 경우 --%>  
			                                    <span>${signInUserNickname} 님</span><br>
			                                    <a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
			                                    	<i class="fa-solid fa-lock"></i>로그아웃</a>
												<a href="./user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
			                                    <a href="./user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
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
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
	
	<hr>


	<nav>
		<%-- 내비게이션 메뉴 --%>
		<!-- TODO 페이지 이동 메뉴 -->

		<ul>
			<c:if test="${signInUserNickname == board.user_nickname}">
				<!-- 로그인 사용자 아이디와 글 작성자 아이디가 일치할 때만 수정 메뉴를 보여줌. -->
				<li><a href="./update?board_no=${board.board_no}">글 수정</a></li>
			</c:if>
		</ul>
	</nav>

		<%-- 게시글 상세보기 --%>		
	<div class="container">
	<div class="contact__form">
		<form>
			<div>
				<input type="hidden" id="bno" value="${board.board_no}" />
			</div>
			<div class="contact__form">
				<input type="text" id="board_title"
					name="board_title" value="${board.board_title}" required autofocus
					readonly />
			</div>
			<div class="row">
				<div>
					<i class="fa-solid fa-user"></i>
				</div>
				<div>
					<input type="text"
						id="board_user_nickname" name="board_user_nickname"
						value="${board.user_nickname}" required readonly />
				</div>
			</div>
			<div>
				<fmt:formatDate value="${board.board_update_time}"
					pattern="yy/MM/dd  HH:mm" var="last_update_time" />
				<input type="text" id="reg-date" name="reg_date"
					value="${last_update_time}" readonly />
			</div>
			<hr>
			<div>
				<div style="white-space:pre-wrap" id="board_content" name="board_content" required
					readonly>${board.board_content}</div>
			</div>
		</form>
		</div>
	</div>





	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img src="img/logo_white.png" alt=""></a>
						</div>
						<p>
							Copyright ©
							<script>
								document.write(new Date().getFullYear());
							</script>
							2020 All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->










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