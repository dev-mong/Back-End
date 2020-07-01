<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 : session 객체를 소멸 시킴
	session.invalidate();

	response.sendRedirect("../index.jsp");
%>