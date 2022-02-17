<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
		<title>Popcorn Box</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" 
        		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
	
		<style>
			hr {
				border: 1px solid gray;
			}
			
			.event_list ul li {
				width: 390px;
				height: 456px;
				border: 1px solid #ddd;
				display: inline-block;
			}
			
			.event_list ul li a {
				display: block;
				position: relative;
			}
			
			.event_thumb {
				overflow: hidden;
			}
			
			.event_thumb img {
				width: 360px;
				height: 270px;
			}
			
			#d-day {
				color: red;
			}
			
			.event_list li a #finish {
				position: absolute;
				right: 9px;
				top: 9px;
				z-index: 2;
				width: 60px;
				height: 60px;
				background: rgba(0,0,0,.5);
				color: #fff;
				text-align: center;
				line-height: 60px;
				border-radius: 100%;
			}
			
		</style>
	</head>

	<body>
		<div>
			<h3>Event</h3>
			
			<c:if test="${signInUserPosition eq 'A'}">
				<a href="./register"><button>새로운 이벤트 등록하기</button></a>
			</c:if>
			<c:if test="${signInUserPosition eq 'B'}">
				<a href="./register"><button>새로운 이벤트 등록하기</button></a>
			</c:if>
		</div>
		
		<hr />
		
		<div class="event_list">
			<ul>
				<c:forEach var="event" items="${eventList}">
					<!-- 디데이 계산을 위한 날짜 세팅 변환 -->
					<fmt:formatDate var="startTime" value="${event.event_start_time}" pattern="yyyy-MM-dd"/> 
					<fmt:formatDate var="lastTime"  value="${event.event_last_time}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="todayNow" value="${today}" pattern="yyyy-MM-dd"/> 
				
				    <fmt:parseDate value="${lastTime}" var="event_last" pattern="yyyy-MM-dd"></fmt:parseDate>
					<fmt:parseNumber value="${event_last.time / (1000*60*60*24)}" integerOnly="true" var="lastDate"></fmt:parseNumber>
				    <fmt:parseDate value="${todayNow}" var="now" pattern="yyyy-MM-dd"></fmt:parseDate>
				    <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="todayDate"></fmt:parseNumber>
				
				
					<li>
						<a href="./detail?event_no=${event.event_no}&q=${lastDate - todayDate}">
							<div class="event_thumb">
								<img alt="${event.event_title}" src="${event.event_thumb}">
							</div>
							
							<c:if test="${lastDate - todayDate < 0}">
								<em id="finish">마감</em>
							</c:if>
							
							<div class="event_desc">
								<p class="text1">${event.event_title}</p>
								<p class="text2">
										<fmt:formatDate value="${event.event_start_time}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${event.event_last_time}" pattern="yyyy.MM.dd."/>
							    		&nbsp;&nbsp;
							   			<c:if test="${lastDate - todayDate > 0}">
							   				<em id="d-day">D - ${lastDate - todayDate}</em> 
							   			</c:if>
							   			<c:if test="${lastDate - todayDate < 0}">
							   				<a href="./winner?event_no=${event.event_no}&q=${lastDate - todayDate}"><button>당첨자 확인</button></a> 
							   			</c:if>
								</p>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>	
		</div>
							
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    	<script>
    		$(document).ready(function() {
    			var message = '${msg}';
				if (message != null && message != '') {
					alert(message);
				}
    		});
    	</script>
    
    </body>
</html>