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

  <title>#리뷰어스-관리자</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  
  <script type="text/javascript">
  
  $( document ).ready( function() {
	  
  	
	  
      $( '.slider' ).slick( {
        autoplay: true,
        autoplaySpeed: 5000,
        slidesToShow: 6,
        slidesToScroll: 3,
      } );
      $(function(){

    	    $("#check_all").click(function(){
					
    	        var chk = $(this).is(":checked");//.attr('checked');
    	      	var User = $(".UserId").is(":checked");
    	        if(chk) $(".UserId").prop('checked', true);

    	        else  $(".UserId").prop('checked', false);
				
    	    });
    	    $(".UserId").click(function(){
			
    	     //.attr('checked');
    	      	var chk = $(".UserId").is(":checked");
    	        if(chk) $("#check_all").prop('checked', false);

    	        else  $("#check_all").prop('checked', true);
				
    	    });
    	});
    } );
  
  </script>
  
  
  
  
  
   <main id="main" class="main" style="text-align: center;">
   <h1>신고된 전체 리뷰</h1>
<div id = "reportTable">
	
	<table class="table" >
	
  <thead>
  	 	
    <tr class = "table-secondary">
    	
      <th scope="col">신고된 게시글 번호</th>
      <th scope="col">신고된 아이디</th>
      <th scope="col">신고된 게시판</th>
      <th scope="col">신고 글</th>
      <th scope="col">신고 사유</th>
      <th scope="col">삭제 </th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items = "${boardList }" var = "list">
    <tr>
      <th scope="row">${list.RN }</th>
      <td>${list.targetID }</td>
      <input type ="hidden" value = "${list.tableNum }" id = "${list.tableNum }">
      <td id = "table${list.tableNum }">${list.value }</td>
      <td id = ${list.tableNum }><a href = "getBoard.do?bseq=${list.seq }">내용보기</a></td>
       <td><a href = "javascript:void(0);onclick:window.open('getReportDetail.do?seq=${list.seq }', '신고 상세정보', 
           'width=500, height=700, scrollbars=yes,resizable=no');">사유보기</a></td>
      <td><button id="mail-Check-Btn"><a href="updateReportReview.do?seq=${list.seq }&targetID=${list.targetID }">회원 제재</a></button></td>
    </tr>
    
    </c:forEach>
    
    
  </tbody>
</table>
<div class="text-center">
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item paginate_button previous">
				<a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
			</li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
			<li class="page-item paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
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
<form id='pageForm' action="getReviewReport.do" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

	<input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.cri.searchCondition }"/>'> 
	<input type='hidden' name='searchKeyword'	value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
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
          

             

   

          

             
            

         

      </div>
    </section>

  </main><!-- End #main -->
  
  
  
  <c:import url="footer.jsp"></c:import>

        

</body>
</html>
