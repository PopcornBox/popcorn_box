<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie_info</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


    <script src="https://kit.fontawesome.com/a39158855c.js" crossorigin="anonymous"></script>
<style>
   .img-center {
    display: block;
    margin-left: auto;
    margin-right: auto;
    }

   .star-rating {
       display:flex;
       flex-direction: row-reverse;
       font-size:1.5em;
       justify-content:space-around;
       padding:0em .2em;
       text-align:center;
       width:15em;
    }

   .star-rating input {
       display:none;
    }

    .star-rating :not(:checked) ~ label {
       color:#ccc;
       cursor:pointer;
    }

    .star-rating :checked ~ label {
        color:#f90; 
    }

   .star-rating label:hover,
   .star-rating label:hover ~ label {
  		color:#fc0; 
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
                            <li class="active"><a href="../movie/mainlist">차트</a></li>
                            <li><a href="../board/main">커뮤니티</a></li>
                            <li><a href="../event/main">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

  <!-- Breadcrumb Section Begin -->
  	<hr>
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4 style="margin-left: 20px;">영화 상세정보</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <hr>
    <!-- Breadcrumb Section End -->
		
		<section class="contact spad">
        <div class="container">
            <div class="row">
              <div class="row product__filter">
                  <div class="">
                      <div class="product__item">
                          <div class="product__item__pic set-bg" data-setbg="${movie.movie_image}">
                          </div>
                          <div class="product__item__text">
                          </div>
                      </div>
                  </div>
                  <div class="">

                    <div class="contact__text">
                        <div class="section-title">

                            <h2>${movie.movie_title}</h2>
                            <p>감독: ${movie.movie_director} <br/> 배우: ${movie.movie_actor} <br/> 장르: ${movie.movie_genre} <br/> 개봉: ${movie.movie_release}
                            </p>
                        </div>

                    </div>
                </div>
		
		<div class="container">
  					<!-- Button to Open the Modal -->
  					<div>average score</div>
  					<div id="average_score"> </div>
  					
  					<div>your rating</div>
  					<button type="button" id="btn_modal" class="btn btn-primary" data-target="#myModal">
    					(별)Rate
  					</button>
  					<button type="button" id="btn_your_score" class="btn btn-primary" data-target="#updateModal">	
  					</button>	
  					
  					<div>
  						<i class="fa-regular fa-heart" id="btn_unlike"></i>
  						<i class="fa-solid fa-heart" id="btn_like"></i>
  					</div>				

 					<!-- My Modal -->
  					<div class="modal" id="myModal">
    					<div class="modal-dialog">
      						<div class="modal-content">
      
        						<!-- Modal Header -->
        						<div class="modal-header text-center">
          							<h4 class="modal-title w-100">Rate this</h4>
          							<button type="button" class="close" data-dismiss="modal">&times;</button>
        						</div>
        
       							<!-- Modal body -->
        						<div class="modal-body text-center">
          							${movie.movie_title}
          							<div class="star-rating img-center">
          								<input type="radio" id="10-stars" name="rating" value="10.0" />
 										<label for="10-stars" class="star">&#9733;</label>
          								<input type="radio" id="9-stars" name="rating" value="9.0" />
 										<label for="9-stars" class="star">&#9733;</label>
          								<input type="radio" id="8-stars" name="rating" value="8.0" />
 										<label for="8-stars" class="star">&#9733;</label>
          								<input type="radio" id="7-stars" name="rating" value="7.0" />
 										<label for="7-stars" class="star">&#9733;</label>
          								<input type="radio" id="6-stars" name="rating" value="6.0" />
 										<label for="6-stars" class="star">&#9733;</label>
  										<input type="radio" id="5-stars" name="rating" value="5.0" />
 										<label for="5-stars" class="star">&#9733;</label>
  										<input type="radio" id="4-stars" name="rating" value="4.0" />
  										<label for="4-stars" class="star">&#9733;</label>
  										<input type="radio" id="3-stars" name="rating" value="3.0" />
  										<label for="3-stars" class="star">&#9733;</label>
  										<input type="radio" id="2-stars" name="rating" value="2.0" />
  										<label for="2-stars" class="star">&#9733;</label>
  										<input type="radio" id="1-star" name="rating" value="1.0" />
  										<label for="1-star" class="star">&#9733;</label>
   									</div>	
        						</div>
        
       						 	<!-- Modal footer -->
       							<div class="modal-footer">
            						<button type="button" id="btn_rate" class="btn btn-danger" data-dismiss="modal">rate</button>
        						</div>
        
      						</div>
   						 </div>
  					</div>
				</div> <!-- end of Modal -->
               
               
               
               <!-- Update Modal -->
  					<div class="modal" id="updateModal">
    					<div class="modal-dialog">
      						<div class="modal-content">
      
        						<!-- Modal Header -->
        						<div class="modal-header text-center">
          							<h4 class="modal-title w-100">Update your rating</h4>
          							<button type="button" class="close" data-dismiss="modal">&times;</button>
        						</div>
        
       							<!-- Modal body -->
        						<div class="modal-body text-center">
          							${movie.movie_title}
          							<div class="star-rating img-center">
          								<input type="radio" id="10-star" name="ratings" value="10.0" />
 										<label for="10-star" class="star">&#9733;</label>
          								<input type="radio" id="9-star" name="ratings" value="9.0" />
 										<label for="9-star" class="star">&#9733;</label>
          								<input type="radio" id="8-star" name="ratings" value="8.0" />
 										<label for="8-star" class="star">&#9733;</label>
          								<input type="radio" id="7-star" name="ratings" value="7.0" />
 										<label for="7-star" class="star">&#9733;</label>
          								<input type="radio" id="6-star" name="ratings" value="6.0" />
 										<label for="6-star" class="star">&#9733;</label>
  										<input type="radio" id="5-star" name="ratings" value="5.0" />
 										<label for="5-star" class="star">&#9733;</label>
  										<input type="radio" id="4-star" name="ratings" value="4.0" />
  										<label for="4-star" class="star">&#9733;</label>
  										<input type="radio" id="3-star" name="ratings" value="3.0" />
  										<label for="3-star" class="star">&#9733;</label>
  										<input type="radio" id="2-star" name="ratings" value="2.0" />
  										<label for="2-star" class="star">&#9733;</label>
  										<input type="radio" id="1-star1" name="ratings" value="1.0" />
  										<label for="1-star1" class="star">&#9733;</label>
   									</div>	
        						</div>
        
       						 	<!-- Modal footer -->
       							<div class="modal-footer">
            						<button type="button" id="btn_rate_delete" class="btn btn-danger" data-dismiss="modal">delete</button>
            						<button type="button" id="btn_rate_update" class="btn btn-danger" data-dismiss="modal">update</button>
        						</div>
        
      						</div>
   						 </div>
  					</div>
				</div> <!-- end of Modal -->
                 
		      
		      
                <div class="col-lg-12 col-md-14">
                  <br><br>
                    <div class="contact__form" id="movie_content" name="movie_content" style="margin: 0px;">
                      <p>${movie.movie_content}</p>
                      <br>
                      <br>
                      
                      <div class="trailer">
                          <p>:: MOVIE TRAILER ::</p>
                          <p>${movie.movie_trailer}</p>
                      </div>
                        <!-- 댓글기능 -->
                    </div>
                </div>                                
            </div>
            
				<br>
				<hr>
                <!-- 댓글 작성 양식 -->
				<div>
					<div id="reply_number"></div>
					<input type="text" id="movie_reply_content_empty" name="movie_reply_content_empty" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." style="width:600px;" />
					<input type="submit" id="btn_register_movie_reply" value="등록" />
					<hr>
					
					<!-- 댓글 목록 -->
					<div id="movie_reply_list">		
					</div>
							
					<!-- 페이지 넘버 -->
					<div id="page_number" style="width:600px; text-align:center; margin-top:10px;">
	                </div>        
				</div>				        

        </div>
        </div>

	</section>

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
	<script>
		$(document).ready(function () {
			$('#movie_reply_content_empty').click(function() {
					if ('${signInUserNickname}' == null || '${signInUserNickname}' == '') {
						var message = '로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?';
						var result = confirm(message);
						if (result == true) {
						location.href = '/pjt/movie/signin?movie_no=' + ${movie.movie_no};
						}
					}
			});
	    	
			var movie_no = '${movie.movie_no}';
	    	// 해당 이벤트 게시글에 대한 모든 댓글 목록을 읽어오는 Ajax 함수 정의(선언)
	    	function getAllMovieReplies() {
	    		// $.getJSON(요청URL, 콜백 함수): URL로 Ajax GET 요청을 보내고 
	    		// JSON 문자열을 응답으로 전달받아서 처리하는 함수.
	            $.getJSON('/pjt/movie_replies/all/' + movie_no, function (respText) {
	                // respText: REST Controller가 보내준 JSON 형식의 문자열 - 댓글들의 배열(array)
	                
	           		var n = respText.length; 
	            	if (n > 0) {
	            		$('#reply_number').html(n + '개의 리뷰');
	            		
	            		var lastpage = parseInt((n + 9) / 10);
	            	    
	                	var numberlist = '';
	                    for (var i = 1; i <= lastpage; i++) {
	                    	numberlist += '<a href="./detail?movie_no=' + ${movie.movie_no} + '&vpage=' + i + '">' + i + '</a> ';
	                    }
	                     $('#page_number').html(numberlist);
	            	} else {
	            		$('#reply_number').html(' ');
	            		 $('#page_number').html(' ');
	            		return;
	            	}
	            	
	           
	            });
	            
	             $.getJSON('/pjt/movie_replies/all/' + movie_no + '/' + ${viewpage}, function (respText) {
	            	 $('#movie_reply_list').empty(); // 모든 하위 요소들을 삭제
	                 
	                 var movie_list = ''; // 하위 요소(HTML 코드)를 작성할 문자열.
	                 
	                 // 배열 respText의 원소들을 하나씩 꺼내서 콜백 함수를 호출.
	                 $(respText).each(function () {
	                 	var date = new Date(this.movie_reply_update_time); // JavaScript Date 객체 생성
	                 	var dateStr = date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
	                 	
	                     	movie_list += '<div class="movie_reply_item">'
	                                         + '<input type="hidden" id="movie_reply_no" name="movie_reply_no" value="'
	                 		   				+ this.movie_reply_no
	                 		  				+ '" readonly />';
	                     if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면	  				
	                    	 movie_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="movie_reply_content" name="movie_reply_content" value="'
			  									+ this.movie_reply_content
			   		   			    			+'" readonly />';
	                     } else {
	                    	 movie_list += '<input type="text" id="movie_reply_content" name="movie_reply_content" value="'
										+ this.movie_reply_content
			   			    			+'" readonly />';
	                     }
	                     if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
	                    	 movie_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="user_nickname" name="user_nickname" value="'
	                 		            	+ this.user_nickname
	                 		            	+ '" readonly />';
	                     } else {
	                    	 movie_list += '<input type="text" id="user_nickname" name="user_nickname" value="'
	     		            				+ this.user_nickname.substring(0,1) + '*' + this.user_nickname.substring(2, this.user_nickname.length)
	     		            				+ '" readonly />';
	                     }
	                     if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
	                    	 movie_list += '<input type="text" style="background-color:rgb(240, 248, 255);" id="movie_reply_update_time" name="movie_reply_update_time" value="'
	                 		           		+ dateStr
	                 		            	+ '" readonly />';
	                     } else {
	                    	 movie_list += '<input type="text" id="movie_reply_update_time" name="movie_reply_update_time" value="'
	 		           						+ dateStr
	 		            					+ '" readonly />';
	                     }
	                 	if (this.user_nickname == '${signInUserNickname}') { // 댓글 작성자 닉네임과 로그인한 사용자 닉네임이 같으면
	                 		movie_list += '<button class="movie_reply_update">수정</button>'
	                 			          + '<button class="movie_reply_delete">x</button>';
	                 	}
	                 	movie_list += '</div>';
	                 	    
	                 });
	                 
	                 // 완성된 HTML 문자열(list)를 하위 요소로 추가
	                 $('#movie_reply_list').html(movie_list);
	                 
	             }); // end getJSON()
	    	} // end getAllMovieReplies()	
	     	
	    	getAllMovieReplies(); // 함수 호출	
            	
    			// 새 영화 리뷰 등록
    			$('#btn_register_movie_reply').click(function (event) {
    				
    				var movie_reply_content = $('#movie_reply_content_empty').val();
    				if (movie_reply_content == '') {
    					alert('내용을 입력해주세요.');
    					$('#movie_reply_content_empty').focus();
    					return;
    				}
    				
            		// 댓글 insert 요청을 Ajax 방식으로 보냄.
            		$.ajax({
            			// 요청 주소
            			url: '/pjt/movie_replies',
            			// 요청 타입
            			type: 'POST',
            			// 요청 HTTP 헤더
            			headers: {
            				'Content-Type': 'application/json',
            				'X-HTTP-Method-Override': 'POST'
            			},
            			// 요청에 포함되는 데이터(JSON 문자열)
            			data: JSON.stringify({
            				'movie_no': '${movie.movie_no}',
            				'movie_reply_content': movie_reply_content,
            				'user_nickname': '${signInUserNickname}'
            			}),
            			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
            			success: function (resp) {
            				$('#movie_reply_content_empty').val('');
            				getAllMovieReplies();  // 댓글 목록 업데이트
            			}
            		});
    			});
            	

    			$('#movie_reply_list').on('click', '.movie_reply_item .movie_reply_update', function () {
    				
    				$(this).prevAll('#movie_reply_content').attr('readonly', false);
    				$(this).prevAll('#movie_reply_content').focus();
    				
    				$(this).prevAll('#movie_reply_content').on("change", function(){
    					$('#movie_reply_list').on('click', '.movie_reply_item .movie_reply_update', function () {
  								var movie_reply_no = $(this).prevAll('#movie_reply_no').val();
                				var movie_reply_content = $(this).prevAll('#movie_reply_content').val();
                		
                				$.ajax({
                						// 요청 URL
                						url: '/pjt/movie_replies/' + movie_reply_no,
                						// 요청 방식
                						type: 'PUT',
                						// 요청 패킷 헤더
                						headers: {
                							'Content-Type': 'application/json',
                							'X-HTTP-Method-Override': 'PUT'
                						},
                						// 요청 패킷 데이터
                						data: JSON.stringify({'movie_reply_content': movie_reply_content}),
                						// 성공 응답 콜백 함수
                						success: function () {
                						alert(' 리뷰 수정 성공!');
                						getAllMovieReplies(); // 리뷰 목록 업데이트
                						//location.href = '/pjt/movie/detail?movie_no=' + ${movie.movie_no};
                			}
                		});
    				  });
    				});
    			});
                    
                    
    			// 댓글 삭제
            	$('#movie_reply_list').on('click', '.movie_reply_item .movie_reply_delete', function (event) {
            		var movie_reply_no = $(this).prevAll('#movie_reply_no').val();
            		var result = confirm('리뷰를 정말 삭제할까요?');
            		if (result) { // 확인(Yes) 버튼을 클릭했을 때
            			$.ajax({
            				// 요청 URL
            				url: '/pjt/movie_replies/' + movie_reply_no,
            				// 요청 타입
            				type: 'DELETE',
            				// 요청 헤더
            				headers: {
            					'Content-Type': 'application/json',
            					'X-HTTP-Method-Override': 'DELETE'
            				},
            				// 성공 응답 콜백 함수
            				success: function () {
            					alert('리뷰 삭제 성공!');
            					getAllMovieReplies();
            				}
            			});
            		}
            	});
    			
    			
    			$('#delete_movie').click(function (event) {
    				event.preventDefault();
    				var answer = confirm('정말 삭제할까요?');
    				if (answer) {
    					location.href = '/pjt/movie/delete?movie_no=${movie.movie_no}';
    				}
    			});
