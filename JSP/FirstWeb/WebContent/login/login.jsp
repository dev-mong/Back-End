<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인 전송 결과</title>
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

	</table>
	
	
	
</body>
</html>