<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegForm</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">
 <style>
* {
	margin: 0;
	padding: 0;
}

#header {
	padding: 15px 20px;
}

#nav {
	border-bottom: 1px solid #DDD;
	border-top: 1px solid #DDD;
	overflow: hidden;
	list-style: none;
}

#nav>li {
	float: left;
	padding: 5px 20px;
}

footer {
	text-align: center;
	border: 1px solid #DDD;
	padding: 20px 0;
	margin-top: 10px;
}

#nav+div {
	padding : 25px;
}

.subtitle{
	padding : 15px 0;
}

hr {
	border : 0px;
	border-top:thin solid #ddd;
	margin : 15px 0;
}

table.table td {
	padding : 5px;
}

input[type=text], input[type=password], intpu[type=email] {
	padding : 3px;
}
</style>


</head>

<body>
	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<div>
		<h1 class="subtilte">회원 가입</h1>
	</div>
	<hr>
  	<form action="login.jsp" method="post" id="loginForm">
  	<table>
  		<tr>
  			<td>아이디(이메일)</td>
  			<td> <input type="email" name="uid"> </td>
  		</tr>
  		<tr>
  			<td>비밀번호</td>
  			<td> <input type="password" name="upw"> </td>
  		</tr>
  		<tr>
  			<td>이름</td>
  			<td> <input type="text" name="uname"> </td>
  		</tr>
  		<tr>
  			<td>사진</td>
  			<td> <input type="file" name="photo"> </td>
  		</tr>
  		<tr>
  			<td></td>
  			<td> <input type="submit" value="회원가입" name="회원가입"> 
  			<input type="reset"> </td>
  		</tr>
  	</table>
       
    </form>
    
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	
</body>
</html>




