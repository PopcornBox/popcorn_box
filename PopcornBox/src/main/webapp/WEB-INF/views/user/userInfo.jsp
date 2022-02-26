<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popcorn Box</title>

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
<!-- <link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css"> -->
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
						<li><a href="./event/main">이벤트</a></li>
					</c:if>
					<c:if test="${not empty signInUserNickname}">
						<%-- 로그인 되어 있는 경우 --%>
						<li><span>${signInUserNickname} 님</span></li>
						<li></li>
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
										<a href="../user/register"><i
											class="fa-solid fa-user-plus"></i>회원가입</a>
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
							<li><a href="../board/main">커뮤니티</a></li>
							<li><a href="../event/main">이벤트</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->


<form action="/pjt/user/userInfo" method="post">
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>마이 페이지</h4>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- UserName start -->
	<section class="breadcrumb-option"
		style="padding-top: 10px; padding-bottom: 40px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text"
						style="display: flex; justify-content: space-between;">
						<h2>"${signInUserNickname}님의 정보입니다!"</h2>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- UserName End -->

	<!-- mypage List start (Shopping Cart Section Begin) -->
	<section class="shopping-cart spad" style="padding: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="user__chart__table">
						<table>
							<tbody>
								<tr style="">
									<td class="chart__info">아이디</td>
									<td style="width: 50%"><div
											class="form-group has-feedback">
											<input class="form-control" type="text" id="user_id" name="user_id"
												value="${user.user_id}" readonly="readonly" /></div>
									</td>
									<td></td>
								</tr>
								<tr>
									<td class="chart__info">닉네임</td>
									<td style="width: 50%">
										<div class="form-group has-feedback">
											<input
												class="form-control" type="text" id="user_nickname"
												name="user_nickname" placeholder="${signInUserNickname}" />
										</div>
									</td>
									<td>
										<button class="checknickname primary-btn" type="button" style="height: 40px; padding: 0px;"
												id="checknickname" value="N">중복확인</button>
									</td>
								</tr>
								<tr>
									<td class="chart__info">비밀번호</td>
									<td style="width: 50%">
										<div class="form-group has-feedback">
											<input class="form-control" type="password" id="user_pwd"
												name="user_pwd" />
										</div>
									</td>
									<td>
										<button class="checkpassword primary-btn" type="button" style="height: 40px; padding: 0px;"
												id="checkpassword" onclick=# value="N">비밀번호 변경하기</button>
									</td>
								</tr>
								<tr>
									<td class="chart__info">이메일 주소</td>
									<td style="width: 50%"><div
											class="form-group has-feedback">
										<input class="form-control" type="text" id="user_email"
											name="user_email" value="${user.user_email}"
											readonly="readonly" />
										</div></td>
									<td></td>
								</tr>
								<tr>
									<td class="chart__info">가입 일자</td>
									<td style="width: 50%">
										<input class="form-control" type="text" id="user_update_time"
										name="user_update_time" value="${user.user_update_time}"
										readonly="readonly" disabled />
									</td>
									<td></td>
								</tr>
								<input class="form-control" type="hidden" name="msg" id="msg"></input>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		
	<div class="container" style="text-align: center;">
		<div class="form-group has-feedback">
			<div>
				<button class="cancel btn btn-danger" type="button">취소</button>
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
			</div>
			<br>
			<span class="user_leave"><a href="./leave">회원탈퇴를 원하실 경우 클릭해주세요 ></a></span>
		</div>
	</div>
</section>
</form>
	<!-- mypage end (Shopping Cart Section Begin) -->




	<!-- ------------------------------------------------------------------------------------------------------ -->

	<!-- https://melonpeach.tistory.com/42 확인한번만해볼것
	<section id="container">
		<form action="/pjt/user/userInfo" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="user_id">아이디</label> <input
					class="form-control" type="text" id="user_id" name="user_id"
					value="${user.user_id}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_pwd">비밀번호</label> <input
					class="form-control" type="password" id="user_pwd" name="user_pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_nickname">닉네임</label> <input
					class="form-control" type="text" id="user_nickname"
					name="user_nickname" value="${signInUserNickname}" />
				<button class="checknickname" type="button" id="checknickname"
					onclick="fn_checknickname();" value="N">중복확인</button>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_email">이메일</label> <input
					class="form-control" type="text" id="user_email" name="user_email"
					value="${user.user_email}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_update_time">가입 일자</label> <input
					class="form-control" type="text" id="user_update_time"
					name="user_update_time" value="${user.user_update_time}"
					readonly="readonly" disabled />
			</div>

			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				<button class="cancel btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

	<input type="button" value="메인으로" class="btn"
		onclick="location.href='/pjt'">
	<div>
		<input type="button" value="회원탈퇴" class="btn"
			onclick="location.href='/pjt/user/leave'">
	</div>

 -->
 
 
 
	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="footer__about">
					<div class="footer__logo">
						<a href="../"><img src="../resources/img/popcornbox_logo.png"></a>
					</div>
				</div>
				<div class="footer_text">
					<div>
						<p>popcompany | 대표 김유은</p>
						<p>서울특별시 강남구 테헤란로 124 4층 | 사업자 등록번호 11110 22220 3333</p>
						<p>
							<a href="../">서비스 소개 </a> | <a href="../">이용약관 </a> | <a
								href="../">개인정보 처리 방침 </a> | <a href="../">고객센터 </a> | <a
								href="https://github.com/PopcornBox/popcorn_box">Github </a>
						</p>
						<p>
							Copyright ©
							<script>
								document.write(new Date().getFullYear());
							</script>
							2020 Popcorn Box. All rights reserved
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
	<!-- <script src="../resources/js/jquery.nice-select.min.js"></script> -->
	<script src="../resources/js/jquery.nicescroll.min.js"></script>
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/jquery.countdown.min.js"></script>
	<script src="../resources/js/jquery.slicknav.js"></script>
	<script src="../resources/js/mixitup.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/main.js"></script>
	<script>
        $(document).ready(function(){
	   
	   var done = 0;
	   
	   $('#user_nickname').keyup(function() {
		   done = 1;
	   });
	   
	   
	   
	   $('#checknickname').click(function() {
		   var user_nickname = $('#user_nickname').val();
		   var user_no = '${user.user_no}';
		   
		   if (user_nickname == '') {
			   alert('닉네임을 입력해주세요!');
			   return;
		   }
		   
		   $.ajax({
			   async: true,
			   type: 'POST',
			   data: user_nickname,
			   url: '/pjt/check_nickname/' + user_no,
			   dataType: 'json',
			   contentType: 'application/json; charset=UTF-8',
			   success: function(data) {
				   if (data.cnt > 0) {
					   alert('사용가능한 닉네임입니다.');
					   done = 2;
				   } else {
					   alert('닉네임이 존재합니다.');
				   }
			   }
		   });
		 });
   
   		
	   	$('#submit').click(function(event) {
	   		if (done == 0) {
	   			$('#user_nickname').val('${signInUserNickname}');
	   			$('#msg').val('닉네임이 변경되었습니다.');
	   		}		
	   		
	   		if (done == 1) {
	   			event.preventDefault();
	   			alert('닉네임 중복확인을 해주세요!');
	   		}
	   		
	   		if (done == 2) {
	   			$('#msg').val('닉네임이 변경되었습니다.');
	   		}
	   			   		
	   	});
   
   });
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
