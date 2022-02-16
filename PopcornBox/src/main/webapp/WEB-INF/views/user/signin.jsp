<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="Male_Fashion Template">
	    <meta name="keywords" content="Male_Fashion, unica, creative, html">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <title>로그인 | Popcorn Box</title>
		
		<!-- Google Font -->
	    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	    rel="stylesheet">
		
		<!-- Css Styles -->
	    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/magnific-popup.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
	    <link rel="stylesheet" href="../resources/css/style.css" type="text/css">
	    
  		<style>
	    .header__top__links img{
      		padding-left: 20px;
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
	                    <a href="#">로그인</a>
	                    <a href="#">회원가입</a>
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
	                                  <a href="../"><img src="../resources/img/popcornbox_logo.png" alt="logo" width="35%"></a>
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-5">
	                            <div class="header__top__right">
	                                <div class="header__top__links">
	                                    <a href="./signin"><img src="../resources/img/login.png" alt="로그인" width="10%">로그인</a>
	                                    <a href="./register"><img src="../resources/img/register.png" alt="회원가입" width="10%">회원가입</a>
	                                    <a href="./mypage"><img src="../resources/img/mypage.png" alt="마이페이지" width="10%">마이페이지</a>
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
	                                <li><a href="../board/main">자유게시판</a>
	                                  <!-- <ul class="dropdown">
	                                        <li><a href="./about.html">공지사항</a></li>
	                                        <li><a href="./pb_ßcommunity.html">자유게시판</a></li>
	                                    </ul> -->
	                                </li>
	                                <li><a href="./pb_event.html">이벤트</a></li>
	                            </ul>
	                        </nav>
	                    </div>
	                    <div class="col-lg-3 col-md- 10">
	                        <div class="header__nav__option">
	                            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
	
	                        </div>
	                    </div>
	                </div>
	                <div class="canvas__open"><i class="fa fa-bars"></i></div>
	            </div>
	        </header>
	        <!-- Header Section End -->
	
	
	    <!-- Breadcrumb Section Begin -->
	    <section class="breadcrumb-option">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb__text">
	                        <h4>로그인</h4>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Breadcrumb Section End -->

	    <!-- Login(Checkout) Section Begin / Style 생성하기  -->
	    <section class="checkout spad">
	        <div class="container">
	            <div class="checkout__form">
	                <form action="./signin" method="post">
	                    <div class="row">
	                        <div class="col-md-8 col-md-6">
	                            <div class="row align-">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>아이디<!--<span>*</span>--></p>	
	                                        <input type="text" name="user_id" placeholder="아이디 입력" required />
	                                    </div>
	                                </div>			
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>비밀번호<!-- <span>*</span>--> </p>
	                                        <input type="password" name="user_pwd" placeholder="비밀번호 입력" required />
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg-12 text-center">	
	                                <button type="submit" class="site-btn">로그인</button>
	                                <!-- <input type="submit" value="로그인" /> -->
		                             <div class="checkout__find__text"> 
		                                <div>
											<a href="https://kauth.kakao.com/oauth/authorize?client_id=cc1754dab9a17adb7dd44164ff108ba7&redirect_uri=http://localhost:8181/pjt/user/kakaologin&response_type=code">
											<img alt="카카오 로그인" src="../resources/img/kakao_login_medium_wide.png"></a>
										</div>
										<div class="find__text">
											<li>
												<a href="./register">회원가입</a>
											</li>
											<li>
												<a href="./find_userid">아이디 찾기</a>
											</li>
											<li>
												<a href="./find_userpwd">비밀번호 찾기</a>
											</li>
										</div>
											<div>
											<input type="hidden" name="url" value="${url}" />
										</div>
										<div>
											<input type="hidden" name="msg" value="${msg}" />
										</div>
	                                </div>  
	                        </div>
	
	                    </div>
	                </form>
	            </div>
	        </div>
	    </section>
	    <!-- Login(Checkout Section End -->			
			
	    <!-- Footer Section Begin -->
	    <footer class="footer">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-3 col-md-6 col-sm-6">
	                    <div class="footer__about">
	                        <div class="footer__logo">
	                            <a href="#"><img src="img/logo_white.png" width="60%" alt=""></a>
	                        </div>
	
	                <!--        <p>The customer is at the heart of our unique business model, which includes design.</p>
	                        <a href="#"><img src="img/payment.png" alt=""></a>
	                    </div>
	                </div>
	                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
	                    <div class="footer__widget">
	                        <h6>Shopping</h6>
	                        <ul>
	                            <li><a href="#">Clothing Store</a></li>
	                            <li><a href="#">Trending Shoes</a></li>
	                            <li><a href="#">Accessories</a></li>
	                            <li><a href="#">Sale</a></li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="col-lg-2 col-md-3 col-sm-6">
	                    <div class="footer__widget">
	                        <h6>Shopping</h6>
	                        <ul>
	                            <li><a href="#">Contact Us</a></li>
	                            <li><a href="#">Payment Methods</a></li>
	                            <li><a href="#">Delivary</a></li>
	                            <li><a href="#">Return & Exchanges</a></li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
	                    <div class="footer__widget">
	                        <h6>NewLetter</h6>
	                        <div class="footer__newslatter">
	                            <p>Be the first to know about new arrivals, look books, sales & promos!</p>
	                            <form action="#">
	                                <input type="text" placeholder="Your email">
	                                <button type="submit"><span class="icon_mail_alt"></span></button>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-lg-12 text-center">
	                    <div class="footer__copyright__text">
	                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	                        <p>Copyright ©
	                            <script>
	                                document.write(new Date().getFullYear());
	                            </script>2020
	                            All rights reserved | This template is made with <i class="fa fa-heart-o"
	                            aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	                        </p>
	                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	                    </div>
	                </div>
	            </div>
	        </div>
	    </footer>
	    <!-- Footer Section End -->
	
	    <!-- Search Begin -->
	    <div class="search-model">
	        <div class="h-100 d-flex align-items-center justify-content-center">
	            <div class="search-close-switch">+</div>
	            <form class="search-model-form">
	                <input type="text" id="search-input" placeholder="Search here.....">
	            </form>
	        </div>
	    </div>
	    <!-- Search End -->			
						
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