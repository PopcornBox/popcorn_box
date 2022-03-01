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

	<!-- UserName start -->
	<section class="breadcrumb-option"
		style="padding-top: 10px; padding-bottom: 40px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2>"${signInUserNickname}님
							<span>
								<c:if test="${signInUserPosition == 'A'}">
									(관리자등급)
								</c:if>
								<c:if test="${signInUserPosition == 'B'}">
									(매니저등급)
								</c:if>
								<c:if test="${signInUserPosition == 'C'}">
									(일반회원등급)
								</c:if>
							</span> 환영합니다!"
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- UserName End -->


	<!-- mypage List start -->
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
										<table id="openAllLog" value="hide">
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
														<td><a href="../movie/detail?movie_no=${signInUserNickname.movie_no}">${signInUserNickname.movie_reply_content}</a></td>
														<td><fmt:formatDate value="${signInUserNickname.movie_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</td>
								</tr>
								<tr style="cursor: pointer;">
									<td class="user__chart__item">
									<i class="fa-solid fa-pen-to-square"></i></td>
									<td class="chart__info" id="load_board">작성한 게시글
										<table id="openBoardLog" value="hide">
											<tbody>
												<c:forEach items="${mypageBoardResult.myBoardList}" var="signInUserNickname">
													<tr>
														<td>커뮤니티 게시글</td>
														<td><a href="../board/detail?board_no=${signInUserNickname.board_no}">${signInUserNickname.board_title}</a></td>
														<td><fmt:formatDate value="${signInUserNickname.board_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</td>
								</tr>
								<tr style="cursor: pointer;">
									<td class="user__chart__item">
									<i class="fa-solid fa-comment-dots"></i></td>
									<td class="chart__info" id="load_reply">작성한 댓글
										<table id="openReplyLog" value="hide">
											<tbody>
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
														<td><a href="../movie/detail?movie_no=${signInUserNickname.movie_no}">${signInUserNickname.movie_reply_content}</a></td>
														<td><fmt:formatDate value="${signInUserNickname.movie_reply_update_time}" pattern="yyyy/MM/dd HH:mm" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</td>
								</tr>
								<tr style="cursor: pointer;" onclick="moveDiv('4')">
									<td class="user__chart__item">
									<i class="fa-solid fa-heart"></i></td>
									<td class="chart__info" id="load_like">좋아요한 영화
										<table id="openLikeLog" value="hide">
											<tbody>
												<tr align="center">
													<td colspan = "5">내가 좋아요한 영화</td>
												</tr>
												<tr>
												<c:forEach items="${mypageMovieLikeImage}" var="mypageMovieLikeImage">
													<td>
														<a href="../movie/detail?movie_no=${mypageMovieLikeImage.movie_no}">
															<img src="${mypageMovieLikeImage.movie_image}" style="height: 260px; width: 185px;">
														</a>
													</td>
												</c:forEach>
												</tr>
												<tr>										
												<c:forEach items="${mypageMovieLikeResult.myMovieLikeList}" var="signInUserNickname">
													<td>
														<fmt:formatDate value="${signInUserNickname.like_update_time}" pattern="yyyy/MM/dd HH:mm" />
													</td>
												</c:forEach>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
					</div>
				</div>
			</div>
	</section>
	<!-- mypage end -->


	<div id="movediv4"></div>
	<!-- Footer Section Begin -->
		<%@include file="../footer.jsp" %>
	<!-- Footer Section End -->



	<script>
		    $(document).ready(function(){
			    
			    var message = '${msg}';
				if (message != null && message != '') {
					alert(message);
				}
		    
		    // 전체 기록 호출
	        $(function(){
	            $("#load_all").click(function(e){ // click event for load more
	                $("#openAllLog").toggle(); // hidden div show them
	            });
	            $("#openAllLog").hide();
	        });
		    
		    // 작성한 게시글 호출
	        $(function(){
	            $("#load_board").click(function(e){ // click event for load more
	                $("#openBoardLog").toggle(); // hidden div show them
	            });
	            $("#openBoardLog").hide();
	        });
		    
		    // 작성한 댓글 호출
	        $(function(){
	            $("#load_reply").click(function(e){ // click event for load more
	                $("#openReplyLog").toggle(); // hidden div show them
	            });
	            $("#openReplyLog").hide();
	        });
		    
		    // 좋아요한 영화 호출
	        $(function(){
	            $("#load_like").click(function(e){ // click event for load more
	                $("#openLikeLog").toggle(); // hidden div show them
	            });
	            $("#openLikeLog").hide();
	        });
		    
		    // 클릭 시 해당 위치 이동
	        function moveDiv(seq){
	            var offset = $("#movediv" + seq).offset();
	            $('html, body').animate({scrollTop : offset.top + 120}, 400);
	        }

});			    
	</script>

</body>
</html>