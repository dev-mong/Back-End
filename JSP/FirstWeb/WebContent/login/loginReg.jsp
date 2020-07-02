<%@page import="org.apache.coyote.RequestInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="requestInfo" class="model.RequestMemberInfo" scope="page"/>
<jsp:setProperty property="*" name="requestInfo"/>

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
		<td><%--= request.getParameter("id") --%>
			<%= requestInfo.getId() %>
		</td>
	</tr>
	<tr>
	<td>비밀번호</td>
		<td><%--= request.getParameter("pw") --%>
			<%= requestInfo.getPw() %>
		</td>
	</tr>
		<tr>
	<td>이름</td>
		<td><%--= request.getParameter("userName") --%>
			<%= requestInfo.getUserName() %>
		</td>
	</tr>
	
<%-- <tr>
	<td>사진</td>
	<td>= request.getParameter("userPhoto")</td>
	</tr> --%>
	
	</table>
	
</body>
</html>