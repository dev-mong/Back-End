<%@page import="service.EmpListService"%>
<%@page import="dao.EmpDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="model.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp DB</title>
<style>
	table{
		width: 80%;
	}
	table>td{
		padding 10px;		
		text-align: center;
	}
</style>

</head>
<body>

<%
	
	//Connection conn=null;
	List<Emp> empList=null;

//	conn=ConnectionProvider.getConnection();
		
	//싱글톤 패턴을 이용해서 객체를 참조한 후 conn객체를 매개변수로 보냄
	//empList=EmpDao.getInstance().getEmpList(conn);
	
	//empList는 서비스 패키지에서 리스트 가져오기  
	empList=EmpListService.getInstance().getEmpList();
	
	request.setAttribute("empList", empList);
	
%>
	
	<jsp:forward page="empList_view.jsp"/>
	

</body>
</html>