//    -------------------------------------------------------------------------------------------------------	
    	
		
		// 평점 재계산.
		average_score();
		
		
		$('#btn_your_score').hide();
		
		if ('${signInUserNickname}' == null || '${signInUserNickname}' == '') {
			$('#btn_modal').click(function() {
				location.href = '/pjt/movie/rating/signin?movie_no=' + ${movie.movie_no};
			});
		} else {
			checkRatingRecord(); // 별점 등록 이력 확인.
		}
		
		
		
		
		$('#btn_rate').click(function() {
			var star = document.getElementsByName('rating');
			for (var i = 0; i < star.length; i++) {
				if (star[i].checked) {
					var a = star[i].value;
					var databack = a.trim();
				}
			}
				insert_score(databack);
	    });
		
		
		
		
		function insert_score(score) {
			
        		$.ajax({
        			// 요청 주소
        			url: '/pjt/movie_rating/insert',
        			// 요청 타입
        			type: 'POST',
        			// 요청 HTTP 헤더
        			headers: {
        				'Content-Type': 'application/json',
        				'X-HTTP-Method-Override': 'POST'
        			},
        			// 요청에 포함되는 데이터(JSON 문자열)
        			data: JSON.stringify({
        				'movie_no': '${movie.movie_no}',
        				'user_nickname': '${signInUserNickname}',
        				'movie_score': score
        			}),
        			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
        			success: function (resp) {
        				checkRatingRecord();
        				
        				// 평점 재계산.
    					average_score();
        				
    					alert('별점이 등록되었습니다.');
        			}
        		});
			}
		
		
		
		
		
    	function checkRatingRecord() {
    		
            $.getJSON('/pjt/movie_rating/check/' + '${movie.movie_no}' + '/' + '${signInUserNickname}', function (data) {
            	
            	var result = (data).toFixed(1);
            	if (result == 0.0) { // 별점 등록 이력이 없으면
            		$('#btn_your_score').hide();
            		$('#btn_modal').show();
            		$('#btn_modal').click(function() {
						$('#myModal').modal('show');
					});
				} else { // 있으면
					$('#btn_modal').hide();
					$('#btn_your_score').html(result);
					$('#btn_your_score').show();
				}
            	
            });
    	}
		
    	
    	
    	
    	
    	$('#btn_your_score').click(function() {
    		var past_score = parseInt(this.innerHTML);
    		$('#updateModal').modal('show');
    		
    		var star = document.getElementsByName('ratings');
    	
			for (var i = 0; i < 11 - past_score; i++) {
				star[i].checked = true;
			}
			
			$('#1-star1').click(function() {
				this.checked = true;
			});
			
			$('#btn_rate_update').click(function() {
				for (var i = 0; i < star.length; i++) {
					if (star[i].checked) {
						var a = star[i].value;
						var databack = a.trim();
					}
				}
				update_score(databack);
				
			});
			
    	});
    	
    	
    	
    	
    	
    	var isRun = false;
    	
    	function update_score(updated_score) {
    		if (isRun == true) {
    			return;
    		}
    		
    		isRun= true;
    		
    		$.ajax({
				// 요청 URL
				url: '/pjt/movie_rating/update/' + '${movie.movie_no}' + '/' + '${signInUserNickname}', 
				// 요청 방식
				type: 'PUT',
				// 요청 패킷 헤더
				headers: {
					'Content-Type': 'application/json',
					'X-HTTP-Method-Override': 'PUT'
				},
				// 요청 패킷 데이터
				data: JSON.stringify({
					'updated_score': updated_score
				}),
				
				// 성공 응답 콜백 함수
				success: function (result) {
					isRun = false;
						checkRatingRecord();
	
						// 평점 재계산.
						average_score();
						
						alert("별점 수정 성공!");
				}
				
			});
    			
    	}
    	
    	
    	
    	
    	
    	$('#btn_rate_delete').click(function(event) {
        		var result = confirm('별점을 삭제할까요?');
        		if (result) { // 확인(Yes) 버튼을 클릭했을 때
        			$.ajax({
        				// 요청 URL
        				url: '/pjt/movie_rating/delete/' + '${movie.movie_no}' + '/' + '${signInUserNickname}',
        				// 요청 타입
        				type: 'DELETE',
        				// 요청 헤더
        				headers: {
        					'Content-Type': 'application/json',
        					'X-HTTP-Method-Override': 'DELETE'
        				},
        				// 성공 응답 콜백 함수
        				success: function () {
        					checkRatingRecord();
        					
        					// 평점 재계산.
        					average_score();
        					
        					alert('별점 삭제 성공!');
        				}
        			});
        		}
        	});
    	
	
		
    	
    	function average_score() {
    		 $.getJSON('/pjt/movie_rating/average/' + '${movie.movie_no}', function (average) {
             	
             	var averageScore = average;
             	
             	var updated_average = average.toFixed(1);
             	
             	$('#average_score').html(updated_average);
             	
             	
             });
    	}
		
