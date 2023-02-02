<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

	   <!-- BootStrap -->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	
  <!-- Vendor CSS Files -->
  
  <link href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/boxicons/css/boxicons.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/quill/quill.snow.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/quill/quill.bubble.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/remixicon/remixicon.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/sujin.css"/>" rel="stylesheet"> 
  
  
  <!-- Template Main CSS File -->
  <link href="<c:url value="/resources/assets/css/style.css"/>" rel="stylesheet">
  <!-- JS LINK -->
 	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 	<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" >
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

<style>

ul, li {
    list-style: none;
    
}
a {
    text-decoration: none;
    color: inherit;
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
		      <c:choose>
            <c:when test="${User.userId  eq null }">
               <!-- Button trigger modal -->
               <button type="button" class="btn" data-toggle="modal"
                  data-target="#exampleModalCenter">로그인</button>
                        <button type="button" onclick="location.href='sign_up.do'">회원가입</button>
            </c:when>
            <c:otherwise>
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${UserInfo.nickname }</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${User.userId }</h6>
              <span>${UserInfo.nickname }</span>
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
              <a class="dropdown-item d-flex align-items-center" href="logout.do">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그 아웃</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
     </c:otherwise>
         </c:choose>


      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="testMovie.do?type=movie">
          <i class="bi bi-grid"></i>
          <span>메인 페이지</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="testMovie.do?type=movie">
              <i class="bi bi-circle"></i><span>인기 영화</span>
            </a>
          </li>
          <li>
            <a href="testMovie.do?type=tv">
              <i class="bi bi-circle"></i><span>인기 TV프로그램</span>
            </a>
          </li>
          <li>
            <a href="testMovie.do?type=webtoon">
              <i class="bi bi-circle"></i><span>인기 웹툰</span>
            </a>
          </li>
        </ul>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i>
          <span>컨텐츠 리뷰</span> <i class="bi bi-chevron-down ms-auto"></i>
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
            <a href="getBoardList.do?boardnum=4">
              <i class="bi bi-circle"></i><span>자유 게시판</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Forms Nav -->


      <li class="nav-item">
        <a class="nav-link collapsed" href="mypage.do">
          <i class="bi bi-person"></i>
          <span>마이페이지</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="cs.do">
          <i class="bi bi-question-circle"></i>
          <span>고객센터</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="login.do" data-toggle="modal"
                  data-target="#exampleModalCenter">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>로그인</span>
        </a>
      </li><!-- End Login Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->

<!-- 
<main id="main" class="main">		
 	<div class="list_wrap">
       	     <ul>
 				<c:forEach items="${boardList }" var="board">
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
            </ul>
     </div>
 -->
 <main id="main" class="main">
 
 <div class="css-1gkas1x-Grid e1689zdh0">
 	<div class="css-1y901a1-Row emmoxnt0">
 		<ul class="css-27z1pm-VisualUI-ContentGrid e14whxmg0" style="width:80%;margin:auto;">
 		<c:forEach items="${boardList }" var="board">
 			<li class="css-1hp6p72">
 				<a title="${board.title }" href="#">
 					<div class="css-1qmeemv">
 						<div class="css-1rdb949-StyledLazyLoadingImage ezcopuc0">
 							<img src="<c:url value="/resources/images/${board.filename }"/>" class="css-qhzw1o-StyledImg ezcopuc1">
 						</div>
 					</div>
 					<div class="css-ixy093">
 						<div class="css-niy0za">제목:${board.title }</div>
 							<div>
 								<div class="css-m9i0qw">추천:${board.like_num }</div>
 								<div class="css1vvt4am">작성자 : ${board.nickname }</div>
 							</div>
 					</div>
 				</a>
 			</li>
 		</c:forEach>
 		</ul>
 	</div>
 </div>
  
        <br>
<div class="text-center">
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item paginate_button previous">
				<a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
			</li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
		<li class="page-item paginate_button  ${pageMaker.vo.pageNum == num ? "active":""} ">
				<a class="page-link" href="${num}">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="page-item paginate_button next">
				<a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
			</li>
		</c:if>
	</ul>
</div>

<form id='pageForm' action="getBoardList.do?num=${boardnum}" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.vo.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.vo.amount}'>
	<input type='hidden' name= 'boardnum' value='${boardnum}'> 

	<input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.vo.searchCondition }"/>'> 
	<input type='hidden' name='searchKeyword'	value='<c:out value="${ pageMaker.vo.searchKeyword }"/>'>
</form>

<script>
	$(function(){
		$(".paginate_button a").on("click",
			function(e) {
				e.preventDefault();
//				console.log('click');
				$("#pageForm").find("input[name='pageNum']").val($(this).attr("href"));
				$("#pageForm").submit();
			}
		);
	});
</script>
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


  
   <script src="<c:url value="/resources/assets/js/main.js"/>"></script>
        
           <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script type="text/javascript" src="<c:url value="/resources/main.js"/>"></script>
</body>
</html>