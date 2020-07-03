<%@page import="member.MemberInfo"%>
<%@page import="studyutil.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* 쿠키 */
	CookieBox cookieBox = new CookieBox(request);
	String cookieId = cookieBox.getValue("id");
	
	String idValue="";
	String checked="";
	
	if(cookieId!=null){
		idValue=cookieId;
		checked="checked";
	}
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/default.css">

</head>

<body>
	
	<%@ include file="/include/header.jsp" %>
	
	<div>
		<h1>로그인</h1>
	</div>
	
  <form action="login.jsp" method="post" id="loginForm">
        <table id="table">
            <tr>
                <td>아이디(이메일)</td>
                <td><input type="text" name="id" value=<%= idValue %>></td> 
             
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pw"></td>
            </tr>
            <tr>
            	<td></td>
            	<td><input type="checkbox" name="chk" value="check" <%= checked %>>아이디 저장</td>
            </tr>
            
            <tr>
                <td></td>
                <td> <input id="btn_submit" type="submit" value="로그인">
                </td>
            </tr>

        </table>
    </form>
	
	<%@ include file="/include/footer.jsp" %>
	
	
</body>
</html>




