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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
</head>
<body>
	<div id="Wrap">
		<header>
			<h1>영화 상세보기</h1>
		</header>
		<div id="container">
			<div id="movie-content">
				<div id="top-movie">
					<span>
					<a><img src="${movie.movie_image}"  id="movie_image" name="movie_image" /> </a>
					</span>
					<ul>
						<li id="movie_title" name="movie_title">${movie.movie_title}</li>
						<li id="movie_director" name="movie_director">감독: ${movie.movie_director}</li>
						<li id="movie_actor" name="movie_actor">배우: ${movie.movie_actor}</li>
						<li id="movie_genre" name="movie_genre">장르: ${movie.movie_genre}</li>
						<li id="movie_info" name="movie_info">정보: ${movie.movie_info}</li>
						<li id="movie_release" name="movie_release">개봉일: ${movie.movie_release}</li>
					</ul>

				</div>
				<%-- 상단 정보 끝  --%>
				
				
				<%-- --%>



				<%-- 영화 상세 --%>
				<%-- 
			<form>
				<div>
					<label for="movie_title">영화제목</label> <input type="text"
						id="movie_title" name="movie_title" value="${movie.movie_title}"
						required autofocus readonly />
				</div>
				<div>
					<label for="movie_content">영화 내용</label>
					<textarea rows="5" id="content" name="content" required readonly>${movie.movie_content}</textarea>
				</div>
				<div>
					<label for="movie_director">영화 감독</label> <input type="text"
						id="movie_director" name="movie_director" value="${movie.movie_director}"
						required autofocus readonly />
				</div>
								<div>
					<label for="movie_director">장르</label> <input type="text"
						id="movie_director" name="movie_director" value="${movie.movie_director}"
						required autofocus readonly />
				</div>
								<div>
					<label for="movie_director">영화 감독</label> <input type="text"
						id="movie_director" name="movie_director" value="${movie.movie_director}"
						required autofocus readonly />
				</div>

			</form>
			
			--%>
			</div>

		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>