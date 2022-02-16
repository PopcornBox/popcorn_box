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
	<% String user_id = (String) session.getAttribute("user_id"); %>
		<h1>userInfo 페이지입니다.</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>${user.user_id}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${user.user_pwd}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${user.user_nickname}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${user.user_email}</td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td>${user.user_update_time}</td>
			</tr>
		</table>
		<input type="button" value="메인으로" class="btn" onclick="location.href='/pjt'">
		
		
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>