<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>#리뷰어스</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  
  <link href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/boxicons/css/boxicons.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/quill/quill.snow.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/quill/quill.bubble.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/remixicon/remixicon.css"/>" rel="stylesheet">
  
  
  <!-- Template Main CSS File -->
  <link href="<c:url value="/resources/assets/css/style.css"/>" rel="stylesheet">
  <!-- JS LINK -->
 	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/main.js"/>"></script>


  <!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style type="text/css">
     .item img{
    display: inline-block;
    width: 100%;
    height:100%;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
    border-radius: 0px;
     }
     
     .item {
    display: inline-block;
    width: 250px;
    margin-top: 40px;
    margin-left: 2%;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}
.ui-autocomplete {
	position:fixed;
    z-index:9050!important;
}
     
     .item .image {
    width: 100%;
    height: 200px;
    background-color: #ddd;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-size: cover;
    
}
.item .cont {
    padding: 20px;
}
.item strong {
    display: block;
    margin: 0 0 10px 0;
    font-size: 16px;
    letter-spacing: -1px;
}
.item p {
    font-size: 13px;
    letter-spacing: -1px;
}
 .item a {
    display: inline-block;
    margin-top: 10px;
    padding: 5px 10px;
    background: #eee;
    font-size: 13px;
    letter-spacing: -1px;
}
.item a:hover {
    background: #325cb2;
    color: #fff;
}
     
     img {
        width: 100%;
/*         height: 100%; */
        border-radius: 25px;
       
      }
      .slider {
        width: 80%;
        height : 15%;
        margin: 0px auto;
        margin-left:270px;
      }
      .slider .slick-slide {
        margin: 10px;
      }
      .slick-prev:before, .slick-next:before {
        color: #444444;
      }
      select{
     	margin-left:20px;
 		font-family: "Noto Sansf KR", sans-serif;
		font-size: 1rem;
		font-weight: 400;
		line-height: 1.5;
		
		color: #444;
		background-color: #fff;
		
		padding: 0.6em 1.4em 0.5em 0.8em;
		
		border: 1px solid #aaa;
		border-radius: 0.5em;
      }
   </style>
  
</head>
    <script>
      $( document ).ready( function() {
    	  
    	
    	  
        $( '.slider' ).slick( {
          autoplay: true,
          autoplaySpeed: 5000,
          slidesToShow: 6,
          slidesToScroll: 3,
        } );
      } );
      
  
    </script>




<body>

   <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="testMovie.do?type=movie" class="logo d-flex align-items-center">
        <span class="d-none d-lg-block">#Reviewers</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

	<div>
	<!-- 검색 -->
    <div class="search-bar">
      <form class="search-form d-flex align-items-center" action="search.do" id="searchHeader">
        <input type="search" id="autocompleteText" name="searchKeyword" aria-label="Search">
        <button type="submit" value="search"><i class="bi bi-search"></i></button>
     
      <select id="SC" name="SC">
		<option value="movie" selected>영화</option>
		<option value="tv">TV</option>
		<option value="review">리뷰</option>
		<option value="tag">태그</option>
		<option value="SearchId">아이디검색</option>
	</select>
      </form>

    </div>
    </div>
     <!-- 검색 끝 --> 


    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
        <!-- 검색 클릭 버튼 -->
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->



        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="#" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">리트리버</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>리트리버</h6>
              <span>강아지</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>내 프로필</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>계정 설정</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>도움말</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그 아웃</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="testMovie.do?type=movie">
          <i class="bi bi-grid"></i>
          <span>메인 페이지</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>컨텐츠 리뷰</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="getBoardList.do?boardnum=1">
              <i class="bi bi-circle"></i><span>영화</span>
            </a>
          </li>
          <li>
            <a href="getBoardList.do?boardnum=2">
              <i class="bi bi-circle"></i><span>TV프로그램</span>
            </a>
          </li>
          <li>
            <a href="getBoardList.do?boardnum=3">
              <i class="bi bi-circle"></i><span>웹툰</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>커뮤니티</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="testMovie.do?type=tv">
              <i class="bi bi-circle"></i><span>인기 TV 프로그램</span>
            </a>
          </li>
          <li>
            <a href="getBoardList.do?boardnum=4">
              <i class="bi bi-circle"></i><span>자유 게시판</span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span>업데이트 예정</span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span>업데이트 예정</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>인기 리뷰</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>인기 리뷰</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>마이페이지</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>F.A.Q</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>로그인</span>
        </a>
      </li><!-- End Login Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->
  
  
  
  
  
  
  
   <main id="main" class="main">

    <!-- 인기영화 슬라이드 코드 -->
  <c:choose>
  	<c:when test="${type eq 'movie'}">  
	  	<h2 style="margin-left:270px; margin-top: 100px;">인기 영화</h2>
  	</c:when>
  	<c:otherwise>
	  	<h2 style="margin-left:270px; margin-top: 100px;">인기 TV 프로그램</h2>
  	</c:otherwise>
  </c:choose>
  <div>
    <div class="slider">
     <c:forEach var="release_date" begin="0" end="19" step="1" items="${release_date}">
      <div><img src="${release_date.poster_path }" onClick="location.href='ContentsDetail.do?type=${release_date.contents_type }&id=${release_date.contents_num }'">
      <div>${release_date.title }</div>
      </div>
     </c:forEach>
    </div>
    </div>
    
    <hr>
    
    <div>

    	<h2 style="margin-left:270px; ">인기 리뷰</h2>
    	
    	<div class="slider">
    	<c:forEach var="board" items="${boardList }">
    			<li class="item item1">
                    <div class="image"><img src="<c:url value="/resources/images/${board.filename }"/>"></div>
                    <div class="cont">
                        <strong>${ board.title }</strong>
                        <p>${board.content }</p>
                        <p>작성자:${board.nickname }</p>
                        <p>추천:${board.like_num} &nbsp&nbsp 비추:	 ${board.unlike_num}</p>
                        <a href="#">바로가기</a>
       </div>
         
 				</c:forEach>
    	</div>
    </div>
  
    
    
   <!-- 인기영화 슬라이드 끝 -->

                 



            

          

             

   

          

             
            

         

      </div>
    </section>

  </main><!-- End #main -->
  
  
  
  
  
  
  
  
  
  
  
  
  

  

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <!-- <script src="<c:url value="/resources/assets/vendor/apexcharts/apexcharts.min.js"/>"></script> -->
  <script src="<c:url value="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  
  <!-- <script src="<c:url value="/resources/assets/vendor/echarts/echarts.min.js"/>"></script> -->
  
  <script src="<c:url value="/resources/assets/vendor/quill/quill.min.js"/>"></script>

    <script src="<c:url value="/resources/assets/vendor/php-email-form/validate.js"/>"></script>
  
   <script src="<c:url value="/resources/assets/js/main.js"/>"></script>
   <script src="<c:url value="/resources/assets/js/autoComplete.js"/>"></script>



    

</body>
</html>
