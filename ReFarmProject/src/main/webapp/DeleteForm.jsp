<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>탈퇴 화면</title>

<style type="text/css">
body {
	text-align: center;
}
table {
	margin: auto;
	border: 3px solid skyblue;
}
td {
	border: 1px solid skyblue
}
#title {
	background-color: skyblue
}
</style>

<script type="text/javascript">
	// 비밀번호 미입력시 경고창
	function checkValue() {
		if (!document.deleteform.password.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>

</head>
<body>
	<br>
	<br>
	<b><font size="6" color="gray">회원탈퇴를 원하시면 비밀번호를 입력해주세요</font></b>
	<br>
	<br>
	<br>

	<form name="deleteform" method="post" action="DeletePro.jsp" onsubmit="return checkValue()">

		<table>
			<tr>
				<td bgcolor="skyblue">비밀번호</td>
				<td><input type="password" name="password" maxlength="50"></td>
			</tr>
		</table>

		<br> <input type="submit" value="탈퇴" /> <input type="button" value="취소" onclick="location.href='UserInfoForm.jsp'">
	</form>
</body>
</html>
