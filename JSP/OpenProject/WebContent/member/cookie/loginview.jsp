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
<title>회원 로그인 전송 결과</title>
</head>
<body>

	<h1>전송 결과</h1>
	
<%-- 	<table border="1">

	<tr>
	<td>아이디</td>
	<td><%= request.getParameter("id") %></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><%= request.getParameter("pw") %></td>
	</tr>

	</table>
	 --%>
	 
<%-- 	 <%
	 	String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String chk=request.getParameter("chk");
		
		response.addCookie(CookieBox.createCookie("id", id));
		response.addCookie(CookieBox.createCookie("pw", pw));
		response.addCookie(CookieBox.createCookie("chk", chk));
	 %> --%>
	 
 	<label>uid=<%= cookieBox.getValue("id") %></label> <br>
	<label>pw=<%= cookieBox.getValue("pw") %></label> <br>
	<label>chk=<%= cookieBox.getValue("chk") %></label>
	
	<br>
	<a href="../loginForm.jsp">메인으로 돌아가기</a>
	<a href="logindel.jsp">정보 삭제하기</a>
	<a href="loginedit.jsp">정보 수정하기</a>

	 
	
</body>
</html>