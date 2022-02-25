<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>회원가입 | Popcorn Box</title>
	    
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
		.valid_id, .valid_nickname, .valid_email, .valid_pwd, .valid_repwd {
			color: green;
			display: none;
		}	
		.invalid_id, .invalid_id2, .invalid_nickname, .invalid_nickname2, 
		.invalid_email, .invalid_email2, .invalid_pwd, .invalid_repwd {
			color: red;
			display: none;
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
				                                    <a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7
				                                    &logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
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
	                            <li><a href="../event/main">이벤트</a></li>
	                        </ul>
	                    </nav>
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
	                        <h4>회원가입</h4>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Breadcrumb Section End -->
	
	    <!-- Checkout Section Begin -->
	    <section class="checkout spad">
	        <div class="container">
	            <div class="checkout__form">
	                <form action="./register" method="post">
	                    <div class="row">
	                        <div class="col-lg-8 col-md-6">
	                            <h6 class="checkout__title">안녕하세요, 회원정보를 입력해주세요.</h6>
	                            <div class="checkout__input ">
	                                <p>아이디<span>*</span></p>
	                                <div style="display:flex">
	                                <input type="text" id="user_id" name="user_id" placeholder="아이디" required /> 
	                                </div>
	                                <div class="valid_id">사용 가능한 아이디입니다!</div>
									<div class="invalid_id">이미 사용 중인 아이디입니다.</div>
									<div class="invalid_id2">5~20자의 영문, 숫자만 사용 가능합니다.</div>
	                            </div>
	                            
	                            <div class="checkout__input ">
	                                <p>닉네임<span>*</span></p>
	                                <div style="display:flex">
	                                <input type="text" id="user_nickname" name="user_nickname" placeholder="닉네임" required /> 
	                                </div>
									<div class="valid_nickname">사용 가능한 닉네임입니다!</div>
									<div class="invalid_nickname">이미 사용 중인 닉네임입니다.</div>
									<div class="invalid_nickname2">15자 이내의 한글, 영문, 숫자만 사용 가능합니다.</div>
	                            </div>
	                            
	                            <div class="checkout__input">
	                                <p>비밀번호<span>*</span></p>
	                                <input type="password" id="user_pwd" name="user_pwd" placeholder="8~16자의 영문, 숫자, 특수문자 모두 포함" class="checkout__input__add" required />
	                                <div class="valid_pwd">사용 가능한 비밀번호입니다!</div>
									<div class="invalid_pwd">8~16자의 영문, 숫자, 특수문자를 사용하세요.</div>
	                                <p>비밀번호 확인<span>*</span></p>
	                                <input type="password" id="user_repwd" name="user_repwd" placeholder="비밀번호 확인" required />
									<div class="valid_repwd">비밀번호가 일치합니다!</div>
									<div class="invalid_repwd">비밀번호가 일치하지 않습니다.</div>	                                
	                            </div>
	                            <div class="checkout__input">
	                                <p>이메일 주소<span>*</span></p>
	                                <input type="email" id="user_email" name="user_email" placeholder="popcorn@box.com" required />
	                                <div class="valid_email">사용 가능한 이메일입니다!</div>
									<div class="invalid_email">이미 사용 중인 이메일입니다.</div>
									<div class="invalid_email2">이메일이 유효하지 않습니다.</div>
	                            </div>
	                            <div class="col-lg-12 text-center">
	                            <button type="submit" class="primary-btn">회원가입</button>	                            
	                            </div>
	
	
	
	                      <!--  <div class="col-lg-4 col-md-6">
	                            <div class="checkout__order">
	                                <h4 class="order__title">Your order</h4>
	                                <div class="checkout__order__products">Product <span>Total</span></div>
	                                <ul class="checkout__total__products">
	                                    <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
	                                    <li>02. German chocolate <span>$ 170.0</span></li>
	                                    <li>03. Sweet autumn <span>$ 170.0</span></li>
	                                    <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
	                                </ul>
	                                <ul class="checkout__total__all">
	                                    <li>Subtotal <span>$750.99</span></li>
	                                    <li>Total <span>$750.99</span></li>
	                                </ul>
	                                <div class="checkout__input__checkbox">
	                                    <label for="acc-or">
	                                        Create an account?
	                                        <input type="checkbox" id="acc-or">
	                                        <span class="checkmark"></span>
	                                    </label>
	                                </div>
	                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
	                                ut labore et dolore magna aliqua.</p>
	                                <div class="checkout__input__checkbox">
	                                    <label for="payment">
	                                        Check Payment
	                                        <input type="checkbox" id="payment">
	                                        <span class="checkmark"></span>
	                                    </label>
	                                </div>
	                                <div class="checkout__input__checkbox">
	                                    <label for="paypal">
	                                        Paypal
	                                        <input type="checkbox" id="paypal">
	                                        <span class="checkmark"></span>
	                                    </label>
	                                </div>
	                                <button type="submit" class="site-btn">PLACE ORDER</button>
	                            </div>
	                        </div>-->
	                    </div>
	                </form>
	            </div>
	        </div>
	    </section>
	    <!-- Checkout Section End -->
	    
	    
	    
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
		<script>
		$(document).ready(function () {
			
			// user_id 아이디를 갖는 HTML 요소(input)에 변화가 생겼을 때 호출될 이벤트 리스너 콜백 함수를 등록
			$('#user_id').change(function (event) {
				// 아이디 중복 체크 및 유효성 검사
				var params = { user_id: $(this).val() };
				var id = $(this).val();
				var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				var kor = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi); 
				// $.post(Ajax 요청 주소, 요청 파라미터, 응답 성공일 때 실행될 콜백 함수);
				$.post('./checkid', params, function (response) {	
					if (response == 'invalid') { // 중복된 아이디(DB에 있는 아이디)인 경우
						$('.valid_id').hide(); 
						$('.invalid_id').show(); 
						$('.invalid_id2').hide();
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					/*
					} else if (id.length < 5 || id.length > 20) {
						$('.valid_id').hide(); 
						$('.invalid_id').hide(); 
						$('.invalid_id2').show(); 
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					}
					else if (spe > 0 || kor > 0) { // 특수문자나 한글을 포함하는 경우
						$('.valid_id').hide(); 
						$('.invalid_id').hide(); 
						$('.invalid_id2').show(); 
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					*/	
					} else {
						$('.valid_id').show(); 
						$('.invalid_id').hide(); 
						$('.invalid_id2').hide(); 
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					}
				});
			});
			
			$('#user_nickname').change(function (event) {
				var params = { user_nickname: $(this).val() };
				var spe = $(this).val().search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				$.post('./checknickname', params, function (response) {
					if (response == 'invalid') { // 중복된 닉네임(DB에 있는 닉네임)인 경우
						$('.valid_nickname').hide(); 
						$('.invalid_nickname').show(); 
						$('.invalid_nickname2').hide();
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					/*
					} else if (spe > 0) {
						$('.valid_nickname').hide(); 
						$('.invalid_nickname').hide();  
						$('.invalid_nickname2').show(); 
					*/	
					} else {
						$('.valid_nickname').show(); 
						$('.invalid_nickname').hide(); 
						$('.invalid_nickname2').hide();
					}
				});
			});
			
			$('#user_email').change(function (event) {
				var params = { user_email: $(this).val() };
				var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				$.post('./checkemail', params, function (response) {
					if (response == 'invalid') { // 중복된 이메일(DB에 있는 이메일)인 경우
						$('.valid_email').hide(); 
						$('.invalid_email').show(); 
						$('.invalid_email2').hide();
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					/*
					} else if (!regEmail.test($(this).val())) { // 유효하지 않은 이메일인 경우
						$('.valid_email').hide(); 
						$('.invalid_email').hide(); 
						$('.invalid_email2').show(); 
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					*/	
					} else {
						$('.valid_email').show(); 
						$('.invalid_email').hide(); 
						$('#btn-complete').removeAttr('disabled'); // 버튼 활성화
					}
				});
			});
			
			$('#user_pwd').change(function (event) {
				var pwd = $(this).val();
				var num = pwd.search(/[0-9]/g);
				var eng = pwd.search(/[a-z]/ig);
				var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				/*
				if (pwd.length < 8 || pwd.length > 16) { // 8자 미만이거나 16자를 초과하면
					$('.valid_pwd').hide();
					$('.invalid_pwd').show();
				} else if(num < 0 || eng < 0 || spe < 0 ) { // 영문, 숫자, 특수문자를 모두 포함하지 않으면
					$('.valid_pwd').hide();
					$('.invalid_pwd').show();
				} else {
					$('.valid_pwd').show(); 
					$('.invalid_pwd').hide(); 
				}
				*/
			});
			
			$('#user_repwd').change(function (event) {
				if ($(this).val() == $('#user_pwd').val()) { // 비밀번호와 비밀번호 확인의 값이 같으면
					$('.valid_repwd').show(); 
					$('.invalid_repwd').hide(); 
				} else {
					$('.valid_repwd').hide();
					$('.invalid_repwd').show();
				}				
			});
			
		})
		</script>
	</body>
</html>