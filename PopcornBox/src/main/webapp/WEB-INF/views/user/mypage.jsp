<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popcorn Box</title>
</head>
<body>
<<<<<<< HEAD

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
    
		<ul>
			<li><a href="./userInfo">회원정보확인</a></li>
		</ul>
		
=======
>>>>>>> branch 'master' of https://github.com/PopcornBox/popcorn_box.git
		<div>
			<table>
				<th>활동 내역</th><th>게시물 번호</th><th>게시글 제목</th><th>작성 일자</th>
			<c:forEach items="${mypageBoardResult.myBoardList}" var="signInUserNickname">
				<tr>
					<td>커뮤니티 게시글</td>
					<td>${signInUserNickname.board_no}</td>
					<td><a href="../board/detail?board_no=${signInUserNickname.board_no}">${signInUserNickname.board_title}</a></td>
					<td><fmt:formatDate value="${signInUserNickname.board_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
					</br>
				</tr>
			</c:forEach>
			<c:forEach items="${mypageBoardReplyResult.myBoardReplyList}" var="signInUserNickname">
				<tr>
					<td>게시판 댓글</td>
					<td>${signInUserNickname.board_no}<span>-</span>${signInUserNickname.board_reply_no}</td>
					<td><a href="../board/detail?board_no=${signInUserNickname.board_no}">${signInUserNickname.board_reply_content}</a></td>
					<td><fmt:formatDate value="${signInUserNickname.board_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
				</tr>
			</c:forEach>
			<c:forEach items="${mypageEventReplyResult.myEventReplyList}" var="signInUserNickname">
				<tr>
					<td>이벤트 댓글</td>
					<td>${signInUserNickname.event_no}<span>-</span>${signInUserNickname.event_reply_no}</td>
					<td><a href="../event/detail?event_no=${signInUserNickname.event_no}&q=0">${signInUserNickname.event_reply_content}</a></td>
					<td><fmt:formatDate value="${signInUserNickname.event_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
				</tr>
			</c:forEach>
			<c:forEach items="${mypageMovieReplyResult.myMovieReplyList}" var="signInUserNickname">
				<tr>
					<td>영화 댓글</td>
					<td>${signInUserNickname.movie_no}<span>-</span>${signInUserNickname.movie_reply_no}</td>
					<td><a href="../movie/detail?movie_no=${signInUserNickname.movie_no}&q=0">${signInUserNickname.movie_reply_content}</a></td>
					<td><fmt:formatDate value="${signInUserNickname.movie_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
				</tr>
			</c:forEach>

			</table>
		</div>

<<<<<<< HEAD
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
=======
			<!-- 좋아요한 영화 전용 table -->
			<table>
				<c:forEach items="${mypageMovieLikeResult.myMovieLikeList}" var="signInUserNickname">
					<tr align="center">
						<td>내가 좋아요한 영화</td>
					</tr>
					<tr>
						<td>${signInUserNickname.movie_no}</td>
						<td><a href="../movie/detail?movie_no=${signInUserNickname.movie_no}&q=0">${signInUserNickname.movie_reply_content}</a></td>
						<td><fmt:formatDate value="${signInUserNickname.movie_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
					</tr>
				</c:forEach>
			</table>
