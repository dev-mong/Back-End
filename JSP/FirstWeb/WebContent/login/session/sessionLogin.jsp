<%@page import="model.MemberInfo"%>
<%@page import="org.apache.catalina.tribes.membership.MemberImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 처리
	// 아이디의 값과 비밀번호의 값 문자열을 비교해서 같으면 로그인 처리
	
	//1.아이디, 비밀번호 데이터를 받는다
	String uid=request.getParameter("uid");
	String pw=request.getParameter("pw");
	
	//2.로그인을 위한 비교 : 아이디, 비밀번호 문자열 비교
	boolean loginChk=false;
	
	if(uid.equals(pw)){
		//3.로그인 처리 : 세션 속성에 사용자 정보를 저장
		/* session.setAttribute("memberId", uid); */
	
		//session에객체 저장
		session.setAttribute("memberInfo", new MemberInfo(uid,pw)); 

		loginChk=true;
	}
	

%>
<%
	//4.응답 처리 : html 로그인 처리 일때와 로그인이 되지 않았을 때 
	if(loginChk){
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login check</title>
</head>
<body>
	<h1>로그인이 되었습니다.</h1>
	<h2>id : <%=uid %> pw : <%= pw %></h2>
	<a href="mypage.jsp">My Page</a>
	<a href="logout.jsp">Logout</a>
</body>
</html>
<%
	}else{
%>
<script>
	alert("아이디와 비밀번호를 확인해주세요");
	history.go(-1); //이전 페이지로 돌아감, 양수1 = forward 처리
</script>
<%
	}
%>


