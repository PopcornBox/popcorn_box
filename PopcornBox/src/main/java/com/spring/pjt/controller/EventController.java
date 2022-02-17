package com.spring.pjt.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.pjt.domain.Event;
import com.spring.pjt.service.EventReplyService;
import com.spring.pjt.service.EventService;

@Controller
@RequestMapping(value = "/event")
public class EventController {

	private static final Logger log = LoggerFactory.getLogger(EventController.class);
	@Autowired private EventService eventService;
	@Autowired private EventReplyService eventReplyService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void eventMain(Model model, HttpServletRequest request) {
		log.info("eventMain() GET 호출");
		
		String msg = (String) request.getSession().getAttribute("msg");
		if (msg != null) {
			model.addAttribute("msg", msg);
			request.getSession().removeAttribute("msg");
		}
		
		List<Event> eventList = eventService.selectAll();
		model.addAttribute("eventList", eventList);
		model.addAttribute("today", new Date());
	}
		
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void eventDetail(int event_no, int q, Model model, HttpServletRequest request) {		
		log.info("eventDetail(event_no:{}) GET 호출", event_no);
	
		int vpage = 0;
		
		String value = request.getParameter("vpage");
		log.info("value:{}", value);
		if (value != null) {
			vpage = Integer.valueOf(value);
		} else {
			vpage = 1;
		}
		
		
		Event event = eventService.selectByNo(event_no);
		model.addAttribute("event", event);
		model.addAttribute("q", q);
		model.addAttribute("viewpage", vpage);
		
	}
	
	// 댓글 작성 전에 로그인 여부 체크를 위해 만듦.
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String eventSignin(int event_no, int q) {
		log.info("eventSignin(event_no:{}, q:{}) GET 호출", event_no, q);
		
		return "redirect:/event/detail?event_no=" + event_no + "&q=" + q;
	}
	
	
	@RequestMapping(value = "/winner", method = RequestMethod.GET)
	public void eventWinner(int event_no, int q) {
		log.info("eventWinner(event_no:{}, q:{}) GET 호출", event_no, q);
			
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void eventRegister() {
		log.info("eventRegister() GET 호출");			
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String eventRegister2(HttpServletRequest request) {
		String event_start_time = request.getParameter("event_start_time");
		String event_last_time = request.getParameter("event_last_time");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date startDate = null;
		Date finishDate = null;
		
		try {
			startDate = formatter.parse(event_start_time);
			finishDate = formatter.parse(event_last_time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Event event = new Event(0, request.getParameter("event_title"), request.getParameter("event_thumb"), request.getParameter("event_content"), startDate, finishDate);
		
		log.info("eventRegister2(event:{}) POST 호출", event);
		
		int result = eventService.registerEvent(event);
		
		String msg = "";
		
		if (result == 1) {
			msg = "새 이벤트가 성공적으로 등록되었습니다.";
		} else {
			msg = "같은 이벤트가 이미 존재합니다.";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		return "redirect:/event/main";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void eventUpdate(int event_no, Model model) {
		log.info("eventRegister(event_no:{}) GET 호출", event_no);	
		
		Event event = eventService.selectByNo(event_no);
		
		Date event_start_time = event.getEvent_start_time();
		Date event_last_time = event.getEvent_last_time();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		String startDate = null;
		String finishDate = null;
		
		startDate = formatter.format(event_start_time);
		finishDate = formatter.format(event_last_time);	
		
		model.addAttribute("event", event);
		model.addAttribute("startDate", startDate);
		model.addAttribute("finishDate", finishDate);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String eventUpdate2(HttpServletRequest request) {
		String event_start_time = request.getParameter("event_start_time");
		String event_last_time = request.getParameter("event_last_time");
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date startDate = null;
		Date finishDate = null;
		
		try {
			startDate = formatter.parse(event_start_time);
			finishDate = formatter.parse(event_last_time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int event_no = Integer.valueOf(request.getParameter("event_no"));
		
		Event event = new Event(event_no, request.getParameter("event_title"), request.getParameter("event_thumb"), request.getParameter("event_content"), startDate, finishDate);
		
		log.info("eventUpdate2(event:{}) POST 호출", event);
	
		
		int result = eventService.updateEvent(event);
		
		String msg = "";
		
		if (result == 1) {
			msg = "이벤트가 성공적으로 수정되었습니다.";
		} else {
			msg = "같은 이벤트가 이미 존재합니다.";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		return "redirect:/event/main";
		
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String eventDelete(int event_no, HttpServletRequest request) {
		log.info("eventDelete(event_no:{}) GET 호출", event_no);	
		
		eventReplyService.deleteAllOnEvent(event_no);
		
		eventService.deleteEvent(event_no);
		
		String msg = "삭제 되었습니다.";
		
		request.getSession().setAttribute("msg", msg);
		
		return "redirect:/event/main";
	}
	
	
}
