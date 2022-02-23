<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popcorn Box</title>

    <script src="https://kit.fontawesome.com/a39158855c.js" crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/magnific-popup.css"
	type="text/css">
<!-- <link rel="stylesheet" href="./resources/css/nice-select.css"
	type="text/css"> -->
<link rel="stylesheet" href="./resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css">

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
						<li><a href="../user/register">회원가입</a></li>
			            <li><a href="../user/mypage">마이페이지</a></li>
		             </c:if>	 
		             <c:if test="${not empty accessToken}">
		                <%-- 카카오 로그인의 경우 --%>  
			            <li><span>${signInUserNickname} 님</span></li>
			            <li><a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7
			            &logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">로그아웃</a></li>
						<li><a href="./user/register">회원가입</a></li>
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
	                                  <a href=""><img src="./resources/img/popcornbox_logo.png" alt="logo"></a>
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
												<a href="./user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
			                                    <a href="./user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
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
                            <li class="active"><a href="">홈</a></li>
                            <li><a href="./movie/mainlist">차트</a></li>
                            <li><a href="./board/main">커뮤니티</a></li>
                            <li><a href="./event/main">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="search_option">
                    <div class="header__nav__option">
                         <div>
							<form name="search" align="right" style="margin-right:20px;" method = "get"  
								action ="./movie/search" >
			                    <select name="type" class="search" style="padding-bottom: 1px;">
			                        <option value="1">제목</option>
			                        <option value="2">배우</option>
			                        <option value="3">감독</option>
			                        <option value="4">장르</option>
			                    </select>
			                    <input class="search" type="text" name="keyword" placeholder="검색어 입력"
			                    	required oninvalid="this.setCustomValidity('검색어를 입력하세요.')"
											 oninput = "setCustomValidity('')"/>
			                    <input class="btn" type="submit" value="" />
			                </form>
			            </div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Banner Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="./resources/img/banner_main_1.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h2 style="color: white;">루이스 웨인</h2>
                                <p style="color: white;">당신의 봄을 아름답게 할,<br>단 하나의 러브 팔레트</p>
                                <a href="#" class="primary-cta-m"> 보러가기 <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="./resources/img/banner_main_2.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h2>더 배트맨</h2>
                                <p>히어로의 세대교체,<br> 어둠을 뚫고 그가 온다</p>
                                <a href="#" class="primary-cta-m"> 보러가기 <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="./resources/img/banner_main_3.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h2>미니언즈 2</h2>
                                <p>미니언들의 한층 새롭고 흥미로운 모험!</p>
                                <a href="#" class="primary-cta-m"> 보러가기 <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->


    <!-- chart Section Begin -->
  <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img src="./resources/img/banner/banner-1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src="./resources/img/banner/banner-2.jpg" alt="">
                        </div>
                      <div class="banner__item__text">
                            <h2>무비차트</h2>
                            <a href="./movie/mainlist">전체보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- 차트 리스트 -->
    <!-- Product Section Begin -->
    <section class="product spad">

        <div class="container">
            <div class="row product__filter">
                <div class="">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="./resources/img/chart_list_355.jpg">
                            <span class="label">1</span>
                         
                        </div>
                        <div class="product__item__text">
                          <h5>1_movie title</h5>

                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="./resources/img/product/product-1.jpg">
                            <span class="label">2</span>
                         
                        </div>
                        <div class="product__item__text">
                          <h5>2_movie title</h5>

                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="./resources/img/product/product-1.jpg">
                            <span class="label">3</span>
                         
                        </div>
                        <div class="product__item__text">
                          <h5>3_movie title</h5>

                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="./resources/img/product/product-1.jpg">
                            <span class="label">4</span>
                         
                        </div>
                        <div class="product__item__text">
                          <h5>4_movie title</h5>

                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="./resources/img/product/product-1.jpg">
                            <span class="label">5</span>
                         
                        </div>
                        <div class="product__item__text">
                          <h5>5_movie title</h5>

                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                    </div>
                </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="./resources/img/banner_main_event.jpeg" alt="">
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>현재 이벤트</span>
                        <h2>인스타 업로드하고 여행가자!</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <!-- <p>Days</p> -->
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Seconds</p>
                            </div>
                        </div>
                        <a href="#" class="primary-cta-m">응모하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->



    <!-- Latest Blog Section Begin -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h4>진행중인 이벤트</h4>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="./resources/img/blog/blog-1.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="./resources/img/icon/calendar.png" alt=""> 21 February 2020</span>
                            <h5>Eternity Bands Do Last Forever</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
            	
            	
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="./resources/img/blog/blog-2.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="./resources/img/icon/calendar.png" alt=""> 21 February 2020</span>
                            <h5>Eternity Bands Do Last Forever</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="./resources/img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="./resources/img/icon/calendar.png" alt=""> 28 February 2020</span>
                            <h5>The Health Benefits Of Sunglasses</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="event_list">
		<div class="row">
			<c:forEach var="event" items="${eventList}">
				<!-- 디데이 계산을 위한 날짜 세팅 변환 -->
				<fmt:formatDate var="startTime" value="${event.event_start_time}" pattern="yyyy-MM-dd"/> 
				<fmt:formatDate var="lastTime"  value="${event.event_last_time}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="todayNow" value="${today}" pattern="yyyy-MM-dd"/> 
			
			    <fmt:parseDate value="${lastTime}" var="event_last" pattern="yyyy-MM-dd"></fmt:parseDate>
				<fmt:parseNumber value="${event_last.time / (1000*60*60*24)}" integerOnly="true" var="lastDate"></fmt:parseNumber>
			    <fmt:parseDate value="${todayNow}" var="now" pattern="yyyy-MM-dd"></fmt:parseDate>
			    <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"></fmt:parseNumber>
		
				<div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${event.event_thumb}">
                        	<c:if test="${lastDate - todayDate < 0}">
								<em id="finish">마감</em>
							</c:if>
                        </div>
                        <div class="blog__item__text">
                            <span><img src="./resources/img/icon/calendar.png" alt="">
									<fmt:formatDate value="${event.event_start_time}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${event.event_last_time}" pattern="yyyy.MM.dd."/>
						    		&nbsp;&nbsp;
						   			<c:if test="${lastDate - todayDate > 0}">
						   				<em id="d-day">D - ${lastDate - todayDate}</em> 
						   			</c:if>
							</span>
                            <h5>${event.event_title}</h5>
                            <div class="readmore">
	                            <a href="./event/detail?event_no=${event.event_no}&q=${lastDate - todayDate}">Read More</a>
	                            
					   			<c:if test="${lastDate - todayDate < 0}">
					   				<a href="./event/winner?event_no=${event.event_no}&q=${lastDate - todayDate}">당첨자 확인</a> 
					   			</c:if>
                            </div>
                        </div>
                    </div>
                </div>
			</c:forEach>	
		</div>
	</div>
        
    </section>
    <!-- Latest Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
        	<div class="row">
                   <div class="footer__about">
                       <div class="footer__logo">
                           <a href=""><img src="./resources/img/popcornbox_logo.png"></a>
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
	<script src="./resources/js/jquery-3.3.1.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<!-- <script src="./resources/js/jquery.nice-select.min.js"></script> -->
	<script src="./resources/js/jquery.nicescroll.min.js"></script>
	<script src="./resources/js/jquery.magnific-popup.min.js"></script>
	<script src="./resources/js/jquery.countdown.min.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/mixitup.min.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
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
