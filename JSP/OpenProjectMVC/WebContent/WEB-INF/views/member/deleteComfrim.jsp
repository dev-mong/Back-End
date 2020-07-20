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
<style>
td {
	padding: 10px;
}

.error {
	color: red;
}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div>
		<h1 class="subtitle">삭제 관리 페이지</h1>

		<hr>
		<!-- memberdelete.do -->
		<form id="regForm" action="memberdelete.do" method="post">
			<table>
				<tr>
					<th>회원 아이디</th>
					<td><input type="hidden" name="idx" value="${member.idx}">${member.uid}</td>
				</tr>

				<tr>
					<th>회원 이름</th>
					<td><input type="hidden" id="upw" value="${member.upw}">${member.uname}</td>
				</tr>

			</table>

		</form>

		<div id="count"></div>

		<input type="button" value="회원 정보 삭제하기" id="check">

	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
<script>
		$('#check').click(function() {
				var html = '비밀번호 입력 : <input type="text" id="checkPw">';
				$('#count').append(html);

				var upw = $('#upw').val();
				var i = 1;

				$('#checkPw').keydown(function(key) {
					if (key.keyCode == 13) {
						var checkPw = $('#checkPw').val();
						if (checkPw == upw) {
							$('#regForm').submit();
						} else {
							$('.error').remove();
							var html = '<div class="error">(로그인 오류 '+ i+ '회) </div>'
									+ '<div class="error">3회 이상 로그인 오류 시 보안을 위해 계정이 제한됩니다.</div>';
							$('#count').append(html);
							
							if (i >= 3) {
								$('.error').remove();
								alert("비밀번호 입력 횟수를 초과했습니다. 메인으로 돌아갑니다.");
								location.href = '<c:url value="/member/memberList.do"/>';
							}
							
							i++;
						}
					}
				});
			});
</script>