<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="ReFarmProject.MemberDAO"%>
<%@ page import="ReFarmProject.MemberBean"%>
<html>
<head>
<title>������</title>

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
	function changeForm(val) {
		if (val == "-1") {
			location.href = "main.jsp";
		} else if (val == "0") {
			location.href = "ModifyForm.jsp";
		} else if (val == "1") {
			location.href = "DeleteForm.jsp";
		}
	}
</script>

</head>
<body>
	<%
	String id = session.getAttribute("sessionID").toString();

	// ���ǿ� ����� ���̵� �����ͼ�
	// �� ���̵� �ش��ϴ� ȸ�������� �����´�.
	MemberDAO dao = new MemberDAO();
	MemberBean memberBean = dao.getUserInfo(id);
	%>

	<br><br>
	<b><font size="6" color="gray">�� ����</font></b>
	<br><br>
	<!-- ������ ȸ�������� ����Ѵ�. -->
	<table>
		<tr>
			<td id="title">���̵�</td>
			<td><%=memberBean.getId()%></td>
		</tr>

		<tr>
			<td id="title">��й�ȣ</td>
			<td><%=memberBean.getPassword()%></td>
		</tr>

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
			<td><%=memberBean.getMail1()%>@ <%=memberBean.getMail2()%></td>
		</tr>

		<tr>
			<td id="title">�޴���ȭ</td>
			<td><%=memberBean.getPhone()%></td>
		</tr>
		<tr>
			<td id="title">�ּ�</td>
			<td><%=memberBean.getAddress()%></td>
		</tr>
	</table>

	<br>
	<input type="button" value="Ȩ����" onclick="changeForm(-1)">
	<input type="button" value="ȸ������ ����" onclick="changeForm(0)">
	<input type="button" value="ȸ��Ż��" onclick="changeForm(1)">
</body>
</html>
