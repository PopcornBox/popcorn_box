<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 | POPCORN BOX</title>


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
<link rel="stylesheet" href="../resources/css/bootstrap_watch.min.css"
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
					<li><a href="./user/signin">로그인</a></li>
		            <li><a href="./user/register">회원가입</a></li>
		            <li><a href="./user/mypage">마이페이지</a></li>
				</c:if>
				<c:if test="${not empty signInUserNickname}">
					<%-- 로그인 되어 있는 경우 --%>
					<c:if test="${empty accessToken}">
						<%-- 일반 로그인의 경우 --%>  
						<li><span>${signInUserNickname} 님</span></li>
						<li><a href="./user/signout">로그아웃</a></li>
			            <li><a href="./user/mypage">마이페이지</a></li>
		             </c:if>	 
		             <c:if test="${not empty accessToken}">
		                <%-- 카카오 로그인의 경우 --%>  
			            <li><span>${signInUserNickname} 님</span></li>
			            <li><a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">로그아웃</a></li>
			            <li><a href="./user/mypage">마이페이지</a></li>
					 </c:if>	 
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
											<a href="./user/signin"><i class="fa-solid fa-lock"></i>로그인</a>
		                                    <a href="./user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
		                                    <a href="./user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
										</c:if>
										<c:if test="${not empty signInUserNickname}">
											<%-- 로그인 되어 있는 경우 --%>
											<c:if test="${empty accessToken}">
												<%-- 일반 로그인의 경우 --%>  
												<span>${signInUserNickname} 님</span><br>
												<a href="./user/signout"><i class="fa-solid fa-lock"></i>로그아웃</a>
			                                    <a href="./user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
		                                    </c:if>	 
		                                    <c:if test="${not empty accessToken}">
		                                    	<%-- 카카오 로그인의 경우 --%>  
			                                    <span>${signInUserNickname} 님</span><br>
			                                    <a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
			                                    	<i class="fa-solid fa-lock"></i>로그아웃</a>
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
				<div class="search_option">
					<div class="header__nav__option">
						<div>
							<form name="search" method="get" action="./search">
								<select name="type" class="nice-select search"
									style="padding-bottom: 1px;">
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">제목+내용</option>
									<option value="4">작성자</option>
								</select> <input class="search" type="text" name="keyword"
									placeholder="검색어 입력" required
									oninvalid="this.setCustomValidity('검색어를 입력하세요.')"
									oninput="setCustomValidity('')" /> <input class="btn"
									type="submit" value="" />

							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

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
    <!-- Breadcrumb Section End -->

    <!-- 탈퇴메세지  Section Begin -->
    <section class="mypage">
        <div class="container">
          <div class ="mypage__edit">
            <h3 class="mypage__title">탈퇴 안내</h3>
          </div>
        </div>

        <div class="container" >
        <div class ="leave_box">
        <br><br>
          <h6 class="checkout__title">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<h6>
          <div class="text">
			<br>
			<p>✔ <strong>사용하고 계신 아이디(<span style="color:green;">${user.user_id}</span>)와 닉네임(<span style="color:green;">${signInUserNickname}</span>)은 
			탈퇴할 경우 재사용이 가능합니다.</strong></p>
			<p>탈퇴한 아이디는 본인과 타인 모두 재사용이 가능하오니 신중하게 선택하시기 바랍니다.</p><br><br>
			<p>✔ <strong>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</strong></p>
			<p>회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
			<p>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p><br><br>
			<p>✔ <strong>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</strong></p>
			<p>게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</p>
			<p>삭제를 원하는 게시물이 있다면 <span style="color:red;">반드시 탈퇴 전 삭제하시기 바랍니다.</span></p>
			<p>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시물을 임의로 삭제해드릴 수
				없습니다.</p>
			<br>
          </div>
        </div>
      </div>
      <div class="container">
      <form action="./leave" method="post">
      <hr><br>
        <h6 class="checkout__title" style="border:none; text-align:center;">탈퇴를 원하시면 비밀번호를 입력해주세요.</h6>
			<div id="leaveButton">
          <div class="checkout__input" style="width:280px; text-align:center;">
              <input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호" required />
          </div>
          <div style ="display:flex; justify-content: space-between; width: 280px;">
             <a href="./mypage" class="btn btn-success" id="submit">취소</a>
				<button class="cancel btn btn-danger" type="submit">탈퇴하기</button>
          </div><br>
          	<div>
				<input type="hidden" name="msg" value="${msg}" />
			</div>
			</div>
			</form>
      </div>
    </section>
    <!-- 탈퇴메세지 Section End -->






	<!-- ------------------------------------------------------------------------------------------------------ 
	<div style="margin: 100px;">
		<form action="./leave" method="post">
			<br>
			<h4>탈퇴 안내</h4>
			<hr>
			<br>
			<p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
			<hr>
			<br>
			<p>사용하고 계신 아이디(${user.user_id})와 닉네임(${signInUserNickname})은 탈퇴할
				경우 재사용이 가능합니다.</p>
			<br>
			<p>게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</p>
			<p>삭제를 원하는 게시물이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.
			<p>
			<p>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시물을 임의로 삭제해드릴 수
				없습니다.</p>
			<br>
			<hr>
			<p>탈퇴를 원하시면 비밀번호를 입력해주세요.</p>
			<div>
				<input type="password" id="user_pwd" name="user_pwd"
					placeholder="비밀번호" class="checkout__input__add" required />
			</div>
			<br>
			<div>
				<button type="submit" class="site-btn">탈퇴</button>
			</div>
			<div>
				<input type="hidden" name="msg" value="${msg}" />
			</div>
		</form>
	</div>
-->


    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
        	<div class="row">
                   <div class="footer__about">
                       <div class="footer__logo">
                           <a href=""><img src="../resources/img/popcornbox_logo.png"></a>
                       </div>
                   </div>
               <div class="footer_text">
               	<div>
                	<p>popcompany | 대표 김유은</p>
                	<p>서울특별시 강남구 테헤란로 124 4층 | 사업자 등록번호 11110 22220 3333</p>
                	<p>
                		   <a href="">서비스 소개 </a>
                           | 
                           <a href="">이용약관 </a>
                           | 
                           <a href="">개인정보 처리 방침 </a>
                           | 
                           <a href="">고객센터 </a>
                           | 
                       	<a href="https://github.com/PopcornBox/popcorn_box">Github </a>
                       </p>
                       <p>Copyright ©
                           <script>
                               document.write(new Date().getFullYear());
                           </script>2020 Popcorn Box. All rights reserved  
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
			$(document).ready(function () {
				var message = '${msg}';
				if (message != null && message != '') {
					alert(message);
				}
			});	
	</script>
</body>
</html>