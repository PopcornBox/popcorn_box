<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      #board_reply_content {
      width: 600px;
      }

</style>

</head>
<body>


	<%-- 게시글 상세보기 --%>
	<div class="container">
			 <c:if test="${signInUserNickname == board.user_nickname}">
               <div style="margin-left: auto; margin-right: 30px;">
                  <!-- 로그인 사용자 아이디와 글 작성자 아이디가 일치할 때만 수정 메뉴를 보여줌. -->
                  <ul style="display: inline-flex; list-style: none;font-size: 14px;">
                     <li>
                        <a href="./update?board_no=${board.board_no}">글 수정 |</a>
                     </li>
                     <li> 
                        <a id="menu-delete" href="./delete?board_no=${board.board_no}">삭제</a>
                     </li>
                  </ul>
               </div>
            </c:if>
	
	
	
		<form>
			<div>
				<input type="hidden" id="board_no" value="${board.board_no}" />
				<%-- 글번호 숨김 --%>
			</div>
			<div>
				<label for="title">글 제목</label> <input type="text" id="board_title"
					name="board_title" value="${board.board_title}" required autofocus
					readonly />
			</div>
			<div>
				<label for="content">글 내용</label>
				<textarea rows="5" id="board_content" name="board_content" required
					readonly>${board.board_content}</textarea>
			</div>
			<div>
				<label for="board_user_nickname">닉네임</label> <input type="text"
					id="board_user_nickname" name="board_user_nickname"
					value="${board.user_nickname}" required readonly />
			</div>
			<div>
				<label for="reg_date">최종 수정 시간</label>
				<fmt:formatDate value="${board.board_update_time}"
					pattern="yyyy/MM/dd HH/mm/ss" var="last_update_time" />
				<input type="text" id="board_update_time" name="board_update_time"
					value="${last_update_time}" readonly />
			</div>
		</form>
		
		

		
		
	</div>

	<div>
		<%-- 댓글작성 --%>

		<input type="text" id="board_reply_content"
			name="board_reply_content" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." />
		<!-- 로그인한 사용자 아이디를 input의 값으로  설정-->
		<input type="text" id="user_nickname" name="user_nickname"
			value="${board.user_nickname}" readonly />
		<button id="btn_create_boardReply" class="btn btn-outline-dark">
			댓글 작성 완료</button>
	</div>

	<%-- 댓글 목록 --%>
	<div id="board_replies">
	</div>



	<%@ include file="../footer.jsp"%>



	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function() {
							// input[id="board_no"] 요소의 value 속성값을 읽음.
							var boardNo = $('#board_no').val();
				
							// 게시글 번호(boardNo)에 달려 있는 모든 댓글 목록을 읽어오는 Ajax 함수 정의(선언)
							function getAllReplies() {
								// $.getJSON(요청URL, 콜백 함수): URL로 Ajax GET 요청을 보내고 
								// JSON 문자열을 응답으로 전달받아서 처리하는 함수.
								$.getJSON('/pjt/board_replies/all/' + boardNo, function(respText) {
													
								$('#board_replies').empty();
								
								var list = '';
								
								
								$(respText).each(function () {
									//console.log(this);
									var date = new Date(this.board_reply_update_time);
									var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
									list += '<div class="reply_item">'
										+ '<input type="text" id="board_reply_no" name="board_reply_no" value="'
										+ this.board_reply_no
										+ '" readonly />'
										+ '<input type="text" id="board_reply_content" name="board_reply_content" value="'
										+ this.board_reply_content
										+ '" />'
										+ '<input type="text" id="user_nickname" name="user_nickname" value="'
										+ this.user_nickname
										+ '" readonly />'
										+ '<input type="text" id="board_reply_update_time" name="board_reply_update_time" value="'
										+ dateStr
										+ '" readonly />';
										if (this.user_nickname == '${signInUserNickname}'){
											list += '<button class="reply_update">수정</button>'
				                    			  + '<button class="reply_delete">삭제</button>';
										}
										list += '</div>';
								});
								
								$('#board_replies').html(list);
								
								}); // end getJSON()
							} //getAllReplies()
							
							getAllReplies(); //함수 호출
							// 댓글 작성 완료 버튼 클릭 이벤트 처리
							$('#btn_create_boardReply').click(function (event) {
								// 댓글 내용을 읽음
								var replyText = $('#board_reply_content').val();
								if (replyText == '') { // 입력된 댓글이 없으면
									alert('댓글 내용을 입력하세요...');
									$('#board_replye_content').focus();
									return; // 콜백함수종료
								}
								
								// 댓글 작성자 아이디
								var replier = $('#user_nickname').val();
								$.ajax({
									url: '/pjt/board_replies',
									type: 'POST',
									headers: {
										'Content-Type': 'application/json',
										'X-HTTP-Method-Override': 'POST'
									},
									data: JSON.stringify({
										'board_no': boardNo,
										'board_reply_content': replyText,
										'user_nickname': replier
										
									}),
									success: function (resp) {
										console.log(resp);
										$('#board_reply_content').val('');
										getAllReplies(); // 댓글 목록 업데이트
									}
								});
							});
							
							
							$('#board_replies').on('click', '.reply_item .reply_update', function () {
								// 수정 버튼이 포함된 div 요소에 포함된 board_rply_no와 
								//  $(this) reply_update인 버튼 요소
								var board_reply_no = $(this).prevAll('#board_reply_no').val();
								var board_reply_content = $(this).prevAll('#board_reply_content').val();
								
				        		$.ajax({
				        			// 요청 URL
				        			url: '/pjt/board_replies/' + board_reply_no,
				        			// 요청 방식
				        			type: 'PUT',
				        			// 요청 패킷 헤더
				        			headers: {
				        				'Content-Type': 'application/json',
				        				'X-HTTP-Method-Override': 'PUT'
				        			},
				        			// 요청 패킷 데이터
				        			data: JSON.stringify({'board_reply_content': board_reply_content}),
				        			// 성공 응답 콜백 함수
				        			success: function () {
				        				alert(board_reply_no + ' 댓글 수정 성공!');
				        				getAllReplies(); // 댓글 목록 업데이트
				        			}
				        		});
								
							});
							
							//댓글 삭제 버튼
							$('#board_replies').on('click', '.reply_item .reply_delete', function (event) {
								//console.log(this);
								var board_reply_no = $(this).prevAll('#board_reply_no').val();
								var result = confirm(board_reply_no + '번 댓글을 정말 삭제할까요?')
								
								if (result) {
									$.ajax({
									// Ajax
									url: '/pjt/board_replies' + board_reply_no,
									type:'DELETE',
									headers: {
										'Content-Type': 'application/json',
				        				'X-HTTP-Method-Override': 'DELETE'
									},
				        			success: function () {
				        				alert(board_reply_no + ' 번 댓글 삭제 성공!');
				        				getAllReplies(); // 댓글 목록 업데이트
								}  
							});
						}
					});
				});
	</script>
</body>
</html>