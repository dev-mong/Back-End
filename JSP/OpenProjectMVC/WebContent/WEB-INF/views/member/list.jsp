<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트 페이지 </title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/default.css"/>">
<style>
	

	table{
		 border: 1px solid #444444;
		 border-collapse: collapse;
	}
	th, td{
		border: 1px solid #444444;
		padding: 10px;
		text-align: center;
	}
	img{
		width: 100px;
		height: 100px;
	}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<div >
	<c:if test="${not empty memberListView.memberList}">
	<h1 class="subtitle">회원 리스트</h1>
	<hr>
	<table>
	<tr>
		<th>no</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>사진</th>
		<th>날짜</th>
		<th>수정/삭제</th>
	</tr>

		<c:forEach var="member" items="${memberListView.memberList}">
			<tr>
				<td>${member.idx}</td>
				<td>${member.uid}</td>
				<td>${member.upw}</td>
				<td>${member.uname}</td>
				<td>
				<img src="<c:url value="${member.uphoto}"/>">
				</td>
				<td>${member.regdate}</td>
				<td><a href="<c:url value="/member/memberUpdateForm.do?index=${member.idx}" />">수정</a> 
				| <a href="<c:url value="/member/memberDeleteComfirm.do?index=${member.idx}" />">삭제</a></td>
			</tr>
		</c:forEach>
	
	</table>
	</c:if>
	<c:if test="${empty memberListView.memberList}">
		<h3>등록된 회원 정보가 없습니다.</h3>
	</c:if>
	
	
	<div class="paging">
		<c:if test="${memberListView.pageTotalCount > 0}">
			<c:forEach begin="1" end="${memberListView.pageTotalCount}" var="num">
				<a
					href="${pageContext.request.contextPath}/member/memberList.do?page=${num}" 
					<%-- class="${memberListView.currentPageNumber eq num ? 'currentPage' : ''}" --%>
					>[${num}]</a>
			</c:forEach>
		</c:if>
	</div> 
	
	
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%> 
</body>
</html>