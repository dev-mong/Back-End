<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setAttribute("price", 10000);
	request.setAttribute("now",new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tag</title>
</head>
<body>

 	<c:out value="jstl tag out -> 데이터를 출력합니다."/>
 	<br>
 	<c:out value="${members[7].email}" default="<i>이메일 없음</i>" escapeXml="false"/>
 	<br>
 	<c:out value="${members[8].email}" escapeXml="false">
 		<span style="color:red">이메일 없음</span>
 	</c:out>
 	
 	<c:if test="${members[8].email == null}">
		<span style="color:blue">이메일 없음</span>
 	</c:if>
 	
 	
 	
 	<c:forEach 
 				items="${applicationScope.members}" 
 				var="member" 
 				varStatus="status"
 	>
 	<h3>
 	
 	${status.index} ${status.count}
 	
 	이름 : ${member.name}, 이메일 : 
 	
 	<c:out value="${member.email}" escapeXml="false">
 		<span style="color:red">이메일 없음</span>
 	</c:out> 
 	
 	<c:if test="${member.email == null}">
	<span style="color:blue">이메일 없음</span>
 	</c:if>
 	
 	<c:if test="${empty member.email}">
		<span style="color:green">이메일 없음</span>
 	</c:if> 
 	
 	</h3>
 	</c:forEach>
 	
 	<h1>
 		<c:url value="jstl_tag02.jsp">
			url2:<c:param name="year" value="1999"></c:param>
		</c:url>
	<br>
		
		url3 : <c:url value="jstl_tag02.jsp?year=1999"/>
		
	<br>
	
		<c:url value="jstl_tag02.jsp?year=1999" var="reurl"/>
		url4 : ${reurl}
	</h1>
	
	<hr>	
	<%-- <c:redirect url="${reurl}" /> --%>
	
		
	<!-- fmt tag -->
	<%-- <c:set var="number" value="${reqeustScope.price}" /> --%>
	
	
	<fmt:formatNumber value="${price}"  type="percent" />
	
	<fmt:formatNumber value="${price}"  type="number" var="numberType"/>
	
	${numberType }
	
	<br>
	통화 : <fmt:formatNumber value="${price}" type="currency"/>
	<fmt:formatNumber value="${price}" type="currency" currencySymbol="$"/>
	
	<br>
	퍼센트 : <fmt:formatNumber 
				value="${price}" 
				type="percent"
				groupingUsed="false"
			/>

	<br>
	패턴 : <fmt:formatNumber value="${price}" pattern="000000.00" />
	<fmt:formatNumber value="${price}" pattern="0000,0000" />
	<hr>
	
	<h3>
	날짜 표현 <br>
	<fmt:formatDate value="${now}" /> <br>
	<fmt:formatDate value="${now}" type="date"/> <br>
	<fmt:formatDate value="${now}" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${now}" type="date" dateStyle="full"/> 
	
	<hr>
	시간 표현 <br>
	<fmt:formatDate value="${now}" type="time"/><br>
	<fmt:formatDate value="${now}" type="time" timeStyle="short"/><br>
	<fmt:formatDate value="${now}" type="time" timeStyle="full"/><br>
	
	<hr>
	날짜와 시간을 동시 표현 <br>
	<fmt:formatDate value="${now}" type="both"/><br>
	<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short"/><br>
	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br>

	<hr>
	날짜 포맷팅 <br>
	<fmt:formatDate value="${now}" pattern="yyyy.MM.dd H:mm:ss"/>
	</fmt:timeZone>
	
	
	<c:forEach var="id" items="<%= java.util.TimeZone.getAvailableIDs() %>">
	${id}<br/>
	</c:forEach>

	</h3>


</body>
</html>