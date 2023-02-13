<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>#리뷰어스-자유게시판</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	

	<!-- 좋아요 버튼 -->
	<link rel="stylesheet" href="<c:url value="/resources/assets/css/likebutton.css"/>">
	
<style>
      
      table{
      width:80%;
      }
      
      .topbar{
      	line-height: 45px;
      	background-color:snow;
      	border-bottom:1px solid gray;
      	width: 100%;
      	height: 40px;
      	display: flex; 
      	justify-content:space-between;
      	font-weight: bold;
      	font-size: large;
      	
      }
      
      .topbar .barleft{
      	display: flex; 
      	text-align: left;
      	justify-content: left;
      	margin-left:40px;
      }
      
      .topbar .barcenter{
      	display: flex; 
      	text-align: center;
      	justify-content: center;
      }
      
      .topbar .barright{
      	display: flex; 
      	text-align: right;
      	justify-content: right;
      	margin-right:40px;
      }
      
      .topbar_link{
      	text-align:right;
      	margin-right:150px;
      	display: flex;
      	justify-content: space-between;
      }
      
      .content-section{
      	font-size:50px;
      	width:90%;
      	height:700px;
      	background-color: white;
      	box-sizing:border-box;
      	display:block;
      	padding:40px;
      }
      
      .title{
      	font-size:x-large;
      	font-weight: bold;
      	color:coral;
      	padding:20px;
      }
      .content{
      	padding:60px;
      }
      .topbar_link .like{
      	padding:20px;
      }
      
   </style>
  
</head>

<body>
          
   
   
    <main id="main" class="main">
    	
    	
    	<div class="content-section">
    	<div class="topbar">
    		<div class="barleft">작성자: ${board.nickname }</div>
    		<div class="barcenter">${board.writedate }</div>
    		<div class="barright">좋아요: ${board.like_num }&nbsp&nbsp조회수: ${board.cnt} </div>
    	</div>
    		<div class="title">${board.title }</div>
    	<div class="content">
    		${board.content }
    	</div>
    	</div>
    	
   	<div class="topbar_link">
   		<div class="like">
    		<div class="heart"></div>
    		<div class="animation-heart"></div>    
    	</div>
   		<div style="margin-top:10px;">
   		<button onClick="location.href='getBoardList.do?boardbum=4'" class="custom-btn btn-1">목록</button>
   		<button onClick="#" class="custom-btn btn-1">댓글</button>
   			
   		</div>
   	</div>
    </main>

<c:import url="footer.jsp"></c:import>
   
   <!-- 좋아요 버튼 -->
   <script src="<c:url value="/resources/assets/js/likebutton.js"/>"></script>
</body>
</html>