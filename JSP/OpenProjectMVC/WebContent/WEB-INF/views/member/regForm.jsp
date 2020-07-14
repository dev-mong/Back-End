<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegForm</title>
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css"> --%>
<link rel="stylesheet" href="<c:url value="/css/default.css"/>">

</head>

<body>
	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<div>
		<h1 class="subtilte">회원 가입</h1>
	</div>
	<hr>
  	<form action="memberReg.do" method="post" id="loginForm" enctype="multipart/form-data">
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



