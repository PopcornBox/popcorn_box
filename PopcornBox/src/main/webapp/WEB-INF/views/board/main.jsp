<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopcornBox</title>



</head>
<body>




	<div class="container-fluid">
		<div class="container">


			<table class="table table-hover">
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
							<td><a href="./detail?board_no=${board.board_no}">${board.board_title}</a>
								<span>[${board.board_reply_cnt}]</span></td>
							<td>${board.user_nickname}</td>
							<td><fmt:formatDate value="${board.board_update_time}"
									pattern="yyyy/MM/dd HH:mm" /></td>
							<td>${board.board_view_cnt}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>



			<div id="main-insertbtn">
				<a href="./insert" class="btn btn-outline-dark">새 글 작성</a>
			</div>
			<c:if test="${signInUserPosition eq 'A'}">
				<div id="main-insertbtn">
					<a href="./notice" class="btn btn-outline-dark">공지 작성</a>
				</div>
			</c:if>
			<c:if test="${signInUserPosition eq 'B'}">
				<div id="main-insertbtn">
					<a href="./notice" class="btn btn-outline-dark">공지 작성</a>
				</div>
			</c:if>





		</div>


	</div>



<%@ include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>