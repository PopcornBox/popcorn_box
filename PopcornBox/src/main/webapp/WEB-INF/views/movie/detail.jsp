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
					<a><img src="${movie.movie_image}"  width="185" height="260" id="movie_image" name="movie_image" /> </a>
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
				
				
				<div id="movie-detail">
					<ul>
						<li id="movie_content" name="movie_content">${movie.movie_content}</li>
					</ul>
					<span id="movie_trailer" name="movie_trailer">${movie.movie_trailer}
					</span>
				</div>
				
						
			</div>

		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>