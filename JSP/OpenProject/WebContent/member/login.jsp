<%@page import="member.MemberInfo"%>
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

	
	 //로그인 아이디 비밀번호 체크
	 boolean loginCheck=false;
	 if(id.equals(pw)){
		 
		 //sessin에 객체 형태로 저장 
		 session.setAttribute("member",new MemberInfo(id,pw));
	 	
		 loginCheck=true;
	 }
	
 %>
<% 
	//로그인 성공 시 html 처리 
	if (loginCheck){ 
	response.sendRedirect("mypage/mypage.jsp");
%>
<%-- <!DOCTYPE html>
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
</html> --%>
<%
	}else{
%>
	<script>
		alert("아이디와 비밀번호를 확인하세요");
		// 이전 페이지로 이동 
		history.go(-1); 
	</script>
<%
	}
%>