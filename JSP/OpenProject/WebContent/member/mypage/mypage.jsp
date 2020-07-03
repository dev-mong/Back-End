<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//member 객체 선언
	MemberInfo memberInfo=(MemberInfo) session.getAttribute("member");
	
	//session에 저장된 memeber 객체가 없을 때 -> 로그인 페이지로 이동
	if(memberInfo ==null){
%>
	<script>
		alert("로그인 후 이용해주세요");
		location.href="../loginForm.jsp"
	</script>
<% 
	} else{
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 check 결과</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/default.css">
</head>
<body>

	<%@ include file="/include/header.jsp" %>
	<h1>전송 결과</h1>
	
	<table border="1">

	<tr>
	<td>아이디</td>
	<td><%= memberInfo.getId()%></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><%= memberInfo.getPw() %></td>
	</tr>
	<tr>
	<td>로그인 저장 여부</td>
	<td>
	<%= memberInfo.getChk()%>
	 </td>
	</tr>

	</table>
	<br>
	
	<a href="../logout.jsp">로그아웃</a>
	
	
	<%@ include file="/include/footer.jsp" %>


</body>
</html>

<% } %>



