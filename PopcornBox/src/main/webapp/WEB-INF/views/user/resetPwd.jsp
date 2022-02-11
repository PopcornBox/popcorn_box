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
	    .valid_pwd, .valid_repwd {
			color: green;
			display: none;
		}	
		.invalid_pwd, .invalid_repwd {
			color: red;
			display: none;
		}	
		</style>	
        		
	</head>

	<body>
		<div style="margin: 100px;">
  <!--  <a><img src="${pageContext.request.contextPath}/images/popcornbox-logo.png" 
		      			style="height: 80px; margin-left: 10px;" /></a> -->
		<br>
		<h3>안녕하세요, ${param.user_nickname} 님</h3>
		<br>
		<p>본인인증이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>아래에서 비밀번호를 재설정한 후, 모든 서비스를 이용하실 수 있습니다.</p>
		<br>
		<br>
		
		<hr>			
			<div>
				<form action="./key_validate" method="post">
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
						<input type="hidden" id="user_nickname" name="user_nickname" value="${param.user_nickname}" />
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
			$('#user_pwd').change(function (event) {
				var pwd = $(this).val();
				var num = pwd.search(/[0-9]/g);
				var eng = pwd.search(/[a-z]/ig);
				var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				/*
				if (pwd.length < 8 || pwd.length > 16) { // 8자 미만이거나 16자를 초과하면
					$('.valid_pwd').hide();
					$('.invalid_pwd').show();
					$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
				} else if(num < 0 || eng < 0 || spe < 0 ) { // 영문, 숫자, 특수문자를 모두 포함하지 않으면
					$('.valid_pwd').hide();
					$('.invalid_pwd').show();
					$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
				} else {
					$('.valid_pwd').show(); 
					$('.invalid_pwd').hide(); 
					$('#btn-complete').removeAttr('disabled'); // 버튼 활성화
				}
				*/
			});
			
			$('#user_repwd').change(function (event) {
				if ($(this).val() == $('#user_pwd').val()) { // 비밀번호와 비밀번호 확인의 값이 같으면
					$('.valid_repwd').show(); 
					$('.invalid_repwd').hide(); 
					$('#btn-complete').removeAttr('disabled'); // 버튼 활성화
				} else {
					$('.valid_repwd').hide();
					$('.invalid_repwd').show();
					$('#btn-complete').attr('disabled', 'true'); // 버튼 비활성화
				}				
			});
		});
		</script>	
    	
    </body>
</html>