>>>>>>> branch 'master' of https://github.com/PopcornBox/popcorn_box.git

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
					<div class="breadcrumb__text">
						<h2>"${signInUserNickname}님 환영합니다!"</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- UserName End -->



	<!-- mypage List start (Shopping Cart Section Begin) -->
	<section class="shopping-cart spad" style="padding:0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="user__chart__table">
						<table>
							<tbody>
								<tr style="cursor: pointer;" onclick="location.href='./userInfo'"> 
									<td class="user__chart__item">
									<i class="fa-solid fa-user"></i></td>
									<td class="chart__info">회원정보 확인</td>
								</tr>
								<tr style="cursor: pointer;" >
									<td class="user__chart__item">
									<i class="fa-solid fa-rectangle-list"></i></td>
									<td class="chart__info" id="load_all">전체활동 기록
										<table class="innerchart_all">
											<tbody>
												<c:forEach items="${mypageBoardResult.myBoardList}" var="signInUserNickname">
													<tr>
														<td>커뮤니티 게시글</td>
														<td><a href="../board/detail?board_no=${signInUserNickname.board_no}">${signInUserNickname.board_title}</a></td>
														<td><fmt:formatDate value="${signInUserNickname.board_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
													</tr>
												</c:forEach>
												<c:forEach items="${mypageBoardReplyResult.myBoardReplyList}" var="signInUserNickname">
													<tr>
														<td>게시판 댓글</td>
														<td><a href="../board/detail?board_no=${signInUserNickname.board_no}">${signInUserNickname.board_reply_content}</a></td>
														<td><fmt:formatDate value="${signInUserNickname.board_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
													</tr>
												</c:forEach>
												<c:forEach items="${mypageEventReplyResult.myEventReplyList}" var="signInUserNickname">
													<tr>
														<td>이벤트 댓글</td>
														<td><a href="../event/detail?event_no=${signInUserNickname.event_no}&q=0">${signInUserNickname.event_reply_content}</a></td>
														<td><fmt:formatDate value="${signInUserNickname.event_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
													</tr>
												</c:forEach>
												<c:forEach items="${mypageMovieReplyResult.myMovieReplyList}" var="signInUserNickname">
													<tr>
														<td>영화 댓글</td>
														<td><a href="../movie/detail?movie_no=${signInUserNickname.movie_no}&q=0">${signInUserNickname.movie_reply_content}</a></td>
														<td><fmt:formatDate value="${signInUserNickname.movie_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</td>
								</tr>
								<tr style="cursor: pointer;" onclick="location.href='./#'">
									<td class="user__chart__item">
									<i class="fa-solid fa-heart"></i></td>
									<td class="chart__info">좋아요한 영화</td>
								</tr>
								<tr style="cursor: pointer;" onclick="location.href='./#'">
									<td class="user__chart__item">
									<i class="fa-solid fa-pen-to-square"></i></td>
									<td class="chart__info">작성한 게시글</td>
								</tr>
								<tr style="cursor: pointer;" onclick="location.href='./#'">
									<td class="user__chart__item">
									<i class="fa-solid fa-comment-dots"></i></td>
									<td class="chart__info">작성한 댓글</td>
								</tr>

							</tbody>
						</table>
					</div>
					</div>
				</div>
			</div>
	</section>
	<!-- mypage end (Shopping Cart Section Begin) -->



	<!-- Footer Section Begin -->
		<%@include file="../footer.jsp" %>
	<!-- Footer Section End -->



<<<<<<< HEAD

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

=======
<script>
		    $(document).ready(function(){
			    
			    var message = '${msg}';
				if (message != null && message != '') {
					alert(message);
				}
			    
    			// type 이 radio 이고 class 가 start_type_radio 인 input 을 click 했을 경우
                $('input[type="radio"][class="data_type_radio"]').on('click',function(){
					
                    // startSetting 에 checked된 radio button의 value 값을 넣는다.
                    var startSetting = $('input[type=radio][class="data_type_radio"]:checked').val();
                   
                   // startSetting이 later인 경우 style display를 flex로 변경한다. 
                   if(startSetting == 'later'){
                        $('#task_boardLog_setting').css('display','flex');
                   
                   // 그외의 경우 style display를 none 으로 변경한다.
                    }else{
                        $('#task_boardLog_setting').css('display','none');
                    }
                });
            });
		    
		    
		    
		    
		    
	        $(function(){
	            $("#load_all").click(function(e){ // click event for load more
	                e.preventDefault();
	                $(".innerchart_all:hidden").show(); // hidden div show them
	            });
	        });
	</script>
>>>>>>> branch 'master' of https://github.com/PopcornBox/popcorn_box.git
</body>
</html>
