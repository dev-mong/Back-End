<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>과제 제출</h1>
<form action="upload02.jsp" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="uname"> <br>
	학번 : <input type="text" name="sno"><br>
	과제 파일 : <input type="file" name="report">
	<input type="submit" value="제출">
		
	</form>

</body>
</html>