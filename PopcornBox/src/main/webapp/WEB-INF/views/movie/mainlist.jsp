<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		  <link rel="stylesheet" 
        	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

	</head>
	<body>
		            <div class="container">
                <table class="table table-blue table-striped" >
                    <thead>
                        <tr>
                            <th></th>
                            <th>제목</th>
                            <th>평점</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="movie" items="${movieList}">
                            <tr>
                                <td><span id="movie_image" name="movie_image"><img src="${movie.movie_image}"  width="185" height="260"/></span></td>
                                <td>
                                    <a href="./detail?movie_no=${movie.movie_no}">${movie.movie_title}</a>
                                </td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            
		
		
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
	</body>
</html>