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
	<h1>삭제 확인 페이지 입니다.</h1>
	${member }
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>