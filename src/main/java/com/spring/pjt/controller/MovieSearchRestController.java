package com.spring.pjt.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.javassist.expr.NewArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.pjt.domain.Movie;
import com.spring.pjt.service.MovieService;


@RestController
@RequestMapping(value = "/movie_search")
public class MovieSearchRestController {

	private static final Logger log = LoggerFactory.getLogger(MovieSearchRestController.class);
	@Autowired private MovieService movieService;
	
	@RequestMapping(value = "/{type}/{keyword}", method = RequestMethod.GET)
	public ResponseEntity<List<String>> getData(@PathVariable(name = "type") int type, @PathVariable(name = "keyword") String keyword) {
			log.info("getData(type:{}, keyword:{})", type, keyword);
			
			List<String> dataList = new ArrayList<>();
			String text = "";
			String[] array = {};
			Set<String> set = new HashSet<>();
			
			if (type == 4) { // 장르 검색
				List<Movie> rawList = movieService.select();
	
				for (Movie m : rawList) {
					String genre = m.getMovie_genre();
					text += genre + ", ";
				}
				
				System.out.println("text =" + text);
				
				array = text.split(",");
				
				for (String s : array) {
				System.out.println(s);
				}
				
				for (int i = 0; i < array.length; i++) {
					if (!dataList.contains(array[i])) {
						dataList.add(array[i]);
					}
				}
				
			  dataList.remove("애니메이션");	
				
			  System.out.println("dataList =" + dataList);
			}
			
			if (type == 2) { // 배우 검색
				List<Movie> rawList = movieService.select();
	
				for (Movie m : rawList) {
					String actor = m.getMovie_actor();
					text += actor + ", ";
				}
				
				System.out.println("text =" + text);
				
				array = text.split(",");
				System.out.println("array =" + array);
				
				for (int i = 0; i < array.length; i++) {
					if (!dataList.contains(array[i])) {
						dataList.add(array[i]);
					}
				}
				
			  System.out.println("dataList =" + dataList);
			}
			
			if (type == 3) { // 감독 검색
				List<Movie> rawList = movieService.select();
	
				for (Movie m : rawList) {
					String director = m.getMovie_director();
					text += director + ", ";
				}
				
				System.out.println("text =" + text);
				
				array = text.split(",");
				System.out.println("array =" + array);
				
				for (int i = 0; i < array.length; i++) {
					if (!dataList.contains(array[i])) {
						dataList.add(array[i]);
					}
				}
				
			  System.out.println("dataList =" + dataList);
			}
			
			if (type == 1) { // 제목 검색
				List<Movie> rawList = movieService.select();
	
				for (Movie m : rawList) {
					String title = m.getMovie_title();
					text += title + ", ";
				}
				
				System.out.println("text =" + text);
				
				array = text.split(",");
				System.out.println("array =" + array);
				
				for (int i = 0; i < array.length; i++) {
					if (!dataList.contains(array[i])) {
						dataList.add(array[i]);
					}
				}
				
			  System.out.println("dataList =" + dataList);
			}
						
			ResponseEntity<List<String>> entity = new ResponseEntity<>(dataList, HttpStatus.OK);
			return entity; 	
	}
}
