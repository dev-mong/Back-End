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
		<form id="regForm" action="memberdelete.do" method="post">
			
			<div class="info">
				<input type="hidden" name="idx" value="${member.idx}">
				<input type="text" name="uid" value="${member.uid}"> 회원 아이디 : ${member.uid}
				<input type="hidden" id="upw" value="${member.upw}">
				<input type="text" value="${member.uname}">회원 이름: ${member.uname}
			</div>
			
			<input type="submit" value="삭제하기" >
		</form>
		
		<input type="button" value="비밀번호 확인" id="check">
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
<script>
	
	
	$(document).ready(function(){
		$('#check').click(function(){
			var checkPw= prompt("비밀번호를 입력하세요.");
			var upw= $('#upw').val();
			
			if(checkPw == upw){
				alert("회원정보가 삭제되었습니다.");	
				$('#regForm').submit();
			}else{
				alert("비밀번호가 일치하지않습니다. 다시 입력해주세요.");
			}
			
		
		});
		
		
	});
	
		

</script>