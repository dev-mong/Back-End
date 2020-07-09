<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메시지 목록</title>
<style>
table td {
	padding: 10px;
}

input, textarea {
	padding: 5px;
}

div.msg_box {
	width: 200px;
	border: 3px solid #333;
	margin: 5px;
	padding: 10px;
}

form {
	display: none;
}

.currentPage {
	font-size: 1.5em;
	font-weght: bold;
}
</style>

</head>
<body>

	<h3>방명록 글 쓰기</h3>
	<hr>

	<form action="messageWrite.jsp" method="post">
		<table>
			<tr>
				<td><label for="uname">이름</label></td>
				<td><input type="text" id="uname" name="uname" required></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호</label></td>
				<td><input type="password" name="pw" id="pw" required></td>
			</tr>
			<tr>
				<td><label for="message">메세지</label></td>
				<td><textarea name="message" id="message" rows="10" cols="20"
						required></textarea></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="글쓰기"> <input
					type="reset"></td>
			</tr>

		</table>

	</form>

	<hr>

	<%-- ${listView} --%>

	<c:if test="${not empty listView.messageList}">

		<c:forEach items="${listView.messageList}" var="message">

			<div class="msg_box">
				게시물 번호 ${message.mid} <br>
				 작성자 ${message.uname}<br> 
				 메세지 ${message.message}<br> 
				<a href="deleteMessageConfirm.jsp?mid=${message.mid}"> 삭제 </a>
			</div>

		</c:forEach>

	</c:if>


	<div class="paging">
		<c:if test="${listView.pageTotalCount > 0}">
			<c:forEach begin="1" end="${listView.pageTotalCount}" var="num">
				<a
					href="list.jsp?page=${num}" class="${listView.currentPageNumber eq num ? 'currentPage' : ''}">[
					${num} ]</a>
			</c:forEach>
		</c:if>
	</div>



</body>
</html>