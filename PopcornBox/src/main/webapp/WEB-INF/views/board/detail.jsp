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
    <script src="https://kit.fontawesome.com/a39158855c.js" crossorigin="anonymous"></script>

</head>
<body>         

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
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
            <ul>
            	<c:if test="${empty signInUserNickname}">
					<%-- 로그인 되어 있지 않은 경우 --%>					
					<li><a href="../user/signin">로그인</a></li>
					<li><a href="../user/register">회원가입</a></li>
					<li><a href="../user/mypage">마이페이지</a></li>
			                <li><a href="./event/main">이벤트</a></li>
				</c:if>
				<c:if test="${not empty signInUserNickname}">
					<%-- 로그인 되어 있는 경우 --%>
					<li><span>${signInUserNickname} 님</span></li>
					<li>　</li>
					<li><a href="../user/signout">로그아웃</a></li>
					<li><a href="../user/register">회원가입</a></li>
					<li><a href="../user/mypage">마이페이지</a></li>
					<li><a href="../event/main">이벤트</a></li>
				</c:if>
            </ul>
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


    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-lg-6 col-md-7">
	                            <div class="header__top__left">
	                                  <a href="../"><img src="../resources/img/popcornbox_logo.png" alt="logo"></a>
	                            </div>
	                        </div>
	                        <div class="col-lg-6 col-md-5">
	                            <div class="header__top__right">
	                                <div class="header__top__links">
	                                	<c:if test="${empty signInUserNickname}">
											<%-- 로그인 되어 있지 않은 경우 --%>
											<a href="../user/signin"><i class="fa-solid fa-lock"></i>로그인</a>
		                                    <a href="../user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
		                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
										</c:if>
										<c:if test="${not empty signInUserNickname}">
											<%-- 로그인 되어 있는 경우 --%>
											<c:if test="${empty accessToken}">
												<%-- 일반 로그인의 경우 --%>  
												<span>${signInUserNickname} 님</span><br>
												<a href="../user/signout"><i class="fa-solid fa-lock"></i>로그아웃</a>
												<a href="../user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
			                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
		                                    </c:if>	 
		                                    <c:if test="${not empty accessToken}">
		                                    	<%-- 카카오 로그인의 경우 --%>  
			                                    <span>${signInUserNickname} 님</span><br>
			                                    <a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
			                                    	<i class="fa-solid fa-lock"></i>로그아웃</a>
												<a href="./user/register"><i class="fa-solid fa-user-plus"></i>회원가입</a>
			                                    <a href="./user/mypage"><i class="fa-solid fa-user"></i>마이페이지</a>
											</c:if>	 
										</c:if>	                  
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        <div class="container">
            <div class="row" class="header__row__">

                <div class="col-md-7 col-md-4">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="../">홈</a></li>
                            <li><a href="../movie/mainlist">차트</a></li>
                            <li class="active"><a href="../board/main">커뮤니티</a></li>
                            <li><a href="../event/main">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
	
	<hr>


	<nav>
		<%-- 내비게이션 메뉴 --%>
		<!-- TODO 페이지 이동 메뉴 -->

		<ul>
			<c:if test="${signInUserNickname == board.user_nickname}">

				<!-- 로그인 사용자 아이디와 글 작성자 닉네임이 일치할 때만 수정 메뉴를 보여줌. -->
				<li><a href="./update?board_no=${board.board_no}">수정</a></li>

				<!-- 로그인 사용자 아이디와 글 작성자 아이디가 일치할 때만 수정 메뉴를 보여줌. -->
				<li><a href="./update?board_no=${board.board_no}">글 수정</a></li>

			</c:if>
		</ul>
	</nav>

	<%-- 게시글 상세보기 --%>
	<div class="container">
	<div class="contact__form">
		<form>
			<div>
				<input type="hidden" id="board_no" value="${board.board_no}" />
			</div>
			<div class="contact__form">
				<div id="board_title"
					name="board_title">${board.board_title}</div>
			</div>
			<div class="row">
				<div>
					<i class="fa-solid fa-user"></i>
				</div>
				<div>
					<input type="text"
						id="board_user_nickname" name="board_user_nickname"
						value="${board.user_nickname}" required readonly />
				</div>
			</div>
			<div>
				<fmt:formatDate value="${board.board_update_time}"
					pattern="yy/MM/dd  HH:mm" var="last_update_time" />
				<input type="text" id="reg-date" name="reg_date"
					value="${last_update_time}" readonly />
			</div>
			<hr>
			<div class="content_text">
				<div style="white-space:pre-wrap" id="board_content" name="board_content" required
					readonly>${board.board_content}</div>
			</div>
		</form>
		</div>
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
	<div id="board_replies">
	
	</div>




     <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
        	<div class="row">
                   <div class="footer__about">
                       <div class="footer__logo">
                           <a href="../"><img src="../resources/img/popcornbox_logo.png"></a>
                       </div>
                   </div>
               <div class="footer_text">
               	<div>
                	<p>popcompany | 대표 김유은</p>
                	<p>서울특별시 강남구 테헤란로 124 4층 | 사업자 등록번호 11110 22220 3333</p>
                	<p>
                		   <a href="../">서비스 소개 </a>
                           | 
                           <a href="../">이용약관 </a>
                           | 
                           <a href="../">개인정보 처리 방침 </a>
                           | 
                           <a href="../">고객센터 </a>
                           | 
                       	<a href="https://github.com/PopcornBox/popcorn_box">Github </a>
                       </p>
                       <p>Copyright ©
                           <script>
                               document.write(new Date().getFullYear());
                           </script>2020 Popcorn Box. All rights reserved  
                       </p>
                       
               	</div>
               </div>
        	</div>
           </div>
    </footer>
    <!-- Footer Section End -->

	<script>
	$(document).ready(function() {
			$('#board_reply_content').click(function() {
				if('${q}' >= 0) {
					if ('${signInUserNickname}' == null || '${signInUserNickname}' == '') {
						var message = '로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?';
						var result = confirm(message);
						if (result == true) {
						location.href = '/pjt/board/signin?board_no=' + ${board.board_no} + '&q=' + ${q};
						}
					}
				}
			
			});
					
			if ('${q}' < 0) {
				$('#btn_register_board_reply').attr('disabled', true);
			}
			
        	
			var board_no = '${board.board_no}';
        	// 해당 이벤트 게시글에 대한 모든 댓글 목록을 읽어오는 Ajax 함수 정의(선언)
        	function getAllboardReplies() {
        		// $.getJSON(요청URL, 콜백 함수): URL로 Ajax GET 요청을 보내고 
        		// JSON 문자열을 응답으로 전달받아서 처리하는 함수.
                $.getJSON('/pjt/board_replies/all/' + board_no, function (respText) {
                    // respText: REST Controller가 보내준 JSON 형식의 문자열 - 댓글들의 배열(array)
                    
               		var n = respText.length; 
                	if (n > 0) {
                		$('#reply_number').html(n + '개의 댓글이 있습니다.');
                		
                		var lastpage = parseInt((n + 9) / 10);
                	    
                    	var numberlist = '';
                        for (var i = 1; i <= lastpage; i++) {
                        	numberlist += '<a href="./detail?board_no=' + ${board.board_no} + '&q=' + ${q} + '&vpage=' + i + '">' + i + '</a> ';
                        }
                         $('#page_number').html(numberlist);
                	}
                	
               
                });
                
                 $.getJSON('/pjt/board_replies/all/' + board_no + '/' + ${viewpage}, function (respText) {
                	 $('#board_reply_list').empty(); // 모든 하위 요소들을 삭제
                     
                     var board_list = ''; // 하위 요소(HTML 코드)를 작성할 문자열.
                     
                     // 배열 respText의 원소들을 하나씩 꺼내서 콜백 함수를 호출.
                     $(respText).each(function () {
                     	var date = new Date(this.board_reply_update_time); // JavaScript Date 객체 생성
                     	var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
                     	
                         	board_list += '<div class="board_reply_item">'
                                             + '<input type="hidden" id="board_reply_no" name="board_reply_no" value="'
                     		   				+ this.board_reply_no
                     		  				+ '" readonly />';
                         if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면	  				
                         	 board_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="board_reply_content" name="board_reply_content" value="'
   		  									+ this.board_reply_content
  		   		   			    			+'" readonly />';
                         } else {
                         	board_list += '<input type="text" id="board_reply_content" name="board_reply_content" value="'
	  									+ this.board_reply_content
	   		   			    			+'" readonly />';
                         }
                         if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
                              board_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="user_nickname" name="user_nickname" value="'
                     		            	+ this.user_nickname
                     		            	+ '" readonly />';
                         } else {
                         	board_list += '<input type="text" id="user_nickname" name="user_nickname" value="'
         		            				+ this.user_nickname.substring(0,1) + '*' + this.user_nickname.substring(2, this.user_nickname.length)
         		            				+ '" readonly />';
                         }
                         if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
                         	board_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="board_reply_update_time" name="board_reply_update_time" value="'
                     		           		+ dateStr
                     		            	+ '" readonly />';
                         } else {
                         	board_list += '<input type="text" id="board_reply_update_time" name="board_reply_update_time" value="'
     		           						+ dateStr
     		            					+ '" readonly />';
                         }
                     	if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
                     		board_list += '<button class="board_reply_update">수정</button>'
                     			          + '<button class="board_reply_delete">x</button>';
                     	}
                     	board_list += '</div>';
                     	    
                     });
                     
                     // 완성된 HTML 문자열(list)를 하위 요소로 추가
                     $('#board_reply_list').html(board_list);
                     
                 }); // end getJSON()
        	}	
         	
        	getAllboardReplies(); // 함수 호출
        	
  
        	
			// 새 이벤트 댓글 등록
			$('#btn_register_board_reply').click(function(board) {
				
				var board_reply_content = $('#board_reply_content').val();
				if (board_reply_content == '') {
					alert('내용을 입력해주세요.');
					$('#board_reply_content').focus();
					return;
				}
				
        		// 댓글 insert 요청을 Ajax 방식으로 보냄.
        		$.ajax({
        			// 요청 주소
        			url: '/pjt/board_replies',
        			// 요청 타입
        			type: 'POST',
        			// 요청 HTTP 헤더
        			headers: {
        				'Content-Type': 'application/json',
        				'X-HTTP-Method-Override': 'POST'
        			},
        			// 요청에 포함되는 데이터(JSON 문자열)
        			data: JSON.stringify({
        				'board_no': '${board.board_no}',
        				'board_reply_content': board_reply_content,
        				'user_nickname': '${signInUserNickname}'
        			}),
        			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
        			success: function (resp) {
        				if (resp == 0) {
        					alert('이미 이벤트에 참여하셨습니다.');
        				}
        				
        				$('#board_reply_content').val('');
        				
        				getAllboardReplies();  // 댓글 목록 업데이트
        			}
        		});
			});
        	
        	
        	
        	
			$('#board_reply_list').on('click', '.board_reply_item .board_reply_update', function () {
				
				$(this).prevAll('#board_reply_content').attr('readonly', false);
				$(this).prevAll('#board_reply_content').focus();
				
				$(this).prevAll('#board_reply_content').on("change", function(){
					$('#board_reply_list').on('click', '.board_reply_item .board_reply_update', function () {
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
            						alert(' 댓글 수정 성공!');
            						getAllboardReplies(); // 댓글 목록 업데이트
            			}
            		});
				  });
				});
			});
                
                
			// 댓글 삭제
        	$('#board_reply_list').on('click', '.board_reply_item .board_reply_delete', function (board) {
        		var board_reply_no = $(this).prevAll('#board_reply_no').val();
        		var result = confirm('댓글을 정말 삭제할까요?');
        		if (result) { // 확인(Yes) 버튼을 클릭했을 때
        			$.ajax({
        				// 요청 URL
        				url: '/pjt/board_replies/' + board_reply_no,
        				// 요청 타입
        				type: 'DELETE',
        				// 요청 헤더
        				headers: {
        					'Content-Type': 'application/json',
        					'X-HTTP-Method-Override': 'DELETE'
        				},
        				// 성공 응답 콜백 함수
        				success: function () {
        					alert('댓글 삭제 성공!');
        					getAllboardReplies();
        				}
        			});
        		}
        	});
			
			
			$('#delete_board').click(function(board) {
				board.prboardDefault();
				var answer = confirm('정말 삭제할까요?');
				if (answer) {
					location.href = '/pjt/board/delete?board_no=${board.board_no}';
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



	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>