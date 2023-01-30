<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="/resources/common.css" />" rel="stylesheet">
<link href="<c:url value="/resources/button.css" />" rel="stylesheet">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
 <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<body>
<header>
           <nav2 class="navbar">
                  <div class="navbar_logo1">
                        <div>#리뷰어스</div>
                  </div>
                  <div class="navbar_search">
                        <input type="text">
                        <i class="fa-solid fa-magnifying-glass"></i>
                  </div>
                  <div class="navbar_button">
                        <button type="button" onclick=login();>로그인</button>
                        <button type="button">회원가입</button>
                  </div>
            </nav2> 
      </header>

<div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="" class="nav__logo">로그인 해주세요</a>
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name" Onclick="location.href='testMovie.do?type=movie'">메인</span>
                    </a>
                    <div href="#" class="nav__link collapse">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">컨텐츠</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">Movie</a>
                            <a href="#" class="collapse__sublink">TV</a>
                            <a href="#" class="collapse__sublink">WebToon</a>
                        </ul>
                    </div>
                    <a href="#" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">커뮤니티</span>
                    </a>


                    <a href="#" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">인기리뷰</span>
                    </a>


                    <a href="#" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">마이페이지</span>
                    </a>
                </div>
                <a href="#" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">로그아웃</span>
                </a>
            </div>
        </nav>
    </div>
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3 style="color:coral;"><b>#REVIEWERS 게시판</b></h3>
        </div>
    </div>

    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="getBoardQList.do">
                    <div class="search-wrap">
                        <input id="searchKeyword" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요.">                       
                        <input type="submit" class="btn btn-dark" value="검색">
                        <select name="searchCondition">
           					 <option value="TITLE">제목
           					 <option value="CONTENT">내용
           					 <option value="WRITER">작성자
       					  </select>
                    </div>
                </form>
            </div>
        </div> 
    </div>
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">작성자</th>
                    <th scope="col" class="th-writer">등록일</th>
                    <th scope="col" class="th-cnt">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="@" var="boardqList">
   <tr>
      <td>1</td>
      <td align="left"><a href="#">아바타에 바다나올때 진짜인줄 알고 스크린에 다이빙 박았다</a></td>
      <td>피부파란사람</td>
      <td>2023-01-13</td>
      <td>641653</td>

   </tr>
     <tr>
      <td>2</td>
      <td align="left"><a href="#">범죄도시 보고 이두 키우기로함</a></td>
      <td>마뚱석</td>
      <td>2023-01-11</td>
      <td>464532</td>

   </tr>
     <tr>
      <td>3</td>
      <td align="left"><a href="#">범죄도시 영화 비추천한다 폭력적이야</a></td>
      <td>장이수</td>
      <td>2023-01-11</td>
      <td>554630</td>

   </tr>
     <tr>
      <td>4</td>
      <td align="left"><a href="#">더 글로리 개꿀잼 꼭보셈</a></td>
      <td>송혜교</td>
      <td>2023-01-12</td>
      <td>646421</td>

   </tr>
     <tr>
      <td>5</td>
      <td align="left"><a href="#">모범택시 보면서 감명받고 면허땀b</a></td>
      <td>밤에 선글라스끼는 사람</td>
      <td>2023-01-13</td>
      <td>454652</td>

   </tr>
     <tr>
      <td>6</td>
      <td align="left"><a href="#">웬즈데이 추천합니다!!!!!!!!!!!</a></td>
      <td>겁쟁이</td>
      <td>2023-01-14</td>
      <td>651644</td>

   </tr>
     <tr>
      <td>7</td>
      <td align="left"><a href="#">외계+인 1부 리뷰 씁니다</a></td>
      <td>천왕성에서온유저</td>
      <td>2023-01-14</td>
      <td>171653</td>

   </tr>
     <tr>
      <td>8</td>
      <td align="left"><a href="#">⭐⭐⭐⭐⭐⭐⭐나쁜녀석들: 악의도시 ⭐⭐⭐⭐⭐⭐⭐</a></td>
      <td>나쁜놈</td>
      <td>2023-01-15</td>
      <td>545653</td>

   </tr>
     <tr>
      <td>9</td>
      <td align="left"><a href="#">황혼 드라마 개꿀잼</a></td>
      <td>귀신안믿는사람</td>
      <td>2023-01-16</td>
      <td>981513</td>

   </tr>
     <tr>
      <td>10</td>
      <td align="left"><a href="#">하이큐 보고 배구 시작한다. 진짜 꼭봐라</a></td>
      <td>농구선수</td>
      <td>2023-01-16</td>
      <td>961512</td>

   </tr>
     <tr>
      <td>11</td>
      <td align="left"><a href="#">재벌집 막내아들 개인적인 생각(결말 포함 X 스포 X)<a></td>
      <td>이재용</td>
      <td>2023-01-17</td>
      <td>675611</td>

   </tr>
   </c:forEach>
                </tbody>
            </table>
<button type="button" class="btn btn-dark" style="float:right;" onClick="location.href='#'">글쓰기</button>
<button type="button" class="btn btn-dark" style="float:right;" onClick="location.href='#'">글목록</button>
        </div>
    </div>
<center>
</center>
</section>
</body>
</html>