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
<!--  <link rel="stylesheet" href="../resources/css/bootstrap_watch.min.css"
   type="text/css">-->
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

<style>
	hr {
		border: 1px solid gray;
	}
	
	.event_list ul li {
		width: 390px;
		height: 456px;
		border: 1px solid #ddd;
		display: inline-block;
	}
	
	.event_list ul li a {
		display: block;
		position: relative;
	}
	
	.event_thumb {
		overflow: hidden;
	}
	
	.event_thumb img {
		width: 360px;
		height: 270px;
	}
	
	#d-day {
		color: red;
	}
	
	.event_list li a #finish {
		position: absolute;
		right: 9px;
		top: 9px;
		z-index: 2;
		width: 60px;
		height: 60px;
		background: rgba(0,0,0,.5);
		color: #fff;
		text-align: center;
		line-height: 60px;
		border-radius: 100%;
	}
	
</style>
		
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
                            <li><a href="../board/main">커뮤니티</a></li>
                            <li class="active"><a href="../event/main">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="search_option">
                    <div class="header__nav__option">
                         <div>
							<form name="search" method = "get"  
								action ="./search" >
			                    <select name="type" class="nice-select search" style="padding-bottom: 1px;">
			                        <option value="1">제목</option>
			                        <option value="2">내용</option>
			                        <option value="3">제목+내용</option>
			                        <option value="4">작성자</option>
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
    
    
		<div>
			<h3>Event</h3>
			
			<c:if test="${signInUserPosition eq 'A'}">
				<a href="./register"><button>새로운 이벤트 등록하기</button></a>
			</c:if>
			<c:if test="${signInUserPosition eq 'B'}">
				<a href="./register"><button>새로운 이벤트 등록하기</button></a>
			</c:if>
		</div>
		
		<hr />
		
		<div class="event_list">
			<ul>
				<c:forEach var="event" items="${eventList}">
					<!-- 디데이 계산을 위한 날짜 세팅 변환 -->
					<fmt:formatDate var="startTime" value="${event.event_start_time}" pattern="yyyy-MM-dd"/> 
					<fmt:formatDate var="lastTime"  value="${event.event_last_time}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="todayNow" value="${today}" pattern="yyyy-MM-dd"/> 
				
				    <fmt:parseDate value="${lastTime}" var="event_last" pattern="yyyy-MM-dd"></fmt:parseDate>
					<fmt:parseNumber value="${event_last.time / (1000*60*60*24)}" integerOnly="true" var="lastDate"></fmt:parseNumber>
				    <fmt:parseDate value="${todayNow}" var="now" pattern="yyyy-MM-dd"></fmt:parseDate>
				    <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"></fmt:parseNumber>
				
				
					<li>
						<a href="./detail?event_no=${event.event_no}&q=${lastDate - todayDate}">
							<div class="event_thumb">
								<img alt="${event.event_title}" src="${event.event_thumb}">
							</div>
							
							<c:if test="${lastDate - todayDate < 0}">
								<em id="finish">마감</em>
							</c:if>
							
							<div class="event_desc">
								<p class="text1">${event.event_title}</p>
								<p class="text2">
										<fmt:formatDate value="${event.event_start_time}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${event.event_last_time}" pattern="yyyy.MM.dd."/>
							    		&nbsp;&nbsp;
							   			<c:if test="${lastDate - todayDate > 0}">
							   				<em id="d-day">D - ${lastDate - todayDate}</em> 
							   			</c:if>
							   			<c:if test="${lastDate - todayDate < 0}">
							   				<a href="./winner?event_no=${event.event_no}&q=${lastDate - todayDate}"><button>당첨자 확인</button></a> 
							   			</c:if>
								</p>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>	
		</div>
		
		
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
                		   <a href="../">서비스 소개 </a>
                           | 
                           <a href="../">이용약관 </a>
                           | 
                           <a href="../">개인정보 처리 방침 </a>
                           | 
                           <a href="../">고객센터 </a>
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
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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