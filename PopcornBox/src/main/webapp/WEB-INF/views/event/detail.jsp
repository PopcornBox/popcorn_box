<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
/* 	#event_reply_content {
       		width: 600px;
       	} */
.event_reply_list {
	dispaly: table;
	padding: 10px; border 1px solid #e1e1e1;
	border-collapse: collapse;
}

.event_reply_item {
	padding-top: 30px; 
	padding-bottom: 30px; 
	dispaly : table-cell;
	border-bottom: 1px solid #e1e1e1;
	dispaly: table-cell;
}
</style>


<script src="https://kit.fontawesome.com/a39158855c.js"
	crossorigin="anonymous"></script>

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
					<%-- ????????? ?????? ?????? ?????? ?????? --%>
					<li><a href="../user/signin">?????????</a></li>
		            <li><a href="../user/register">????????????</a></li>
		            <li><a href="../user/mypage">???????????????</a></li>
				</c:if>
				<c:if test="${not empty signInUserNickname}">
					<%-- ????????? ?????? ?????? ?????? --%>
					<c:if test="${empty accessToken}">
						<%-- ?????? ???????????? ?????? --%>  
						<li><span>${signInUserNickname} ???</span></li>
						<li><a href="../user/signout">????????????</a></li>
			            <li><a href="../user/mypage">???????????????</a></li>
		             </c:if>	 
		             <c:if test="${not empty accessToken}">
		                <%-- ????????? ???????????? ?????? --%>  
			            <li><span>${signInUserNickname} ???</span></li>
			            <li><a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">????????????</a></li>
			            <li><a href="../user/mypage">???????????????</a></li>
					 </c:if>	 
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


			</div>

			
			
			<!-- The Modal -->
<div class="modal" id="winnerModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header text-center">
        <h4 class="modal-title w-100">????????? ??????</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body text-center">
      ${event.event_title}
      	<div>
        	<input type="number" min="0" id="winner_number"  name="winner_number"  />
      	</div>
      	<div id="result"></div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="btn_choice" class="btn btn-danger">??????</button>
      </div>

    </div>
  </div>
