package com.spring.pjt.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pjt.domain.Event;
import com.spring.pjt.domain.Movie;
import com.spring.pjt.service.EventService;
import com.spring.pjt.service.MovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired private EventService eventService;
	@Autowired private MovieService movieService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		logger.info("home() 호출");
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("msg") != null) {
			String msg = (String) session.getAttribute("msg");
			model.addAttribute("msg", msg);	
			session.removeAttribute("msg");
		}
		List<Event> eventList = eventService.selectAll();
		model.addAttribute("eventList", eventList);
		model.addAttribute("today", new Date());
		
		logger.info("mainlist() 호출");
		
		List<Movie> list = movieService.select();
		model.addAttribute("movieList", list);
		return "home";
	}
	
}
