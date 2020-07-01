<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 전송 결과</title>
</head>
<body>
	
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
	<td>이름</td>
	<td><%= request.getParameter("userName") %></td>
	</tr>
	<tr>
	<td>사진</td>
	<td><%= request.getParameter("userPhoto") %></td>
	</tr>
	
	</table>
	
</body>
</html>