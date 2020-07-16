<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/default.css"/>">
<style>
	img{
		width: 100px;
		height: 100px;
	}
	#uidim{
		color:red;
	}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
		
		
		<div>
		<h1 class="subtitle">수정 관리 페이지 </h1>
		<hr>
		<form id="regForm" action="memberUpdate.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>아이디(email)</td>
					<td> <input type="email" name="uid" id="uid" value="${member.uid}" readonly>
						<span id="uidim">아이디는 변경이 불가능합니다.</span>
					 </td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td> <input type="password" name="upw" value="${member.upw}" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td> <input type="text" name="uname" value="${member.uname}" required></td>
				</tr>
				<tr>
					<td>사진</td>
					<td> <img src="<c:url value="${member.uphoto}" />"/>
					
					<input type="file" name="photo"></td>
				</tr>
				<tr>
					<td></td>
					<td> 
						<input type="submit" name="회원가입">
						<input type="reset">
					</td>
				</tr>
			</table>
		</form>
	</div>
		
		
		
	<%@ include file="/WEB-INF/views/include/footer.jsp"%> 
</body>
</html>