<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 배열 참조 -->
	<h1>교재 리스트</h1>
	<ul>
		<!-- forward 속성을 이용해서 다른 페이지로 넘어와도 request는 공유된다 -->
		<li>${requestScope.bookNames[0]}</li>
		<li>${requestScope.bookNames[1]}</li>
		<li>${bookNames[2]}</li>
	</ul>

	
	<!-- list 참조 -->
	<h1>학습 순서 (List)</h1>
	<ul>
		<li>${requestScope.study[0]}</li>
		<li>${requestScope.study[1]}</li>
		<li>${study[2]}</li>
		<li>${study[3]}</li>
	</ul>
	
	<!-- Map : key 값을 이용해서 출력-->
	<h1>학생정보 (Map)</h1>
	<ul>
		<li>전공 : ${requestScope.student.dept}</li>
		<li>이름 : ${student.name}</li>
		<li>전화번호 : ${student.phoneNumber}</li>
	</ul>
	
</body>
</html>