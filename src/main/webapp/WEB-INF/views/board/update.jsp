<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PopcornBox</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		  <link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
		  
		  
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" 	type="text/css">
<link rel="stylesheet" href="../resources/css/bootstrap_watch.min.css" 	type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"	type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css" 	type="text/css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css" 	type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css" 	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css" 	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css" 	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">


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
				<a href="#">로그인</a> <a href="#">회원가입</a>
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
							<a href="../"><img src="../resources/images/popcornbox_logo.png" alt="logo" width="35%"></a>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<a href="./pb_login.html">로그인</a> <a
									href="./pb_join_member.html">회원가입</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="../">홈</a></li>
							<li><a href="../movie/mainlist">차트</a></li>
							<li class="active"><a href="../board/main">자유게시판</a></li>
							<li><a href="./pb_event.html">이벤트</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md- 10">
					<div class="header__nav__option">
						<a href="#" class="search-switch"><img
							src="../resources/img/icon/search.png" alt=""></a>

					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->


		<nav>
			<!-- TODO: 페이지 이동 메뉴 -->
			<ul>
				<li><a href="../">메인</a></li>
				<li><a href="./main">게시판 메인</a></li>
				<li><a id="menu-delete" href="./delete?board_no=${board.board_no}">삭제</a></li>
			</ul>
		</nav>

		<div>
			<form action="./update" method="post">
				<div>
					<input type="number" name="board_no" value="${board.board_no}" id="board_no" readonly />
				</div>
				<div>
					<label for="title">글 제목</label> <input type="text" id="board_title"
						name="board_title" value="${board.board_title}" required autofocus />
				</div>
				<div>
					<label for="content">글 내용</label>
					<textarea rows="5" id="board_content" name="board_content" required>${board.board_content}
                        </textarea>
				</div>
				<div>
					<label for="user_nickname">닉네임</label> <input type="text"
						id="user_nickname" name="user_nickname" value="${board.user_nickname}" required
						readonly />
				</div>
	
				<div>
					<input class="btn btn-outline-dark" type="submit" value="수정 완료" />
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
								<a href="#"><img src="../resources/img/logo_white.png" alt=""></a>
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


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function() {

			$('#menu-delete').click(function(event) {
				event.preventDefault(); // 링크를 클릭했을 때의 기본 동작인 요청 보내기를 하지 않음.
				var result = confirm('정말 삭제할까요?');
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
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>