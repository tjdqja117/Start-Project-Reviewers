<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="upload_ok.do" method="post" enctype="multipart/form-data">
      파일 선택 : <input type="file" name="file">
      <input type ="text" name = "UserId" id = "UserId">
      <input type="submit" value="전송">
   </form>
</body>
</html>