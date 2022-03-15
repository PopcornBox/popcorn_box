# 영화 평점 웹 사이트 

## 목차
1. [프로젝트 명](#1-프로젝트-명)
2. [프로젝트 성격](#2-프로젝트-성격)
3. [프로젝트 소개](#3-프로젝트-소개)
4. [개발환경](#4-개발환경)
5. [Use Case Diagram](#5-use-case-diagram)
6. [File Tree](#6-file-tree)
7. [Database Modeling](#7-database-modeling)
8. [UI](#8-ui)


## 1. 프로젝트 명
POPCORN BOX

## 2. 프로젝트 성격
Spring 프로젝트

## 3. 프로젝트 소개
영화 정보와 평점을 한곳에서 확인할 수 있는 사이트입니다. 실시간으로 영화 평점을 반영하여, 영화 순위 차트를 갱신합니다. 그 외에도 커뮤니티와 이벤트 공간을 마련합니다.

## 4. 개발환경
Windows 10, Spring Framework 5.3.15, Java 1.8, Apache Tomcat 9.0, Eclipse, Oracle SQL Developer, Atom

## 5. Use Case Diagram
![usecase](https://user-images.githubusercontent.com/93204370/157472666-2137e7a8-2639-4b03-86ac-e6d5f31c4238.png)

## 6. File Tree
```
│  │  │          │      │  ├─com
│  │  │          │      │  │  └─spring
│  │  │          │      │  │      └─pjt
│  │  │          │      │  │          ├─controller
│  │  │          │      │  │          │      BoardController.class
│  │  │          │      │  │          │      BoardReplyRestController.class
│  │  │          │      │  │          │      EventController.class
│  │  │          │      │  │          │      EventReplyRestController.class
│  │  │          │      │  │          │      HomeController.class
│  │  │          │      │  │          │      MovieController.class
│  │  │          │      │  │          │      MovieLikeRestController.class
│  │  │          │      │  │          │      MovieRatingRestController.class
│  │  │          │      │  │          │      MovieReplyRestController.class
│  │  │          │      │  │          │      MovieSearchRestController.class
│  │  │          │      │  │          │      UserController.class
│  │  │          │      │  │          │      UserRestController.class
│  │  │          │      │  │          │      
│  │  │          │      │  │          ├─domain
│  │  │          │      │  │          │      Board.class
│  │  │          │      │  │          │      BoardReply.class
│  │  │          │      │  │          │      Event.class
│  │  │          │      │  │          │      EventReply.class
│  │  │          │      │  │          │      Movie.class
│  │  │          │      │  │          │      MovieLike.class
│  │  │          │      │  │          │      MovieReply.class
│  │  │          │      │  │          │      PageCriteria.class
│  │  │          │      │  │          │      PagingView.class
│  │  │          │      │  │          │      User.class
│  │  │          │      │  │          │      UserLog.class
│  │  │          │      │  │          │      
│  │  │          │      │  │          ├─interceptor
│  │  │          │      │  │          │      AuthInterceptor.class
│  │  │          │      │  │          │      SignedInInterceptor.class
│  │  │          │      │  │          │      
│  │  │          │      │  │          ├─mapper
│  │  │          │      │  │          │      BoardMapper.class
│  │  │          │      │  │          │      EventMapper.class
│  │  │          │      │  │          │      EventReplyMapper.class
│  │  │          │      │  │          │      MovieReplyMapper.class
│  │  │          │      │  │          │      
│  │  │          │      │  │          ├─persistence
│  │  │          │      │  │          │      BoardDao.class
│  │  │          │      │  │          │      BoardDaoImpl.class
│  │  │          │      │  │          │      BoardReplyDao.class
│  │  │          │      │  │          │      BoardReplyDaoImpl.class
│  │  │          │      │  │          │      EventDao.class
│  │  │          │      │  │          │      EventDaoImpl.class
│  │  │          │      │  │          │      EventReplyDao.class
│  │  │          │      │  │          │      EventReplyDaoImpl.class
│  │  │          │      │  │          │      MovieDao.class
│  │  │          │      │  │          │      MovieDaoImpl.class
│  │  │          │      │  │          │      MovieLikeDao.class
│  │  │          │      │  │          │      MovieLikeDaoImpl$ValueComparator.class
│  │  │          │      │  │          │      MovieLikeDaoImpl.class
│  │  │          │      │  │          │      MovieRatingDao.class
│  │  │          │      │  │          │      MovieRatingDaoImpl.class
│  │  │          │      │  │          │      MovieReplyDao.class
│  │  │          │      │  │          │      MovieReplyDaoImpl.class
│  │  │          │      │  │          │      UserDao.class
│  │  │          │      │  │          │      UserDaoImpl.class
│  │  │          │      │  │          │      
│  │  │          │      │  │          └─service
│  │  │          │      │  │                  BoardReplyService.class
│  │  │          │      │  │                  BoardReplyServiceImpl.class
│  │  │          │      │  │                  BoardService.class
│  │  │          │      │  │                  BoardServiceImpl.class
│  │  │          │      │  │                  EventReplyService.class
│  │  │          │      │  │                  EventReplyServiceImpl.class
│  │  │          │      │  │                  EventService.class
│  │  │          │      │  │                  EventServiceImpl.class
│  │  │          │      │  │                  KakaoLoginService.class
│  │  │          │      │  │                  KakaoLoginServiceImpl.class
│  │  │          │      │  │                  MovieLikeService.class
│  │  │          │      │  │                  MovieLikeServiceImpl.class
│  │  │          │      │  │                  MovieRatingService.class
│  │  │          │      │  │                  MovieRatingServiceImpl.class
│  │  │          │      │  │                  MovieReplyService.class
│  │  │          │      │  │                  MovieReplyServiceImpl.class
│  │  │          │      │  │                  MovieService.class
│  │  │          │      │  │                  MovieServiceimpl.class
│  │  │          │      │  │                  UserMailSendService.class
│  │  │          │      │  │                  UserService.class
│  │  │          │      │  │                  UserServiceImpl.class
│  │  │          │      │  │                  
│  │  │          │      │  ├─mapper
│  │  │          │      │  │      board-mapper.xml
│  │  │          │      │  │      boardReply-mapper.xml
│  │  │          │      │  │      like-mapper.xml
│  │  │          │      │  │      movie-mapper.xml
│  │  │          │      │  │      rating-mapper.xml
│  │  │          │      │  │      user-mapper.xml
│  │  │          │      │  │      
│  │  │          │      │  └─META-INF     
│  │  │          │      │          
│  │  │          │      └─views
│  │  │          │          │  footer.jsp
│  │  │          │          │  header.jsp
│  │  │          │          │  home.jsp
│  │  │          │          │  
│  │  │          │          ├─board
│  │  │          │          │      answer.jsp
│  │  │          │          │      detail.jsp
│  │  │          │          │      insert.jsp
│  │  │          │          │      main.jsp
│  │  │          │          │      notice.jsp
│  │  │          │          │      update.jsp
│  │  │          │          │      
│  │  │          │          ├─event
│  │  │          │          │      detail.jsp
│  │  │          │          │      main.jsp
│  │  │          │          │      register.jsp
│  │  │          │          │      update.jsp
│  │  │          │          │      winner.jsp
│  │  │          │          │      
│  │  │          │          ├─movie
│  │  │          │          │      detail.jsp
│  │  │          │          │      mainlist.jsp
│  │  │          │          │      
│  │  │          │          └─user
│  │  │          │                  findUserId.jsp
│  │  │          │                  findUserPwd.jsp
│  │  │          │                  leave.jsp
│  │  │          │                  mypage.jsp
│  │  │          │                  regisSuccess.jsp
│  │  │          │                  register.jsp
│  │  │          │                  resetPwd.jsp
│  │  │          │                  signin.jsp
│  │  │          │                  simpleRegister.jsp
│  │  │          │                  userInfo.jsp
```

## 7. Database Modeling
![db](https://user-images.githubusercontent.com/93204370/157481399-8abc853a-56ee-4313-8370-eae0e518db92.png)

## 8. UI
![home](https://user-images.githubusercontent.com/93204370/157069800-5f6ea106-39c1-475d-b3ca-6b61c933eb75.png)

