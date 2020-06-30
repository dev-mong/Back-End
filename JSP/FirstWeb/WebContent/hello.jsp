<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Test</title>
</head>
<body>
	<h1>안녕하세요 JSP 응답 처리 된 페이지 입니다.</h1>
	<%
		Date now=new Date();
		String message="Hello~!!";
	%>
	
	<p>현재시간은 : <%= now %> </p>
	
	<h3><%= message %></h3>
	
</body>
</html>