<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Popcorn Box</title>

		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" 
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
		<style>
		.valid_id {
			color: green;
			display: none;
		}	
		.invalid_Id {
			color: red;
			display: none;
		}	
		</style>	
	</head>
	<body>
		<div class="container-fluid">
			<header class="text-center">
				<h1>회원 가입 페이지</h1>
			</header>
			
			<nav> <!-- TODO: 페이지 이동 메뉴 -->
			</nav>
			
			<div>
				<form action="./register" method="post">
					<div>
						<input type="text" id="user_id" name="user_id" placeholder="아이디" required />
						<div class="valid_id">사용 가능한 아이디입니다!</div>
						<div class="invalid_id">이미 사용 중인 아이디입니다.</div>
					</div>
					<div>
						<input type="text" id="user_nickname" name="user_nickname" placeholder="닉네임" required />
						<div class="valid_nick">사용 가능한 닉네임입니다!</div>
						<div class="invalid_nick">이미 사용 중인 닉네임입니다.</div>
					</div>
					<div>
						<input type="password" name="user_pwd" placeholder="비밀번호" required />
					</div>
					<div>
						<input type="password" name="user_pwd" placeholder="비밀번호 확인" required />
					</div>
					<div>
						<input type="email" id="user_email" name="user_email" placeholder="abc@abc.com" required />
						<div class="valid_email">사용 가능한 이메일입니다!</div>
						<div class="invalid_email">이미 사용 중인 이메일입니다.</div>
					</div>
					<div>
						<input type="submit" id="btn-complete" value="작성 완료" />
					</div>
				</form>
			</div>
			
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script>
		$(document).ready(function () {
			
			// user_id 아이디를 갖는 HTML 요소(input)에 변화가 생겼을 때 호출될 이벤트 리스너 콜백 함수를 등록
			$('#user_id').change(function (event) {
				// Ajax를 이용해서 아이디 중복 체크
				var params = { user_id: $(this).val() };
				// $.post(Ajax 요청 주소, 요청 파라미터, 응답 성공일 때 실행될 콜백 함수);
				$.post('./checkid', params, function (response) {
					if (response == 'valid') { // 사용 가능한 아이디(DB에 없는 아이디)인 경우
						$('.valid_id').show(); // valid div 보여줌
						$('.invalid_id').hide(); // invalid div 없앰(display=none)
						$('#btn-complete').removeAttr('disabled'); // 버튼 활성화
					} else {
						$('.valid_id').hide(); // valid div 없앰(display=none)
						$('.invalid_id').show(); // invalid div 보여줌
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					}
				});
			});
			
			$('#user_nickname').change(function (event) {
				var params = { user_nickname: $(this).val() };
				$.post('./checknickname', params, function (response) {
					if (response == 'valid') { // 사용 가능한 닉네임(DB에 없는 닉네임)인 경우
						$('.valid_nick').show(); // valid div 보여줌
						$('.invalid_nick').hide(); // invalid div 없앰(display=none)
						$('#btn-complete').removeAttr('disabled'); // 버튼 활성화
					} else {
						$('.valid_nick').hide(); // valid div 없앰(display=none)
						$('.invalid_nick').show(); // invalid div 보여줌
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					}
				});
			});
			
			$('#user_email').change(function (event) {
				var params = { user_email: $(this).val() };
				$.post('./checkemail', params, function (response) {
					if (response == 'valid') { // 사용 가능한 이메일(DB에 없는 이메일)인 경우
						$('.valid_email').show(); // valid div 보여줌
						$('.invalid_email').hide(); // invalid div 없앰(display=none)
						$('#btn-complete').removeAttr('disabled'); // 버튼 활성화
					} else {
						$('.valid_email').hide(); // valid div 없앰(display=none)
						$('.invalid_email').show(); // invalid div 보여줌
						$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
					}
				});
			});
			
		})
		</script>
	</body>
</html>