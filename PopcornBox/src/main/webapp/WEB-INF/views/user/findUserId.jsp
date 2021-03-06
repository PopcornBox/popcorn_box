<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>로그인 | POPCORN BOX</title>
		
		<!-- Google Font -->
	    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	    rel="stylesheet">
		
		<!-- Css Styles -->
	    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/magnific-popup.css" type="text/css">
	    <!-- <link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css"> -->
	    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/style.css" type="text/css">
	    
    <script src="https://kit.fontawesome.com/a39158855c.js" crossorigin="anonymous"></script>
	<style>
	#userSignin{
			width: 900px;
		margin-left: 400px;
	}
	</style>
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
			            <li><a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">로그아웃</a></li>
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
			                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
		                                    </c:if>	 
		                                    <c:if test="${not empty accessToken}">
		                                    	<%-- 카카오 로그인의 경우 --%>  
			                                    <span>${signInUserNickname} 님</span><br>
			                                    <a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
			                                    	<i class="fa-solid fa-lock"></i>로그아웃</a>
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
                            <li><a href="../board/main">커뮤니티</a></li>
                            <li><a href="../event/main">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
        		<div class="text-center">
						<h4>본인확인 이메일로 인증</h4><br>
							
						<br>
					</div>
    </header>
    <!-- Header Section End -->
    
    	<div class="text-center">
						<p>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, <br>아이디가 이메일로 전송됩니다.</p>
					</div>
    
        <section class="checkout">
	        <div class="container">
	            <div class="checkout__form">
	                <form action="./find_userid" method="post">
	                    <div class="row">
	                        <div class="col-md-8 col-md-6">
	                            <div class="row align-center">
	                                <div class="col-lg-6" id="userSignin">
	                                    <div class="checkout__input">
			
			
			
			
				
				
					<div>
						<input type="email" name="user_email" placeholder="이메일 입력" required />
					</div>
					<div>
						<input type="submit" value="확인" />
					</div>
					<div>
						<input type="hidden" name="msg" value="${msg}" />
					</div>
			</div>
			

		
													</div>
	                                </div>  
	                        </div>
	
	                    </div>
	                </form>
	            </div>
	        </div>
	    </section>
		
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
				class="fa-brands fa-github" style="color: #666; padding-left: 20px;"></i></a>
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