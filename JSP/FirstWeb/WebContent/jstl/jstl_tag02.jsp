<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tag</title>
</head>
<body>

 	<select name="year">
 		<c:forEach  var="year" begin="1950" end="2020" step="1">
 			<option value="${year}" ${param.year=='year' ? 'selected':''} >${year}</option>
 		</c:forEach>
 	</select>

	<c:forTokens items="손흥민, 010-0000-0000, 런던" delims="," var="token">
		${token} <br>
	</c:forTokens> 	
	
	<h1>
		url : <c:url value="/index.jsp" /><br>
		<a href="<c:url value="/index.jsp" />">홈</a>
		
	</h1>
	
	
</body>
</html>