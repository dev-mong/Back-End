<%@ page import="studyutil.CookieBox" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String chk=request.getParameter("chk");
	
	String cookieName=id; //cookieValue  
	String cookiePath=request.getContextPath();
	
	if(chk !=null){
		response.addCookie(CookieBox.createCookie("id", cookieName, cookiePath,60*60*24*365));

	}else{
		//cookie 삭제
		response.addCookie(CookieBox.createCookie("id", id, request.getContextPath(),0));
	}
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
	<td><%= id %></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><%= pw %></td>
	</tr>
	<tr>
	<td>로그인 저장 여부</td>
	<td>
	<% 
		if(chk!=null){
			out.println("아이디를 저장합니다.");	
		}else{
			out.println("아이디를 저장하지 않습니다.");
		}
	 %>
	 </td>
	</tr>

	</table>
	<br>
	
	<a href="cookie/loginview.jsp">로그인 정보 확인하기</a>
	<a href="cookie/logineidt.jsp">로그인 정보 수정하기</a>
	<a href="cookie/logindel.jsp">로그인 정보 삭제하기</a>
	
	<%@ include file="/include/footer.jsp" %>


</body>
</html>