<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="ReFarmProject.MemberDAO"%>
<%@ page import="ReFarmProject.MemberBean"%>
<html>
<head>
<%
String id = session.getAttribute("sessionID").toString();

MemberDAO dao = new MemberDAO();
MemberBean memberBean = dao.getUserInfo(id);
%>

<title>ȸ������ ����</title>

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
    
        function init(){
            setComboValue("<%=memberBean.getMail2()%>
	");
	}

	function setComboValue(val) {
		var selectMail = document.getElementById('mail2'); // select ���̵� �����´�.
		for (i = 0, j = selectMail.length; i < j; i++) // select �ϴ� option ����ŭ �ݺ��� ������.
		{
			if (selectMail.options[i].value == val) // �ԷµȰ��� option�� value�� ������ ��
			{
				selectMail.options[i].selected = true; // ��������� üũ�ǵ��� �Ѵ�.
				break;
			}
		}
	}

	// ��й�ȣ �Է¿��� üũ
	function checkValue() {
		if (!document.userInfo.password.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
	}
</script>

</head>
<body onload="init()">

	<br>
	<br>
	<b><font size="6" color="gray">ȸ������ ����</font></b>
	<br>
	<br>
	<br>

	<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
	<!-- ��(�Ķ����) ������ POST ��� -->
	<form method="get" action="ModifyPro.jsp" name="userInfo" onsubmit="return checkValue()">

		<table>
			<tr>
				<td id="title">���̵�</td>
				<td id="title"><%=memberBean.getId()%></td>
			</tr>
			<tr>
				<td id="title">��й�ȣ</td>
				<td><input type="password" name="password" maxlength="50" value="<%=memberBean.getPassword()%>"></td>
			</tr>
		</table>
		<br> <br>
		<table>

			<tr>
				<td id="title">�̸�</td>
				<td><%=memberBean.getName()%></td>
			</tr>

			<tr>
				<td id="title">����</td>
				<td><%=memberBean.getGender()%></td>
			</tr>

			<tr>
				<td id="title">����</td>
				<td><%=memberBean.getBirthyy()%>�� <%=memberBean.getBirthmm()%>�� <%=memberBean.getBirthdd()%>��</td>
			</tr>

			<tr>
				<td id="title">�̸���</td>
				<td><input type="text" name="mail1" maxlength="50" value="<%=memberBean.getMail1()%>"> @ <select name="mail2" id="mail2">
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
				</select></td>
			</tr>

			<tr>
				<td id="title">�޴���ȭ</td>
				<td><input type="text" name="phone" value="<%=memberBean.getPhone()%>" /></td>
			</tr>
			<tr>
				<td id="title">�ּ�</td>
				<td><input type="text" size="50" name="address" value="<%=memberBean.getAddress()%>" /></td>
			</tr>
		</table>
		<br> <br> 
		<input type="submit" value="����" onClick="alert('ȸ�������� �����Ǿ����ϴ�.')" />
		<input type="button" value="���" onclick="location.href='UserInfoForm.jsp'"> 
	</form>
</body>
</html>