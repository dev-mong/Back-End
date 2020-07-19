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
		<form id="regForm" method="post" enctype="multipart/form-data">
			
			<div class="info">
				<input type="hidden" id="idx" value="${member.idx}">
				<input type="text" id="uid" value="${member.uid}"> 회원 아이디 : ${member.uid}
				<input type="hidden" id="upw" value="${member.upw}">
				<input type="text" id="uid" value="${member.uname}">회원 이름: ${member.uname}
			</div>
			
			<input type="submit" value="삭제하기">
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
				
				$.ajax({
					type: 'post',
					url : 'memberdelete.do',
					data : {
						idx : $('#idx').val()
					},
					sucess:function(data){
						console.log(12313131312312);
					}
					
					
					
				});
				
				
			}
			
		
		});
		
		
	});
	
		

</script>