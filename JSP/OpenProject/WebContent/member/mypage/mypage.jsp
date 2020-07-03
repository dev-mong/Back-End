<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//member 객체 선언
	MemberInfo memberInfo=(MemberInfo) session.getAttribute("member");
	
	//session에 저장된 memeber 객체가 없을 때 -> 로그인 페이지로 이동
	if(memberInfo==null){
%>
	<script>
		alert("로그인 후 이용해주세요");
		location.href="../loginForm.jsp"
	</script>
<% 
	}
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/default.css">

</head>

<body>
	
	<%@ include file="/include/header.jsp" %>
	
	<div>
		<h1>마이페이지</h1>
	</div>
	
	<a href="../logout.jsp">로그아웃</a>
	
	<%@ include file="/include/footer.jsp" %>
	
	
</body>
</html>




