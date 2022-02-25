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
<!-- <link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css"> -->
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">	
<style>

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
                            <li class="active"><a href="../movie/mainlist">차트</a></li>
                            <li><a href="../board/main">커뮤니티</a></li>
                            <li><a href="../event/main">이벤트</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="search_option">
                    <div class="header__nav__option">
                         <div>
							<form name="search" align="right" style="margin-right:20px;" method = "get"  
								action ="./search" >
			                    <select name="type" class="search" style="padding-bottom: 1px;">
			                        <option value="1">제목</option>
			                        <option value="2">배우</option>
			                        <option value="3">감독</option>
			                        <option value="4">장르</option>
			                    </select>
			                    <input class="search" type="text" name="keyword" placeholder="검색어 입력"
			                    	required oninvalid="this.setCustomValidity('검색어를 입력하세요.')"
											 oninput = "setCustomValidity('')"/>
			                    <input class="btn" type="submit" value="" />
			                </form>
			            </div>
                    </div>
                </div>
                
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h3>Top Movies</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
	
	<div class="container">
		<div class="movie__chart__table">
		<table id="movie_chart" class="table">
			<thead class="thead-blue text-center">
				<tr>
					<th>영화순위</th>
					<th class="poster"></th>
					<th class="title">제목</th>
					<th>평점</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<c:forEach var="movie" items="${movieList}">
					<tr>
						<td></td>
						<td>
							<span id="movie_image" name="movie_image"><img
								src="${movie.movie_image}" width="185" height="260" /></span>
						</td>
						<td>
							<a href="./detail?movie_no=${movie.movie_no}">
								<span style="font-size: 20px;">${movie.movie_title}</span>
							</a>
						</td>
						<td class="points ${movie.movie_no}"></td>
						<td>
						    <i class="fa-regular fa-heart" id="${movie.movie_no}"></i>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
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
		
		if ('${signInUserNickname}' == null || '${signInUserNickname}' == '') {
			$('tr').find('i').removeClass('fa-solid');
			$('tr').find('i').click(function() {
				var answer = alert('로그인후 이용가능합니다.');
				location.href = '/pjt/movie/like/signin';
			});
		} else {
			// DB에서 좋아요 기록 불러와서 세팅.
			read_like();
			count_like();
			
		
		
			
			$('tr').find('i').click(function() {
				if ($(this).hasClass('fa-regular') == true) { // 좋아요 누른 경우
					$(this).removeClass('fa-regular');
					$(this).addClass('fa-solid');
					var id = $(this).attr('id');
				    insert_like(id);
					
				} else {                                      // 해제한 경우
					$(this).removeClass('fa-solid');
					$(this).addClass('fa-regular');
					var id = $(this).attr('id');
					delete_like(id);
				}
			});
		
		
		}
		
		
		
		
		function read_like() {
			var user_nickname = '${signInUserNickname}';
			
			 $.getJSON('/pjt/movie_like/check/' + user_nickname, function (data) {
             	
				 var a = $('tr').find('i');
				 
             	if (data == null) { // 좋아요 등록 이력이 없으면
             	
             		if (a.hasClass('fa-solid') == true) {
             			a.classList.replace('fa-solid', 'fa-regular');
             		}
 				
 				} else { // 있으면
 					
 					if (a.hasClass('fa-solid') == true) {
 						a.classList.replace('fa-solid', 'fa-regular');
             		}
 					
 					data.forEach(function(element) {
 						var movie_no = element;
 						var icon = document.getElementById(movie_no);
 						icon.classList.remove('fa-regular');
 						icon.classList.add('fa-solid');
 						
 					});
 				}
             	
             });
		}
	
		
		function insert_like(movie_no) {
    			
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
					count_like();
        			}
        		});
			}
			
		
		
    	
    	
		function delete_like(movie_no) {
			
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
						count_like();
        				}
        			});
        		}
		
			function count_like() {
			
			 var iconList = $('tr').find('i');
			 
			 for (var i = 0; i < iconList.length; i++) {
				 
				 var movie_no = iconList[i].getAttribute('id');
				 console.log(i);
				 console.log(movie_no);
				 get_data(movie_no);	 
			 }
			 
			 
		} 
		

		function get_data(movie_no)  {
			$.getJSON('/pjt/movie_like/count/' + movie_no, function (data) {
				console.log(movie_no); 
				console.log(data); 
			 
         	 	if (data != null) { // 좋아요 기록이 있으면 (카운팅)
		         	
	         				var iconList = $('tr').find('i');
	   			 
	   			 			for (var i = 0; i < iconList.length; i++) {
	   					 
	   			 				if (iconList[i].getAttribute('id') == movie_no) {
	   			 				iconList[i].innerHTML = '<span>&nbsp&nbsp&nbsp' + data.length + '</span>';
	   			 				}
	   			 			}
				 }
         	 	
         	 	for (var i = 0; i < data.length; i++) {
					if (data[i] == 0) {
						
						var iconList = $('tr').find('i');
			   			 
   			 			for (var i = 0; i < iconList.length; i++) {
   					 
   			 				if (iconList[i].getAttribute('id') == movie_no) {
   			 				iconList[i].innerHTML = ' ';
   			 				}
   			 			}
					}
				}
     	
     		});
	
    }
		
	// ---------------------- 위는 좋아요 코드, 아래는 일정 시간 주기로 평점 데이터 불어와서 세팅하는 코드 ------------------
	
			read_average_record();
			set_table();
			read_average_record2();
			set_table();
			
	
        	function read_average_record() {
        		
			 $.getJSON('/pjt/movie_rating/all_movies', function (data) {
             	
				 data.forEach(function(element) {
					 var movie_no = element;
					 average_score(movie_no);			// 평점 부여.		
					 
				 }); // for 반복
             	
             }); // getJson
		} // read_average_record
		
		
		
	
		function read_average_record2() {
    		timer = setInterval(function() {
		
        	 $.getJSON('/pjt/movie_rating/all_movies', function (data) {
              	
				 data.forEach(function(element) {
					 var movie_no = element;
					 average_score(movie_no);			// 평점 부여.		
					 
				 }); // for 반복
             	
             }); // getJson
           
           }, 30000);  // 30초 마다
             
		} // read_average_record
		
		
		
		
        	
        	
        	function average_score(movie_no) {
       		 $.getJSON('/pjt/movie_rating/average/' + movie_no, function (average) {
       				var tdList = document.getElementsByClassName('points');
       				
       				for(var i = 0; i < tdList.length; i++){
       					console.log(tdList[i]);
       				    if (tdList[i].classList.contains(movie_no) == true) {
       				    	tdList[i].innerHTML = average.toFixed(1);
       				    } 
       				}		
       					set_table();						// 테이블 순위별 배열.
                });
       		
       	}
	
        	 function set_table() {
        		 var rows = $('#movie_chart tbody tr').get();
        		 rows.sort(function(a, b) {
        			var A = $(a).children('td').eq(3).text();
        			var B = $(b).children('td').eq(3).text();
        			console.log(A);
        			console.log(B);
        			
        			if (A < B) {
        				return 1;
        			}
        			
        			if (A > B) {
        				return -1;
        			}
        			
        			return 0;
        			
        		 });
        		 
        		 $.each(rows, function(index, row) { 	
        			 $('#movie_chart').children('tbody').append(row); 
        		 
        		 });     		 
        	 }	
	
	
	
	
	
	});
	
	
	
		
	
	
	</script>
</body>
</html>
