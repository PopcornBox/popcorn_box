<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	</head>
	<body>	
	
		<div style="margin: 100px;">
			<form action="./leave" method="post">
			<br>
			<h4>탈퇴 안내</h4>
			<hr><br>
			<p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
			<hr><br>
			<p>사용하고 계신 아이디(${user.user_id})와 닉네임(${signInUserNickname})은 탈퇴할 경우 재사용이 가능합니다.</p>
			<br>
			<p>게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</p>
			<p>삭제를 원하는 게시물이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.<p>
			<p>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시물을 임의로 삭제해드릴 수 없습니다.</p>
			<br><hr>
			<p>탈퇴를 원하시면 비밀번호를 입력해주세요.</p>
			<div>
				<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호" class="checkout__input__add" required />
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