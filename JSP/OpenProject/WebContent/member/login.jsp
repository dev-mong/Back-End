<%@page import="member.MemberInfo"%>
<%@ page import="studyutil.CookieBox" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 
 	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String chk=request.getParameter("chk");

	String url=request.getParameter("referer");
	
	String cookieName=id; //cookieValue  
	String cookiePath=request.getContextPath();
	
	
	 //로그인 아이디 비밀번호 체크
	 boolean loginCheck=false;
	 if(id.equals(pw)){
		 
		 //sessin에 객체 형태로 저장 
		 session.setAttribute("member",new MemberInfo(id,pw,chk));
	 	
		 loginCheck=true;
	 }
	
 %>
<% 
	//로그인 성공 시 마이페이지로 이동
	if (loginCheck){ 
		
	if(chk !=null){
		response.addCookie(CookieBox.createCookie("id", cookieName, cookiePath,60*60*24*365));

	}else{
		//cookie 삭제
		response.addCookie(CookieBox.createCookie("id", id, request.getContextPath(),0));
	}

	/* response.sendRedirect(url);	 */
	 response.sendRedirect("mypage/mypage.jsp"); 
%>
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