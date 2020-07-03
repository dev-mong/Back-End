<%@ page import="studyutil.CookieBox" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookieBox cookieBox =new CookieBox(request);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 전송 결과</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/default.css">
</head>
<body>

	<%@ include file="/include/header.jsp" %>
	<h1>전송 결과</h1>
	
	<table border="1">

	<tr>
	<td>아이디</td>
	<td><%= request.getParameter("id") %></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><%= request.getParameter("pw") %></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><%= request.getParameter("chk") %></td>
	</tr>

	</table>
	
	 <%
	 	String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String chk=request.getParameter("chk");
		
		response.addCookie(CookieBox.createCookie("id", id));
		response.addCookie(CookieBox.createCookie("pw", pw));
		response.addCookie(CookieBox.createCookie("chk", chk));
	 %>
	 
	<a href="logindel.jsp">정보 삭제하기</a>
	<a href="loginedit.jsp">정보 수정하기</a>
	
	<%@ include file="/include/footer.jsp" %>


</body>
</html>