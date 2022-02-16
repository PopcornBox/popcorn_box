<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
	</head>
	<body>
		<h1>userInfo 페이지입니다.</h1>
		 <fieldset>
			<div class="form-group">
				<label class="control-label" for="fullName">ID</label>
                <input type="text" name="userId" class="form-control input-sm"  value="${user_id}" id="memberId" readonly>
            </div>
            <div class="form-group">
            	<label class="control-label" for="nickname">닉네임</label>
  				<input type="text" name="userNickname" class="form-control input-sm" placeholder="닉네임"  value="${user_nickname}" id="memberName">
			</div>
                    
			<div class="form-group">
				<label class="control-label" for="nickname">이메일</label>
				<input type="email" name="userEmail" class="form-control input-sm" placeholder="이메일" value="${user_email}" id="memberEmail">
			</div>
			<div class="form-group">
				<label class="control-label" for="user_update_time">가입 일자</label>
                <input type="text" name="userUpdateTime" class="form-control input-sm"  value="${user_update_time}" id="memberId" readonly>
			</div>
		</fieldset>
                
		<input type="button" value="메인으로" class="btn" onclick="location.href='/pjt'">
		
		
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>