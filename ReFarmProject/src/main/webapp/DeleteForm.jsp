<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Ż�� ȭ��</title>

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
	// ��й�ȣ ���Է½� ���â
	function checkValue() {
		if (!document.deleteform.password.value) {
			alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
			return false;
		}
	}
</script>

</head>
<body>
	<br>
	<br>
	<b><font size="6" color="gray">ȸ��Ż�� ���Ͻø� ��й�ȣ�� �Է����ּ���</font></b>
	<br>
	<br>
	<br>

	<form name="deleteform" method="post" action="DeletePro.jsp" onsubmit="return checkValue()">

		<table>
			<tr>
				<td bgcolor="skyblue">��й�ȣ</td>
				<td><input type="password" name="password" maxlength="50"></td>
			</tr>
		</table>

		<br> <input type="submit" value="Ż��" /> <input type="button" value="���" onclick="location.href='UserInfoForm.jsp'">
	</form>
</body>
</html>
