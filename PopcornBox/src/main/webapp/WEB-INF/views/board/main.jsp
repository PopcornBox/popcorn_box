<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Popcornbox</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		  <link rel="stylesheet" 
        	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

	</head>
	
	       <div class="container-fluid">
	       <header class="jumbotron text-center">
        	<h3>Popcornbox 자유게시판</h3>
        	</header>
        	<div class="container">
        	<table class="table table-blue table-striped">
        	<thead>
        		<tr>
        			<th></th>
        			<th>제목</th>
        			<th>작성자</th>
        			<th>작성일</th>
        			<th>조회</th>
        		</tr>
        	</thead>
        	<tbody>
        		<c:forEach var="board" items="${boardList}">
        		<tr>
        			<td>${board.board_no}</td>
        			<td>${board.board_title}</td>
        			<td>${board.user_nickname}</td>
        			<td>
        				<fmt:formatDate value="${board.board_update_time}" pattern="yyyy/MM/dd HH:mm" />
        			</td>
        			<td>${board.board_view_cnt}</td>
        		</tr>
        		</c:forEach>
        	</tbody>
        	
        	</table>
        	
        	
        	</div>
        	
        	
        	
        	
        	
        	
        	</div>
	<body>
		
		
		       <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</body>	
</html>