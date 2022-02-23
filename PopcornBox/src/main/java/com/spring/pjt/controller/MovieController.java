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
	public void detail(int movie_no, Model model) {
		log.info("detail(movie_no={}) GET 호출", movie_no);
		
		Movie movie = movieService.select(movie_no);
		model.addAttribute("movie", movie);
		
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
	
}