</div>
			


	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7">
						<div class="header__top__left">
							<a href="../"><img src="../resources/img/popcornbox_logo.png"
								alt="logo"></a>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<c:if test="${empty signInUserNickname}">
											<%-- ????????? ?????? ?????? ?????? ?????? --%>
											<a href="../user/signin"><i class="fa-solid fa-lock"></i>?????????</a>
		                                    <a href="../user/register"><i class="fa-solid fa-user-plus"></i>????????????</a>
		                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>???????????????</a>
										</c:if>
										<c:if test="${not empty signInUserNickname}">
											<%-- ????????? ?????? ?????? ?????? --%>
											<c:if test="${empty accessToken}">
												<%-- ?????? ???????????? ?????? --%>  
												<span>${signInUserNickname} ???</span><br>
												<a href="../user/signout"><i class="fa-solid fa-lock"></i>????????????</a>
			                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>???????????????</a>
		                                    </c:if>	 
		                                    <c:if test="${not empty accessToken}">
		                                    	<%-- ????????? ???????????? ?????? --%>  
			                                    <span>${signInUserNickname} ???</span><br>
			                                    <a href="https://kauth.kakao.com/oauth/logout?client_id=cc1754dab9a17adb7dd44164ff108ba7&logout_redirect_uri=http://localhost:8181/pjt/user/kakaologout">
			                                    	<i class="fa-solid fa-lock"></i>????????????</a>
			                                    <a href="../user/mypage"><i class="fa-solid fa-user"></i>???????????????</a>
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
							<li><a href="../">???</a></li>
							<li><a href="../movie/mainlist">??????</a></li>
							<li><a href="../board/main">????????????</a></li>
							<li class="active"><a href="../event/main">?????????</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- container start -->
	<div class="container">
		<div style="text-align: center">
			<div>
				<div>
					<c:if test="${signInUserPosition eq 'A'}">
						<a href="./update?event_no=${event.event_no}"><button class="btn btn-dark">??????</button></a>
						<a id="delete_event" href="./delete?event_no=${event.event_no}"><button class="btn btn-dark">??????</button></a>
						<button type="button" class="btn btn-dark" data-toggle="modal"
							data-target="#winnerModal">????????? ??????</button>
					</c:if>
					<c:if test="${signInUserPosition eq 'B'}">
						<a href="./update?event_no=${event.event_no}"><button class="btn btn-dark">??????</button></a>
						<a id="delete_event" href="./delete?event_no=${event.event_no}"><button class="btn btn-dark">??????</button></a>
						<button type="button" class="btn btn-dark" data-toggle="modal"
							data-target="#winnerModal">????????? ??????</button>
					</c:if>
				</div>




				<table class="table"
					style="border-bottom: 1px solid #e1e1e1; margin-bottom: 50px;">
					<tbody>
						<tr>
							<td style="text-align: left;">${event.event_no}</td>
							<td style="text-align: left;">${event.event_title}</td>
							<td style="text-align: right">??????: <fmt:formatDate
									value="${event.event_start_time}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate
									value="${event.event_last_time}" pattern="yyyy.MM.dd" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<div class="event_img_detail" style="text-align: center;">
			<img style="width: 70%" alt="${event.event_title}"
				src="${event.event_content}">
		</div>
	</div>


	<!-- ?????? ?????? ?????? -->
	<div class="container">
		<div id="reply_number"
			style="text-align: center; text: bold; font-size: 20px; text-align: center; font-weight: 700; margin-block: 40px;"></div>
		<div
			style="text: bold; font-size: 16px; text-align: inherit; font-weight: 700; border-top: 1px solid #e1e1e1; padding-top: 40px; margin-bottom: 20px;">
			?????? ????????????</div>
		<div class="event__input" style="display: flex;">
			<input type="text" id="event_reply_content_empty"
				name="event_reply_content_empty"
				placeholder="??????????????? ???????????? ???????????? ???????????? ?????? ?????? ????????? ?????? ??? ????????????." />
			<button type="submit" class="event-btn" id="btn_register_event_reply"
				value="??????">??????</button>
		</div>
	</div>
	<!-- ?????? ?????? ???-->

	<!-- ?????? ?????? -->
	<div class="container">
		<div class="event_reply_list contact__form">

			<div id="event_reply_list"></div>
		</div>
	</div>

	<!-- ????????? ?????? -->
	<div class="container">
		<div id="page_number"
			style="width: 100%; text-align: center; margin-top: 10px;"></div>
	</div>



	<!-- container end -->

	<!--  footer include-->
	<%@ include file="../footer.jsp"%>

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

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    		$(document).ready(function() {
    			$('#event_reply_content_empty').click(function() {
    				if('${q}' >= 0) {
    					if ('${signInUserNickname}' == null || '${signInUserNickname}' == '') {
    						var message = '???????????? ????????? ??????????????????. ????????? ???????????? ?????????????????????????';
    						var result = confirm(message);
    						if (result == true) {
    						location.href = '/pjt/event/signin?event_no=' + ${event.event_no} + '&q=' + ${q};
    						}
    					}
    				}
    			
    			});
    					
    			if ('${q}' < 0) {
    				$('#event_reply_content_empty').attr('disabled', true);
    				$('#btn_register_event_reply').click(function() {
    					alert('????????? ??????????????????.');
    				});
    			}
    			
            	
    			var event_no = '${event.event_no}';
            	// ?????? ????????? ???????????? ?????? ?????? ?????? ????????? ???????????? Ajax ?????? ??????(??????)
            	function getAllEventReplies() {
            		// $.getJSON(??????URL, ?????? ??????): URL??? Ajax GET ????????? ????????? 
            		// JSON ???????????? ???????????? ??????????????? ???????????? ??????.
                    $.getJSON('/pjt/event_replies/all/' + event_no, function (respText) {
                        // respText: REST Controller??? ????????? JSON ????????? ????????? - ???????????? ??????(array)
                        
                   		var n = respText.length; 
                    	if (n > 0) {
                    		$('#reply_number').html(n + '?????? ????????? ????????????.');
                    		
                    		var lastpage = parseInt((n + 9) / 10);
                    	    
                        	var numberlist = '';
                            for (var i = 1; i <= lastpage; i++) {
                            	numberlist += '<a href="./detail?event_no=' + ${event.event_no} + '&q=' + ${q} + '&vpage=' + i + '">' + i + '</a> ';
                            }
                             $('#page_number').html(numberlist);
                    	} else {
    	            		$('#reply_number').html(' ');
   	            		$('#page_number').html(' ');
   	            		return;
                        }
                    	
                   
                    });
                    
                     $.getJSON('/pjt/event_replies/all/' + event_no + '/' + ${viewpage}, function (respText) {
                    	 $('#event_reply_list').empty(); // ?????? ?????? ???????????? ??????
                         
                         var event_list = ''; // ?????? ??????(HTML ??????)??? ????????? ?????????.
                         
                         // ?????? respText??? ???????????? ????????? ????????? ?????? ????????? ??????.
                         $(respText).each(function () {
                         	var date = new Date(this.event_reply_update_time); // JavaScript Date ?????? ??????
                         	var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
                         	
                         	
		                         	if (this.user_nickname == '${signInUserNickname}'){
		     		  					event_list += '<div class="event_reply_item">'
                                                	+ '<div class="my_reply">';
		     		  				}else {
		     		  					event_list += '<div class="event_reply_item">'
                                            		+ '<div class="not_my_reply">';
		     		  				}
                         	
                             	 // ?????? ??????
                             	event_list += '<input type="hidden" id="event_reply_no" name="event_reply_no" value="'
		             		   				+ this.event_reply_no
		             		  				+ '" readonly />'
                             // ?????? ????????? ?????????
	                             				+'<div style="display:flex;"><input type="text" id="user_nickname" name="user_nickname" value="'
		               	     					+ this.user_nickname
		               	     		            + ' ???" readonly /><div style="width: 80%;"></div>'
		            	                 		
		            	               	  		 // ?????? ????????????
		            		                    +'<input type="text" id="event_reply_update_time" name="event_reply_update_time" value="'
		            		 		           	+ dateStr
		            		 		            + '" readonly /></div>';
                           
                         	// ?????? ??????
                         	 event_list += '<textarea type="text" readonly id="event_reply_content" name="event_reply_content">'
	  									+ this.event_reply_content
	   		   			    			+'</textarea>';
                         	
                         	 // ?????? ??????, ?????? ??????
                          	if (this.user_nickname == '${signInUserNickname}') { // ?????? ????????? ???????????? ???????????? ????????? ???????????? ?????????
                          		event_list += '<button class="event_reply_delete reply_btn">??????</button>'
                          					+'<button class="event_reply_update reply_btn">??????</button>';
                          	}
                         	
                         	
                         	
                         	event_list += '</div></div>';
                         	    
                         });
                         
                         // ????????? HTML ?????????(list)??? ?????? ????????? ??????
                         $('#event_reply_list').html(event_list);
                         
                     }); // end getJSON()
            	}	
             	
            	getAllEventReplies(); // ?????? ??????
            	
      
            	
    			// ??? ????????? ?????? ??????
    			$('#btn_register_event_reply').click(function(event) {
    				
    				var event_reply_content = $('#event_reply_content_empty').val();
    				if (event_reply_content == '') {
    					if ('${q}' >= 0) {
    						alert('????????? ??????????????????.');
    						$('#event_reply_content_empty').focus();
    						return;
					     }	
    				}
    				
            		// ?????? insert ????????? Ajax ???????????? ??????.
            		$.ajax({
            			// ?????? ??????
            			url: '/pjt/event_replies',
            			// ?????? ??????
            			type: 'POST',
            			// ?????? HTTP ??????
            			headers: {
            				'Content-Type': 'application/json',
            				'X-HTTP-Method-Override': 'POST'
            			},
            			// ????????? ???????????? ?????????(JSON ?????????)
            			data: JSON.stringify({
            				'event_no': '${event.event_no}',
            				'event_reply_content': event_reply_content,
            				'user_nickname': '${signInUserNickname}'
            			}),
            			// ?????? ??????(200 response)??? ?????? ??? ??????????????? ????????? ?????? ??????
            			success: function (resp) {
            				if (resp == 0) {
            					alert('?????? ???????????? ?????????????????????.');
            				}
            				
            				$('#event_reply_content_empty').val('');
            				
            				getAllEventReplies();  // ?????? ?????? ????????????
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
                						// ?????? URL
                						url: '/pjt/event_replies/' + event_reply_no,
                						// ?????? ??????
                						type: 'PUT',
                						// ?????? ?????? ??????
                						headers: {
                							'Content-Type': 'application/json',
                							'X-HTTP-Method-Override': 'PUT'
                						},
                						// ?????? ?????? ?????????
                						data: JSON.stringify({'event_reply_content': event_reply_content}),
                						// ?????? ?????? ?????? ??????
                						success: function () {
                						alert(' ?????? ?????? ??????!');
                						getAllEventReplies(); // ?????? ?????? ????????????
                			}
                		});
    				  });
    				});
    			});
                    
                    
    			// ?????? ??????
            	$('#event_reply_list').on('click', '.event_reply_item .event_reply_delete', function (event) {
            		var event_reply_no = $(this).prevAll('#event_reply_no').val();
            		var result = confirm('????????? ?????? ????????????????');
            		if (result) { // ??????(Yes) ????????? ???????????? ???
            			$.ajax({
            				// ?????? URL
            				url: '/pjt/event_replies/' + event_reply_no,
            				// ?????? ??????
            				type: 'DELETE',
            				// ?????? ??????
            				headers: {
            					'Content-Type': 'application/json',
            					'X-HTTP-Method-Override': 'DELETE'
            				},
            				// ?????? ?????? ?????? ??????
            				success: function () {
            					alert('?????? ?????? ??????!');
            					getAllEventReplies();
            				}
            			});
            		}
            	});
    			
    			
    			$('#delete_event').click(function(event) {
    				event.preventDefault();
    				var answer = confirm('?????? ????????????????');
    				if (answer) {
    					location.href = '/pjt/event/delete?event_no=${event.event_no}';
    				}
    			});
		
			
		if ('${q}' > 0) {
    				$('#do_choose').attr('disabled', true);
    			}
    			
    			
    			
    			
    			$('#btn_choice').click(function () {
    				var winner_number = $('#winner_number').val();
    				get_winner(winner_number);
    			});
    			
    			
    			function get_winner(winner_number) {
    				var event_no = '${event.event_no}';
    				var list = '';
    				$.getJSON('/pjt/event_replies/choose/' + winner_number + '/' + event_no, function (data) {
    					data.forEach(function(element) {
    						 var winner_nickname = element;
    						 list += winner_nickname + ', '				
    					 }); // for ??????
    					 $('#result').html(list);
    				});
    			}
		
		
    			
    			
    		});
    	</script>
</body>
</html>
