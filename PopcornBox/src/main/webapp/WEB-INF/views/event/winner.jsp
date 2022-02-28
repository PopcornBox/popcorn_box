<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
												<a href="../user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
			                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
		                                    </c:if>	 
		                                    <c:if test="${not empty accessToken}">
		                                    	<%-- 카카오 로그인의 경우 --%>  
			                                    <span>${signInUserNickname} 님</span>
												<br>
												<a
													href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7
													&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
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
							<li class="active"><a href="../event/main">이벤트</a></li>
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



	<h1>
		<span class="subject">[영화속 명대사] 이벤트 당첨자 발표</span>
	</h1>
	<div>
		<br>
	</div>

	<table class="__se_tbl_ext" border="0" cellpadding="0" cellspacing="0"
		width="481" style="border-collapse: collapse; width: 361pt">
		<colgroup>
			<col width="52"
				style="mso-width-source: userset; mso-width-alt: 1664; width: 39pt">
			<col width="220"
				style="mso-width-source: userset; mso-width-alt: 7040; width: 165pt">
			<col width="209"
				style="mso-width-source: userset; mso-width-alt: 6688; width: 157pt">
		</colgroup>
		<tbody>
			<tr height="22" style="height: 16.5pt">
				<td colspan="3" height="22" class="xl67" width="481"
					style="text-align: center; border: 1px solid windowtext; background: #D9D9D9; mso-pattern: black none; height: 16.5pt; width: 361pt">APPLE
					2021 맥북프로16 MK183KH/A</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl64"
					style="width: 39pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; height: 16.5pt; border-top: none">번호</td>
				<td class="xl64"
					style="height: 16.5pt; width: 165pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; border-top: none; border-left: none">닉네임</td>
				<td class="xl64"
					style="height: 16.5pt; width: 157pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; border-top: none; border-left: none">이메일</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">1</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">cho**</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">cho**@naver.com</td>
			</tr>

			<tr height="22" style="height: 16.5pt">
				<td colspan="3" height="22" class="xl67"
					style="width: 117pt; text-align: center; border: 1px solid windowtext; background: #D9D9D9; mso-pattern: black none; height: 16.5pt">Apple
					아이패드 10.2 2021년 9세대</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl64"
					style="width: 39pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; height: 16.5pt; border-top: none">번호</td>
				<td class="xl64"
					style="height: 16.5pt; width: 165pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; border-top: none; border-left: none">닉네임</td>
				<td class="xl64"
					style="height: 16.5pt; width: 157pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; border-top: none; border-left: none">이메일</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">1</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">Str*****&nbsp;</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">str*****@naver.com</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">2</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">ban***&nbsp;</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">ban***@gmail.com</td>
			<tr height="22" style="height: 16.5pt">
				<td colspan="3" height="22" class="xl68"
					style="width: 117pt; text-align: center; border: 1px solid windowtext; background: #BDD7EE; mso-pattern: black none; height: 16.5pt">영화
					관람권</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl64"
					style="width: 39pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; height: 16.5pt; border-top: none">번호</td>
				<td class="xl64"
					style="height: 16.5pt; width: 165pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; border-top: none; border-left: none">닉네임</td>
				<td class="xl64"
					style="height: 16.5pt; width: 157pt; color: #0066CC; font-weight: 700; font-style: italic; text-align: center; border: 1px solid windowtext; background: #F8CBAD; mso-pattern: black none; border-top: none; border-left: none">이메일</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">1</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">app**</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">app**@gmail.com</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">2</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">pin******</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">pin******@gmail.com</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">3</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">pea***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">pea***@naver.com</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">4</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">sta***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">sta***@gmail.com</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">5</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">ice***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">ice***@naver.com</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">6</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">fir***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">fir***@naver.com</td>
			</tr>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">7</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">win***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">win***@naver.com</td>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">8</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">clo***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">clo***@gmail.com</td>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">9</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">hur***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">hur***@gmail.com</td>
			<tr height="22" style="height: 16.5pt">
				<td height="22" class="xl65"
					style="width: 39pt; mso-number-format: '\@'; text-align: center; border: 1px solid windowtext; height: 16.5pt; border-top: none">10</td>
				<td class="xl66"
					style="height: 16.5pt; width: 165pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">san***</td>
				<td class="xl66"
					style="height: 16.5pt; width: 157pt; color: windowtext; text-align: center; border: 1px solid windowtext; border-top: none; border-left: none">san***@gmail.com</td>
			</tr>
		</tbody>
	</table>
	<div>
		<br>
	</div>


	<div>
		[영화속 명대사] 이벤트 당첨을 축하드립니다! 상품 발송을 위한 안내 사항을 꼭 확인해 주세요. &nbsp;
		<div>
			<div>
				<br>
			</div>

			<div>● 안내사항</div>
			<div>
				<br>
			</div>
			<div>
				- 당첨되신 분들에게는 Popcorn box 고객센터(popcornbox@popcorn.com) 대표 이메일로 확인 메일을
				드립니다.
				<div>- Popcorn box 회원 정보에 저장된 이메일로 연락을 드리니, 이메일을 꼭 확인해주세요.</div>
				<div>- 이메일 확인이 어렵거나 부재 중이었을 경우, 고객센터 업무시간 (오전 9시 ~ 오후 6시) 내
					연락해 주세요.</div>
				<span
					style="color: rgb(0, 117, 200); background-color: rgb(255, 239, 0); font-size: 12pt;"><strong>
						- 당첨자 발표 후 영업일 기준 4일간 당첨 확인이 되지 않을 경우 당첨이 취소됩니다. </strong></span> <br> <span
					style="color: rgb(0, 117, 200); background-color: rgb(255, 239, 0); font-size: 12pt;"><strong>
						- 허위 , 또는 Popcorn box 회원 약관 및 국내법에 위배되는 정보를 회원정보에 기재 시 당첨이 취소됩니다.</strong></span>
				<div>
					<br>
				</div>
				<div>● 관련링크 : [영화속 명대사] 이벤트</div>
				<a href="http://localhost:8181/pjt/event/detail?event_no=22&q=-7"
					target="_blank">
					http://localhost:8181/pjt/event/detail?event_no=22&q=-7</a>


				<!-- Footer Section Begin -->
				<footer class="footer">
					<div class="container">
						<div class="row">
							<div class="footer__about">
								<div class="footer__logo">
									<a href="../"><img
										src="../resources/img/popcornbox_logo.png"></a>
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
											document.write(new Date()
													.getFullYear());
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