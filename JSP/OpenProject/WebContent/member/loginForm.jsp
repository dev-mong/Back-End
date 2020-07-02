<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
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
	
  <form action="cookie/login.jsp" method="post" id="loginForm">
        <table id="table">
            <tr>
                <td>아이디(이메일)</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pw"></td>
            </tr>
            <tr>
                <td></td>
                <td> <input id="btn_submit" type="submit" value="로그인">
                	<input type="checkbox" name="chk" value="check">아이디 저장
                </td>
            </tr>

        </table>
    </form>
	
	<%@ include file="/include/footer.jsp" %>
	
	
</body>
</html>




