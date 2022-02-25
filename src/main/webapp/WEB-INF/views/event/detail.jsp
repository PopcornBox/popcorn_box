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
       
<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
   rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"
   type="text/css">
<link rel="stylesheet" href="../resources/css/bootstrap_watch.min.css"
   type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"
   type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css"
   type="text/css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css"
   type="text/css">
<!-- <link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css"> -->
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
   type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
   type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
       
       
       <style>
       	#event_reply_content {
       		width: 600px;
       	}
       </style> 	
       
       		
    <script src="https://kit.fontawesome.com/a39158855c.js" crossorigin="anonymous"></script>

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
                            <li><a href="../board/main">커뮤니티</a></li>
                            <li class="active"><a href="../event/main">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->
    
    
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
	
	   <!-- Js Plugins -->
   <script src="../resources/js/jquery-3.3.1.min.js"></script>
   <script src="../resources/js/bootstrap.min.js"></script>
   <!-- <script src="../resources/js/jquery.nice-select.min.js"></script> -->
   <script src="../resources/js/jquery.nicescroll.min.js"></script>
   <script src="../resources/js/jquery.magnific-popup.min.js"></script>
   <script src="../resources/js/jquery.countdown.min.js"></script>
   <script src="../resources/js/jquery.slicknav.js"></script>
   <script src="../resources/js/mixitup.min.js"></script>
   <script src="../resources/js/owl.carousel.min.js"></script>
   <script src="../resources/js/main.js"></script>
	
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    	<script>
    		$(document).ready(function() {
    			$('#event_reply_content').click(function() {
    				if('${q}' >= 0) {
    					if ('${signInUserNickname}' == null || '${signInUserNickname}' == '') {
    						var message = '로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?';
    						var result = confirm(message);
    						if (result == true) {
    						location.href = '/pjt/event/signin?event_no=' + ${event.event_no} + '&q=' + ${q};
    						}
    					}
    				}
    			
    			});
    					
    			if ('${q}' < 0) {
    				$('#btn_register_event_reply').attr('disabled', true);
    			}
    			
            	
    			var event_no = '${event.event_no}';
            	// 해당 이벤트 게시글에 대한 모든 댓글 목록을 읽어오는 Ajax 함수 정의(선언)
            	function getAllEventReplies() {
            		// $.getJSON(요청URL, 콜백 함수): URL로 Ajax GET 요청을 보내고 
            		// JSON 문자열을 응답으로 전달받아서 처리하는 함수.
                    $.getJSON('/pjt/event_replies/all/' + event_no, function (respText) {
                        // respText: REST Controller가 보내준 JSON 형식의 문자열 - 댓글들의 배열(array)
                        
                   		var n = respText.length; 
                    	if (n > 0) {
                    		$('#reply_number').html(n + '개의 댓글이 있습니다.');
                    		
                    		var lastpage = parseInt((n + 9) / 10);
                    	    
                        	var numberlist = '';
                            for (var i = 1; i <= lastpage; i++) {
                            	numberlist += '<a href="./detail?event_no=' + ${event.event_no} + '&q=' + ${q} + '&vpage=' + i + '">' + i + '</a> ';
                            }
                             $('#page_number').html(numberlist);
                    	}
                    	
                   
                    });
                    
                     $.getJSON('/pjt/event_replies/all/' + event_no + '/' + ${viewpage}, function (respText) {
                    	 $('#event_reply_list').empty(); // 모든 하위 요소들을 삭제
                         
                         var event_list = ''; // 하위 요소(HTML 코드)를 작성할 문자열.
                         
                         // 배열 respText의 원소들을 하나씩 꺼내서 콜백 함수를 호출.
                         $(respText).each(function () {
                         	var date = new Date(this.event_reply_update_time); // JavaScript Date 객체 생성
                         	var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
                         	
                             	event_list += '<div class="event_reply_item">'
                                                 + '<input type="hidden" id="event_reply_no" name="event_reply_no" value="'
                         		   				+ this.event_reply_no
                         		  				+ '" readonly />';
                             if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면	  				
                             	 event_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="event_reply_content" name="event_reply_content" value="'
       		  									+ this.event_reply_content
      		   		   			    			+'" readonly />';
                             } else {
                             	event_list += '<input type="text" id="event_reply_content" name="event_reply_content" value="'
 	  									+ this.event_reply_content
 	   		   			    			+'" readonly />';
                             }
                             if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
                                  event_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="user_nickname" name="user_nickname" value="'
                         		            	+ this.user_nickname
                         		            	+ '" readonly />';
                             } else {
                             	event_list += '<input type="text" id="user_nickname" name="user_nickname" value="'
             		            				+ this.user_nickname.substring(0,1) + '*' + this.user_nickname.substring(2, this.user_nickname.length)
             		            				+ '" readonly />';
                             }
                             if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
                             	event_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="event_reply_update_time" name="event_reply_update_time" value="'
                         		           		+ dateStr
                         		            	+ '" readonly />';
                             } else {
                             	event_list += '<input type="text" id="event_reply_update_time" name="event_reply_update_time" value="'
         		           						+ dateStr
         		            					+ '" readonly />';
                             }
                         	if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
                         		event_list += '<button class="event_reply_update">수정</button>'
                         			          + '<button class="event_reply_delete">x</button>';
                         	}
                         	event_list += '</div>';
                         	    
                         });
                         
                         // 완성된 HTML 문자열(list)를 하위 요소로 추가
                         $('#event_reply_list').html(event_list);
                         
                     }); // end getJSON()
            	}	
             	
            	getAllEventReplies(); // 함수 호출
            	
      
            	
    			// 새 이벤트 댓글 등록
    			$('#btn_register_event_reply').click(function(event) {
    				
    				var event_reply_content = $('#event_reply_content').val();
    				if (event_reply_content == '') {
    					alert('내용을 입력해주세요.');
    					$('#event_reply_content').focus();
    					return;
    				}
    				
            		// 댓글 insert 요청을 Ajax 방식으로 보냄.
            		$.ajax({
            			// 요청 주소
            			url: '/pjt/event_replies',
            			// 요청 타입
            			type: 'POST',
            			// 요청 HTTP 헤더
            			headers: {
            				'Content-Type': 'application/json',
            				'X-HTTP-Method-Override': 'POST'
            			},
            			// 요청에 포함되는 데이터(JSON 문자열)
            			data: JSON.stringify({
            				'event_no': '${event.event_no}',
            				'event_reply_content': event_reply_content,
            				'user_nickname': '${signInUserNickname}'
            			}),
            			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
            			success: function (resp) {
            				if (resp == 0) {
            					alert('이미 이벤트에 참여하셨습니다.');
            				}
            				
            				$('#event_reply_content').val('');
            				
            				getAllEventReplies();  // 댓글 목록 업데이트
            			}
            		});
    			});
            	
            	
            	
            	
    			$('#event_reply_list').on('click', '.event_reply_item .event_reply_update', function () {
    				
    				$(this).prevAll('#event_reply_content').attr('readonly', false);
    				$(this).prevAll('#event_reply_content').focus();
    				
    				$(this).prevAll('#event_reply_content').on("change", function(){
    					$('#event_reply_list').on('click', '.event_reply_item .event_reply_update', function () {
  								var event_reply_no = $(this).prevAll('#event_reply_no').val();
                				var event_reply_content = $(this).prevAll('#event_reply_content').val();
                		
                				$.ajax({
                						// 요청 URL
                						url: '/pjt/event_replies/' + event_reply_no,
                						// 요청 방식
                						type: 'PUT',
                						// 요청 패킷 헤더
                						headers: {
                							'Content-Type': 'application/json',
                							'X-HTTP-Method-Override': 'PUT'
                						},
                						// 요청 패킷 데이터
                						data: JSON.stringify({'event_reply_content': event_reply_content}),
                						// 성공 응답 콜백 함수
                						success: function () {
                						alert(' 댓글 수정 성공!');
                						getAllEventReplies(); // 댓글 목록 업데이트
                			}
                		});
    				  });
    				});
    			});
                    
                    
    			// 댓글 삭제
            	$('#event_reply_list').on('click', '.event_reply_item .event_reply_delete', function (event) {
            		var event_reply_no = $(this).prevAll('#event_reply_no').val();
            		var result = confirm('댓글을 정말 삭제할까요?');
            		if (result) { // 확인(Yes) 버튼을 클릭했을 때
            			$.ajax({
            				// 요청 URL
            				url: '/pjt/event_replies/' + event_reply_no,
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
            					getAllEventReplies();
            				}
            			});
            		}
            	});
    			
    			
    			$('#delete_event').click(function(event) {
    				event.preventDefault();
    				var answer = confirm('정말 삭제할까요?');
    				if (answer) {
    					location.href = '/pjt/event/delete?event_no=${event.event_no}';
    				}
    			});
    			
    			
    		});
    	</script>
    </body>
</html>