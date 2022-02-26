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

<style>
	.txt_1 td:first-child:after {
		color:red;
		content: "공지";
	}
	.txt_1 a { color:red !important;}
	.pagingView_area{
		max-width:500px;
		margin-left: auto;
		margin-right: auto;	
		display: flex;
	}
	
	.pagingView{
	list-style : none;
	display: inline-block;
    margin-left: auto;
    margin-right: auto;       
	margin-top: 50px;
  }
   .pagingView li{
   float: left;
   font-size: 20px;
   margin-left: 18px;
   padding: 7px;
   font-weight: 500;
  }

</style>



</head>
<body>



   <div class="container-fluid">
      <div class="container" style="margin-bottom: 20px;">


			<table class="table table-hover">
				<thead>
					<tr>
						<th></th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr class="txt_${board.board_mode}">
							<td></td>
							<td ><a href="./detail?board_no=${board.board_no}">${board.board_title}</a>
								<span>[${board.board_reply_cnt}]</span></td>
							<td>${board.user_nickname}</td>
							
							<td><fmt:formatDate value="${board.board_update_time}"
									pattern="yyyy/MM/dd HH:mm" /></td>
							<td>${board.board_view_cnt}</td>
						</tr>
					</c:forEach>
				</tbody>

         </table>
         
         <!-- 페이징 기능 구현 -->
         <div class="pagingView_area">
              <ul id="pagingView" class="pagingView">
                <c:if test="${pagingView.prev}">
                   <li><a href="main${pagingView.makeQuery(pagingView.startPage - 1)}">이전</a></li>
                </c:if> 

                <c:forEach begin="${pagingView.startPage}" end="${pagingView.endPage}" var="page">
                   <li><a href="main${pagingView.makeQuery(page)}">${page}</a></li>
                </c:forEach>

    				<c:if test="${pagingView.next && pagingView.endPage > 0}">
    					<li><a href="main${pagingView.makeQuery(pagingView.endPage + 1)}">다음</a></li>
    				</c:if> 
  				</ul>
			</div>


			<div class="btnbox">
				<div id="main-insertbtn">
					<a href="./insert" class="primary-btn">새 글 작성</a>
				</div>
				<c:if test="${signInUserPosition eq 'A'}">
					<div id="main-insertbtn">
						<a href="./notice" class="primary-btn">공지 작성</a>
					</div>
				</c:if>
				<c:if test="${signInUserPosition eq 'B'}">
					<div id="main-insertbtn">
						<a href="./notice" class="primary-btn">공지 작성</a>
					</div>
				</c:if>
			</div>




		</div>


	</div>



<%@ include file="../footer.jsp"%>
   <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>