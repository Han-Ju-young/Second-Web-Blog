<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
</style>
<title>�Խ� �� �ۼ�</title>
</head>

<script language=JavaScript src="boardform.js"></script>

<body>
	<%@ page import="ReFarmProject.*" %>
	<%
		String idIsNull = "";
		String passwd = ""; 
		String name = ""; 
		int showcnt = 0; 
		String title = "";
		String content = "";
		String headline = "���";
		
		String id = request.getParameter("id");
		if (id != null) {
			//����� �ƴ� ���, ����� ���� ������ �Խ��� �� �ʵ� ������ ���� 
			BoardDAO brddb = new BoardDAO(); 
			BoardEntity brd = brddb.getBoard(id);
			passwd = brd.getPasswd();
			name = brd.getName();
			showcnt = brd.getShowcnt();
			title = brd.getTitle();
			content = brd.getContent();
			headline = "���� ����";
		} else {
			idIsNull = null;
			id = "";
		}
	%>

<h2 style="text-align: center">�Խñ� <%=headline %></h2> <hr>

<center>
<form name=boardform method=post action="processboard.jsp" >
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">

<table width=100% border=0 cellspacing=0 cellpadding=7>
 <tr><td align=center>

   <table border=0>
	<tr> <td colspan=2>
		<table>
		    <tr>
				<td width=80>���̵� : </td>
				<td><input type=text name=id size=20 value=<%= id %>></td>
			</tr>
			<tr>
		     <td width=50>�� �� : </td>
		     <td width=100>
				<input type=text name=name value="<%=name%>" size=30 maxlength=20></td>
		    </tr>	
			<tr >
		     <td width=50>�� �� : </td>
		     <td>
				<input type=text name=title size=50 value="<%=title%>" maxlength=100></td>
				<td>��ȸ�� : <%= showcnt %></td>
			</tr>
		</table>
	</td> </tr>

    <tr><td colspan=2>
			<textarea name=content rows=10 cols=90><%=content%></textarea></td></tr>
	<tr>
     <td colspan=2>��й�ȣ :
	     <input type=password name=passwd size=20 maxlength=15><font color=red>  
         	�Խõ� ������ ���� �Ǵ� �����Ϸ��� �̹� ����� ��й�ȣ�� �ʿ��մϴ�.</font></td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=2></td>
    </tr>
	<tr>
     <td colspan=2>
		<% if (idIsNull == null) { %>
		       	<!-- ��ư�� ������ boardform.js�� �Լ��� �����Ͽ� processboard.jsp�� �̵� -->
		 		<input type=button value="���" onClick="insertcheck()">
		<% } else { %>
		       	<!-- ��ư�� ������ boardform.js�� �� �Լ��� �����Ͽ� processboard.jsp�� �̵� -->
		  		<input type=button value="�����Ϸ�" onClick="updatecheck()">
		    	<input type=button value="����" onClick="deletecheck()"> 
		<% } %>
		<!-- ��Ϻ��� ��ư�� listboard.jsp�� �̵� -->
		<input type=button value="��Ϻ���" onClick="location.href='listboard.jsp'"> 
      	<input type=reset value="���"> 
	 </td>
    </tr> 
   </table>
  </td></tr>
</table>
</form>
</center>
</body>
</html>