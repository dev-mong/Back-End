<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/default.css"/>">

</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1 class="subtitle">삭제 관리 페이지  </h1>
	
	<hr>
		<!-- memberdelete.do -->
		<form id="regForm" action="" method="post" enctype="multipart/form-data">
			
			<div class="info">
				<div>회원 아이디 : ${member.uid}</div>
				<div>회원 아이디 : ${member.upw}</div>
				<div>회원 아이디 : ${member.uname}</div>
			</div>
			<input type="submit" value="삭제하기">
		</form>
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
<script>
	
	
	$(document).ready(function(){
		$('#regForm').submit(function(){
			var upw=prompt("삭제하시려면 비밀번호를 입력하세요");
			
			/* var html="";
			html += "<input type="text" name="upw" value="+upw+">";
			$(this).append(html); */
		});
	});
	
		

</script>