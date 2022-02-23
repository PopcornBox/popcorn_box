package com.spring.pjt.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pjt.domain.Movie;
import com.spring.pjt.service.MovieService;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {
	
	private static final Logger log = LoggerFactory.getLogger(MovieController.class);
	@Autowired private MovieService movieService;
	
	@RequestMapping(value = "/mainlist", method = RequestMethod.GET)
	public void main(Model model) {
		log.info("mainlist() 호출");
		
		List<Movie> list = movieService.select();
		model.addAttribute("movieList", list);		
	}

	//TODO
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(int movie_no, Model model, HttpServletRequest request) {
		log.info("detail(movie_no={}) GET 호출", movie_no);
		
		int vpage = 0;
		
		String value = request.getParameter("vpage");
		log.info("value:{}", value);
		if (value != null) {
			vpage = Integer.valueOf(value);
		} else {
			vpage = 1;
		}
		
		Movie movie = movieService.select(movie_no);
		model.addAttribute("movie", movie);
		model.addAttribute("viewpage", vpage);	
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(int type, String keyword, Model model) {
		log.info("search(type={}, keyword={})", type, keyword);
		
		List<Movie> list = movieService.select(type, keyword);
		model.addAttribute("movieList", list);
		
		return "movie/mainlist"; 
	}
	
	@RequestMapping(value="/rating/signin", method=RequestMethod.GET)
	public String showRatingWindow(int movie_no) {
		log.info("showRatingWindow() 호출");
		
		return "redirect:/movie/detail?movie_no=" + movie_no;		
	}
	
	@RequestMapping(value="/like/signin", method=RequestMethod.GET)
	public String allowLike() {
		log.info("allowLike() 호출");
		
		return "redirect:/movie/mainlist";		
	}
	
	// 댓글 작성 전에 로그인 여부 체크를 위해 만듦.
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String movieSignin(int movie_no) {
		log.info("movieSignin(movie_no:{}) GET 호출", movie_no);
			
		return "redirect:/movie/detail?movie_no=" + movie_no;
	}
	
}
