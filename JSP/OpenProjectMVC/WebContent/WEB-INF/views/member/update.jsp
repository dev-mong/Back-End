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

<style>
img {
	width: 100px;
	height: 100px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div>
		<h1 class="subtitle">수정 관리 페이지</h1>
		<hr>
		<form id="regForm" action="memberUpdate.do" method="post"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>아이디(email)</td>
					<td><span id="uidim"> : ${updateMember.uid}</span></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><span id="uidim">  : ${updateMember.upw}</span></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><span id="uidim">  : ${updateMember.upw}</span></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><img src="<c:url value="${updateMember.uphoto}"/>" />
					</td>

				</tr>
			</table>
		</form>
	</div>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>