<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
		<title>Popcorn Box</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" 
        		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
       <style>
       	#event_reply_content {
       		width: 600px;
       	}
       </style> 		
	</head>

	<body>
	<div style="text-align:center">
		<div>
			<div>
				<c:if test="${signInUserPosition eq 'A'}">
					<a href="./update?event_no=${event.event_no}"><button>수정</button></a>
					<a id="delete_event" href="./delete?event_no=${event.event_no}"><button>삭제</button></a>
				</c:if>
				<c:if test="${signInUserPosition eq 'B'}">
					<a href="./update?event_no=${event.event_no}"><button>수정</button></a>
					<a id="delete_event" href="./delete?event_no=${event.event_no}"><button>삭제</button></a>
				</c:if>
			</div>
			
			<table class="table">
				<tbody>
					<tr>
						<td style="display: none;">${event.event_no}</td>
						<td>${event.event_title}</td>
						<td>기간: <fmt:formatDate value="${event.event_start_time}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${event.event_last_time}" pattern="yyyy.MM.dd."/></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<br>
	
		<div>
			<img alt="${event.event_title}" src="${event.event_content}">
		</div>
		
		<br>
		<hr>
		 
		<!-- 댓글 작성 양식 -->
		<div>
			<div id="reply_number"></div>
			<input type="text" id="event_reply_content" name="event_reply_content" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." />
			<input type="submit" id="btn_register_event_reply" value="등록" />
		</div>
		<hr>
		
		<!-- 댓글 목록 -->
		<div id="event_reply_list">
		
		</div>
		
		<!-- 페이지 넘버 -->
		<div id="page_number" style="width:600px; text-align:center; margin-top:10px;">
		   
		</div>
	</div>	
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <script>
        $(document).ready(function () {
           // input[id="board_reply_no"] 요소의 value 속성값을 읽음.
           var boardNo = $('#board_no').val();
           
           // 게시글 번호(boardNo)에 달려 있는 모든 댓글 목록을 읽어오는 Ajax 함수 정의(선언)
           function getAllReplies() {
              // $.getJSON(요청URL, 콜백 함수): URL로 Ajax GET 요청을 보내고 
              // JSON 문자열을 응답으로 전달받아서 처리하는 함수.
                $.getJSON('/pjt/replies/all/' + boardNo, function (respText) {
                    // console.log(data);
                    // respText: REST Controller가 보내준 JSON 형식의 문자열 - 댓글들의 배열(array)
                    
                    $('#board_replies').empty(); // div[id="replies"]의 모든 하위 요소들을 삭제
                    
                    var list = ''; // div[id="replies"]의 하위 요소(HTML 코드)를 작성할 문자열.
                    
                    // 배열 respText의 원소들을 하나씩 꺼내서 콜백 함수를 호출.
                    $(respText).each(function () {
                       var date = new Date(this.board_reply_update_time); // JavaScript Date 객체 생성
                       var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
                       list += '<div class="reply_item">'
                             + '<input type="text" id="board_reply_no" name="board_reply_no" value="'
                             + this.board_reply_no
                             + '" readonly />'
                             + '<input type="text" id="board_reply_content" name="board_reply_content" value="'
                             + this.board_reply_content
                             +'" />'
                             + '<input type="text" id="user_nickname" name="user_nickname" value="'
                             + this.user_nickname
                             + '" readonly />'
                             + '<input type="text" id="board_reply_update_time" name="board_reply_update_time" value="'
                             + dateStr
                             + '" readonly />';
                       if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 아이디와 로그인한 사용자 아이디가 같으면
                          list += '<button class="board_reply_update">수정</button>'
                               + '<button class="board_reply_delete">삭제</button>';
                       }
                       list += '</div>';
                    });
                    
                    // 완성된 HTML 문자열(list)를 div[id="replies"]의 하위 요소로 추가
                    $('#board_replies').html(list);
                    
                }); // end getJSON()
           
           } // end getAllReplies()
           
           getAllReplies(); // 함수 호출
           
           // 댓글 작성 완료 버튼 클릭 이벤트 처리
           $('#btn_create_boardReply').click(function (event) {
              // 댓글 내용을 읽음
              var replyText = $('#board_reply_content').val();
              if (replyText == '') { // 입력된 댓글 내용이 없으면
                 alert('댓글 내용을 입력하세요...');
                 $('#board_reply_content').focus();
                 return; // 콜백 함수 종료
              }
              
              // 댓글 작성자 닉네임
              var replier = $('#board_user_nickname').val();
              
              // 댓글 insert 요청을 Ajax 방식으로 보냄.
              $.ajax({
                 // 요청 주소
                 url: '/pjt/replies',
                 // 요청 타입
                 type: 'POST',
                 // 요청 HTTP 헤더
                 headers: {
                    'Content-Type': 'application/json',
                    'X-HTTP-Method-Override': 'POST'
                 },
                 // 요청에 포함되는 데이터(JSON 문자열)
                 data: JSON.stringify({
                    'board_reply_no': boardNo,
                    'board_reply_content': replyText,
                    'user_nickname': replier
                 }),
                 // 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
                 success: function (resp) {
                    console.log(resp);
                    $('#board_reply_content').val('');
                    getAllReplies();  // 댓글 목록 업데이트
                 }
              });
           });
           
           // 수정, 삭제 버튼에 대한 이벤트 리스너는 버튼들이 만들어진 이후에 등록이 되어야 함!
           $('#board_replies').on('click', '.reply_item .reply_update', function () {
              // 수정 버튼이 포함된 div 요소에 포함된 rno와 rtext를 찾아서 Ajax PUT 요청을  보냄.
              
              // $(this): 클래스 속성이 reply_update인 버튼 요소.
              var board_reply_no = $(this).prevAll('#board_reply_no').val();
              var board_reply_content = $(this).prevAll('#board_reply_content').val();
              
              $.ajax({
                 // 요청 URL
                 url: '/pjt/replies/' + board_reply_no,
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
           
           // 댓글 삭제 버튼
           $('#board_replies').on('click', '.reply_item .reply_delete', function (event) {
              var board_reply_no = $(this).prevAll('#board_reply_no').val();
              var result = confirm(board_reply_no + '번 댓글을 정말 삭제할까요?');
              if (result) { // 확인(Yes) 버튼을 클릭했을 때
                 $.ajax({
                    // 요청 URLs
                    url: '/pjt/replies/' + board_reply_no,
                    // 요청 타입
                    type: 'DELETE',
                    // 요청 헤더
                    headers: {
                       'Content-Type': 'application/json',
                       'X-HTTP-Method-Override': 'DELETE'
                    },
                    // 성공 응답 콜백 함수
                    success: function () {
                       alert(board_reply_no + '번 댓글 삭제 성공!');
                       getAllReplies();
                    }
                 });
              }
           });
           
        });
    	</script>
    </body>
</html>