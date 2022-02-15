<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie_info</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
                              <a href="../"><img src="../resources/images/popcornbox_logo.png" alt="logo" width="35%"></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <a href="./pb_login.html">로그인</a>
                                <a href="./pb_join_member.html">회원가입</a>
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
                            <li class="active"><a href="./pb_chart_list.html">차트</a></li>
                            <li><a href="../board/main">자유게시판</a> 
                            </li>
                            <li><a href="./pb_event.html">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md- 10">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="../resources/img/icon/search.png" alt=""></a>

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
                        <h4>영화 상세정보</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
		
		<section class="contact spad">
        <div class="container">
            <div class="row">
              <div class="row product__filter">
                  <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                      <div class="product__item">
                          <div class="product__item__pic set-bg" data-setbg="${movie.movie_image}">
                          </div>
                          <div class="product__item__text">
                          </div>
                      </div>
                  </div>
                <div class="col-lg-6 col-md-6">

                    <div class="contact__text">
                        <div class="section-title">

                            <h2>${movie.movie_title}</h2>
                            <p>감독: ${movie.movie_director} <br/> 배우: ${movie.movie_actor} <br/> 장르: ${movie.movie_genre} <br/> 개봉날일: ${movie.movie_release}
                            </p>
                        </div>

                    </div>
                </div>
                <div class="col-lg-12 col-md-14">
                    <div class="contact__form" id="movie_content" name="movie_content">
                      <p>${movie.movie_content}</p>
                      <p>${movie.movie_trailer}</p>
                        <!-- 댓글기능 -->
                    </div>
                </div>
            </div>

        </div>
        </div>

	</section>

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