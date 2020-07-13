<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css">
<style>
* {
	margin: 0;
	padding: 0;
}

#header {
	padding: 15px 10px;
}

#nav {
	border-bottom: 1px solid #DDD;
	border-top: 1px solid #DDD;
	overflow: hidden;
	list-style: none;
}

#nav>li {
	float: left;
	padding: 5px 20px;
}

footer {
	text-align: center;
	border: 1px solid #DDD;
	padding: 20px 0;
	margin-top: 10px;
}
</style>
</head>

<body>
	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<div>
		<h1>index</h1>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	
</body>
</html>




