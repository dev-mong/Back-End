<%@page import="guestbook.service.DeleteMessageServie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pw = request.getParameter("pw");
	
	int mid = Integer.parseInt(request.getParameter("mid"));
	
	//DeleteMessageService -> dao 요청 
	//-> dao.selectMessage(mid)
	//-> dao.deleteMessage()
	
	DeleteMessageServie service = DeleteMessageServie.getInstanc();
	
	int resultCnt = service.deleteMessage(mid, pw);
	
	request.setAttribute("resultCode",resultCnt);
	
%>
<jsp:forward page="deleteMessage_view.jsp"/>