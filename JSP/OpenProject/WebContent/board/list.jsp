<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		//session 데이터 가져오기
  		MemberInfo memberInfo= (MemberInfo)session.getAttribute("member");
   	
   		//memberInfo session 객체 여부 확인
   		if(memberInfo==null){
   		%>
   		<script>
   			alert("로그인 후 이용해주세요.");
   			location.href="../member/loginForm.jsp"
   		</script>
	<% 
   		}else{
   		
   %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/default.css">

</head>

<body>
	
	<%@ include file="/include/header.jsp" %>
	
	<div>
		<h1>게시판</h1>
	</div>
	
	<%@ include file="/include/footer.jsp" %>
	
	
</body>
</html>
<%
   		}
%>

