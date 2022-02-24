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
	</head>

	<body>
		<div class="container-fluid">
			<header class="text-center">
				<h1>아이디 찾기</h1>
			</header>
			
			<div>
				<form action="./find_userid" method="post">
					<div>
						<h4>본인확인 이메일로 인증</h4>
					</div>
					<div>
						<h6>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 아이디가 이메일로 전송됩니다.</h6>
					</div>
				
					<div>
						<input type="email" name="user_email" placeholder="이메일 입력" required />
					</div>
					<div>
						<input type="submit" value="확인" />
					</div>
					<div>
						<input type="hidden" name="msg" value="${msg}" />
					</div>
				</form>
			</div>
			
		</div>
		
		
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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