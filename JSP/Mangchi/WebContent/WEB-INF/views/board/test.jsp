<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	 	<c:forEach var="requestList" items="${requestWrtingList.requestWriting}" varStatus="status">

				    <p >${status.count} : ${status.index}
${requestList.req_loc} : <c:out value="${requestList}" /></p>

				</c:forEach>
	


	<script>


	</script>
</body>
</html>