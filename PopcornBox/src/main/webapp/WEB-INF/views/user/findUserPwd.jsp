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
				<h1>비밀번호 찾기</h1>
			</header>
			
			<div>
				<div>
					<p>비밀번호를 찾고자 하는 계정의 아이디와 이메일을 입력해주세요.</p>
				</div>
				
				<form action="./find_userpwd" method="post">
				     <div>
						<input type="text" name="user_id" placeholder="아이디 입력" required />
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