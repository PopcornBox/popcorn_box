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
      color:#f90a37;
      content: "공지";	    
   }
   
   .txt_1 a { 
   		color:#f90a37 !important;
   	}
   	
   	#page1 {
      max-width:250px;
      margin-left: auto;
      margin-right: auto;  
   	}
   	
   	#next{
   	
   	}
  
</style>



</head>
<body>



   <div class="container-fluid">
      <div class="container" style="margin-bottom: 20px;">


         <table class="table table-hover ">
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
         
         



        <div id="page1"></div>
        <div style="display: none;" id="next" ><a href="#"> 다음</a></div>
        <div style="display: none;" id="prev"><a href="#"> 이전</a></div>
        <div style="display: none;" id="page2"></div>
        
        
        
        
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

	<script>
		$(document).ready(function() {
			var page_number = '${last_page}';
			
			if (page_number == 0) {
				$('#page1').html('');
				return;
			}
			
			if (page_number < 6) {
			
				var text = '';
				for (var i = 1; i <= page_number; i++) {
				
					text += '<a href="./answer?page=' + i + '">' + i + '</a>&nbsp;&nbsp;';
				}
			
				$('#page1').html(text);
				
			} else {
				var text1 = '';
				var text2 = '';
				
				for (var i = 1; i <= 5; i++) {
					text1 += '<a href="./answer?page=' + i + '">' + i + '</a>&nbsp;&nbsp;';
				}
				$('#page1').html(text1);
				
				for (var i = 6; i <= page_number; i++) {
					text2 += '<a href="./answer?page=' + i + '">' + i + '</a>&nbsp;&nbsp;';
				}
				$('#page2').html(text2);
				
				$('#next').show();
			}
			
			$('#next').click(function() {
				
				location.href = '/pjt/board/answer?page=6';
			});
			
			
			var search = location.search;
			var params = new URLSearchParams(search);
		    var getPage = params.get('page');
			
			if (getPage >= 6) {
				$('#page1').hide();
				$('#page2').show();
				$('#next').hide();
				$('#prev').show();
			}
				
		
			
			$('#prev').click(function() {
				$('#page1').show();
				$('#page2').hide();
				$('#next').show();
				$('#prev').hide();
				
				location.href = '/pjt/board/answer?page=5';
			});
		});
	</script>

</body>
</html>