// ------------------------ 위는 평점, 별점 관련 코드, 밑은 좋아요 코드 -----------------------------------------------------------	

	if ('${signInUserNickname}' == null || '${signInUserNickname}' == '') {
		$('#btn_like').hide();
		$('#btn_unlike').show();
		$('#btn_unlike').click(function() {
			var answer = alert('로그인후 이용가능합니다.');
			location.href = '/pjt/movie/rating/signin?movie_no=' + ${movie.movie_no};
		});
		
	} else {	
		$('#btn_like').hide();
		$('#btn_unlike').show();
		
		// DB에서 좋아요 기록 불러와서 세팅.
		read_like();
		
		
		$('#btn_like').click(function() {  // 좋아요 클릭 -> 싫어요 전환 -> 삭제.
			$('#btn_like').hide();
			$('#btn_unlike').show();
			delete_like();
		});
			
				
		$('#btn_unlike').click(function() { // 싫어요 클릭 -> 좋아요 전환 -> 등록.
			$('#btn_unlike').hide();
			$('#btn_like').show();
			insert_like();
		});	
		
		
	}

	
	function read_like() {
		var user_nickname = '${signInUserNickname}';
		var movie_no = '${movie.movie_no}';
		
		 $.getJSON('/pjt/movie_like/read/' + user_nickname + '/' + movie_no, function (data) {
			 console.log(data);
         	
						if (data == movie_no) {
							 $('#btn_like').show();
							 $('#btn_unlike').hide();
						} else {
							$('#btn_like').hide();
							$('#btn_unlike').show();
						}	
         });
	}

	
	function insert_like() {
		
		var movie_no = '${movie.movie_no}';
		
		$.ajax({
			// 요청 주소
			url: '/pjt/movie_like/insert',
			// 요청 타입
			type: 'POST',
			// 요청 HTTP 헤더
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'POST'
			},
			// 요청에 포함되는 데이터(JSON 문자열)
			data: JSON.stringify({
				'movie_no': movie_no,
				'user_nickname': '${signInUserNickname}'
			}),
			// 성공 응답(200 response)이 왔을 때 브라우저가 실행할 콜백 함수
			success: function (resp) {
				read_like();
			}
		});
	}
	
	
	function delete_like() {
		
		var movie_no = '${movie.movie_no}';
		
		$.ajax({
			// 요청 URL
			url: '/pjt/movie_like/delete/' + movie_no + '/' + '${signInUserNickname}',
			// 요청 타입
			type: 'DELETE',
			// 요청 헤더
			headers: {
				'Content-Type': 'application/json',
				'X-HTTP-Method-Override': 'DELETE'
			},
			// 성공 응답 콜백 함수
			success: function () {
				read_like();
			}
		});
	}
	
    
    
        
}); 
    	</script>	
	
</body>
</html>
