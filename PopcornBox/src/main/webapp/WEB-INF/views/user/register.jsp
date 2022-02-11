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
		<div class="container-fluid">
			<header class="text-center">
				<h1>회원가입</h1>
			</header>
			
			<nav> <!-- TODO: 페이지 이동 메뉴 -->
			</nav>
			
			<div>
				<form action="./register" method="post">
					<div>
						<input type="text" id="user_id" name="user_id" placeholder="아이디" required />
						<div class="valid_id">사용 가능한 아이디입니다!</div>
						<div class="invalid_id">이미 사용 중인 아이디입니다.</div>
						<div class="invalid_id2">5~20자의 영문, 숫자만 사용 가능합니다.</div>
					</div>
					<div>
						<input type="text" id="user_nickname" name="user_nickname" placeholder="닉네임" required />
						<div class="valid_nickname">사용 가능한 닉네임입니다!</div>
						<div class="invalid_nickname">이미 사용 중인 닉네임입니다.</div>
						<div class="invalid_nickname2">15자 이내의 한글, 영문, 숫자만 사용 가능합니다.</div>
					</div>
					<div>
						<input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호" required />
						<div class="valid_pwd">사용 가능한 비밀번호입니다!</div>
						<div class="invalid_pwd">8~16자의 영문, 숫자, 특수문자를 사용하세요.</div>
					</div>
					<div>
						<input type="password" id="user_repwd" name="user_repwd" placeholder="비밀번호 확인" required />
						<div class="valid_repwd">비밀번호가 일치합니다!</div>
						<div class="invalid_repwd">비밀번호가 일치하지 않습니다.</div>
					</div>
					<div>
						<input type="email" id="user_email" name="user_email" placeholder="abc@abc.com" required />
						<div class="valid_email">사용 가능한 이메일입니다!</div>
						<div class="invalid_email">이미 사용 중인 이메일입니다.</div>
						<div class="invalid_email2">이메일이 유효하지 않습니다.</div>
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
						$('#btn-complete').removeAttr('disabled'); // 버튼 활성화
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