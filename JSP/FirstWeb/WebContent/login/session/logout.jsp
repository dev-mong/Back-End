<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//session 종료 
 	session.invalidate();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<h1>로그아웃 되었습니다.</h1>
	<a href="mypage.jsp">My Page</a>
	<a href="logout.jsp">Logout</a>
	
</body>
</html>