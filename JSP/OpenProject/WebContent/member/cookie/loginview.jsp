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
<title>회원 로그인 정보</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/default.css">
</head>
<body>
	
	<%@ include file="/include/header.jsp" %>
	
	<h1>로그인 정보</h1>

 	<label>uid=<%= cookieBox.getValue("id") %></label> <br>
	<label>pw=<%= cookieBox.getValue("pw") %></label> <br>
	<label>chk=<%= cookieBox.getValue("chk") %></label>
	
	<br>
	<a href="../loginForm.jsp">메인으로 돌아가기</a>
	<a href="logindel.jsp">정보 삭제하기</a>
	<a href="loginedit.jsp">정보 수정하기</a>
	<%@ include file="/include/footer.jsp" %>
	 
	
</body>
</html>