<%@ page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	MemberInfo memberCheck=(MemberInfo)session.getAttribute("member");
	String loginCheck="";
	String location="";

	if(memberCheck==null){
		loginCheck="로그인";	
		location="loginForm.jsp";
	}else{
		loginCheck="로그아웃";
		location="logout.jsp";
	}
%>
	
<h1 id="header">Open Project</h1>
<ul id="nav">
	<li><a href="<%= request.getContextPath() %>/member/memberRegForm.jsp">회원가입</a></li>
	<li><a href="<%= request.getContextPath() %>/member/<%= location %>"><%= loginCheck %></a></li>
	<li><a href="<%= request.getContextPath() %>/member/mypage/mypage.jsp">마이페이지</a></li>
	<li><a href="<%= request.getContextPath() %>/guestbook/guest.jsp">방명록(비회원)</a></li>
	<li><a href="<%= request.getContextPath() %>/board/list.jsp">방명록(회원제)</a></li>
</ul>