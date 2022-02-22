<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopcornBox</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">

        <style>
        .reply_item {
            margin: 16px;
            border: 1px solid gray;
        }
        </style>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<a href="./signin"><img src="../resources/img/login.png"
					alt="로그인">로그인</a> <a href="./register"><img
					src="../resources/img/register.png" alt="회원가입">회원가입</a>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>PopcornBox</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7">
						<div class="header__top__left">
							<a href="../"><img src="../resources/img/popcornbox_logo.png"
								alt="logo" width="35%"></a>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<a href="./signin"><img src="../resources/img/login.png"
									alt="로그인">로그인</a> <a href="./register"><img
									src="../resources/img/register.png" alt="회원가입">회원가입</a> <a
									href="./mypage"><img src="../resources/img/mypage.png"
									alt="마이페이지">마이페이지</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="../">홈</a></li>
							<li><a href="../movie/mainlist">차트</a></li>
							<li class="active"><a href="./main">자유게시판</a></li>
							<li><a href="./pb_event.html">이벤트</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md- 10">
					<div class="header__nav__option">
						<a href="#" class="search-switch"><img
							src="img/icon/search.png" alt=""></a>

					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->



	<nav>
		<%-- 내비게이션 메뉴 --%>
		<!-- TODO 페이지 이동 메뉴 -->

		<ul>
			<c:if test="${signInUserNickname == board.user_nickname}">
				<!-- 로그인 사용자 아이디와 글 작성자 닉네임이 일치할 때만 수정 메뉴를 보여줌. -->
				<li><a href="./update?board_no=${board.board_no}">수정</a></li>
				<li><a id="menu-delete" href="./delete?board_no=${board.board_no}">삭제</a></li>
			</c:if>

		</ul>
	</nav>

	<%-- 게시글 상세보기 --%>
	<div class="container">
		<form>
			<div>
				<input type="hidden" id="board_no" value="${board.board_no}" />
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
				<input type="text" id="reg-date" name="reg_date"
					value="${last_update_time}" readonly />

			</div>
		</form>
	</div>

	<div>
		<%-- 댓글작성 --%>
		<input type="text" id="board_replye_content"
			name="board_replye_content" placeholder="댓글 입력">
		<!-- 로그인한 사용자 아이디를 inpt의 값으로  설정-->
		<input type="text" id="user_nickname" name="user_nickname"
			value="${board.user_nickname}" readonly />
		<div id="btn_create_boardReply">
			<a class="btn btn-outline-dark">댓글 작성 완료</a>
		</div>
	</div>

	<%-- 댓글 목록 --%>
	<div id="board_replies"></div>




	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img src="img/logo_white.png" alt=""></a>
						</div>
						<p>
							Copyright ©
							<script>
								document.write(new Date().getFullYear());
							</script>
							2020 All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->



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
	
	$(document).ready(function() {
		$('#menu-delete').click(function(event) {
			event.preventDefault(); // 링크를 클릭했을 때의 기본 동작인 요청 보내기를 하지 않음.
			var result = confirm('정말 삭제할까요?');
			if (result) { // 사용자가 YES를 선택했을 때
				location = $(this).attr('href'); // 원래 이동하려고 했던 요청 주소로 요청 보내기.
			}
		});
		
		
	});
	</script>

	<!-- Js Plugins -->
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.nice-select.min.js"></script>
	<script src="../resources/js/jquery.nicescroll.min.js"></script>
	<script src="../resources/js/jquery.magnific-popup.min.js"></script>
	<script src="../resources/js/jquery.countdown.min.js"></script>
	<script src="../resources/js/jquery.slicknav.js"></script>
	<script src="../resources/js/mixitup.min.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/main.js"></script>



	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>