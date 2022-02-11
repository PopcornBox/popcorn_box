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
	<div>
		<header>
			<h1>영화 상세보기</h1>
		</header>
		<div>
			<%-- 글 상세보기 --%>
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

		</div>



	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>