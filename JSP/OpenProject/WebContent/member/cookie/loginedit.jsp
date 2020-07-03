<%@ page import="studyutil.CookieBox" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.addCookie(CookieBox.createCookie("id", "000", "/op/", -1));
	%>
	<h1>쿠키가 수정되었습니다.</h1>
	<a href="loginview.jsp">쿠키 확인하기</a>
</body>
</html>