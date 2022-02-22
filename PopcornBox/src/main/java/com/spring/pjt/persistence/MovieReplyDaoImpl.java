package com.spring.pjt.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pjt.domain.MovieReply;
import com.spring.pjt.mapper.MovieReplyMapper;

@Repository
public class MovieReplyDaoImpl implements MovieReplyDao {

	private static final Logger log = LoggerFactory.getLogger(MovieReplyDaoImpl.class);
	@Autowired private MovieReplyMapper mapper;
	
	@Override
	public int insert(MovieReply movieReply) {
		log.info("insert(movieReply:{})", movieReply);
		return mapper.insertMovieReply(movieReply);
	}

	@Override
	public MovieReply existMovieReply(MovieReply movieReply) {
		log.info("existMovieReply(movieReply:{})", movieReply);
		return mapper.checkMovieReply(movieReply);
	}

	@Override
	public List<MovieReply> readAllMovieReplies(Integer movie_no) {
		log.info("readAllMovieReplies(movie_no:{})", movie_no);
		return mapper.readAllMovieReplies(movie_no);
	}

	@Override
	public List<MovieReply> readTenMovieReplies(Integer movie_no, Integer viewpage) {
		int startpage = (viewpage * 10) - 9;
		int lastpage = (viewpage * 10);
		log.info("readATenEventReplies(event_no:{}, startpage:{}, lastpage:{})", movie_no, startpage, lastpage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("startpage", startpage);
		map.put("lastpage", lastpage);
		
		if (viewpage > 1) {
			return mapper.readTenMovieReplies2(map);
		} else {
			return mapper.readTenMovieReplies1(map);
		}
	}
	
	@Override
	public int delete(Integer movie_reply_no) {
		log.info("delete(movie_reply_no:{})", movie_reply_no);
		return mapper.deleteMovieReply(movie_reply_no);
	}

	@Override
	public int deleteAllOnMovie(int movie_no) {
		log.info("deleteAllOnMovie(movie_no:{})", movie_no);
		return mapper.deleteAllMovieReply(movie_no);
	}

	@Override
	public int update(MovieReply movieReply) {
		log.info("update(movieReply:{})", movieReply);
		return mapper.updateMovieReply(movieReply);
	}

}
