<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


 <%@ include file="include/header.jsp"%>
 
 <div id="wrap">
 <%@ include file="include/news.jsp"%>
 <%@ include file="include/shopping.jsp"%>
</div>	



<jsp:forward page="include/footer.jsp"> 
		<jsp:param name="email" value="cool@"/> 
	<jsp:param name="tel" value="070-9999-9999"/>
</jsp:forward>


</body>
</html>