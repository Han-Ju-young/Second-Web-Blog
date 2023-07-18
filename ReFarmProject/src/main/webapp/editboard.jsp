<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
</style>
<title>게시 폼 작성</title>
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
		String headline = "등록";
		
		String id = request.getParameter("id");
		if (id != null) {
			//등록이 아닌 경우, 출력을 위해 선택한 게시의 각 필드 내용을 저장 
			BoardDAO brddb = new BoardDAO(); 
			BoardEntity brd = brddb.getBoard(id);
			passwd = brd.getPasswd();
			name = brd.getName();
			showcnt = brd.getShowcnt();
			title = brd.getTitle();
			content = brd.getContent();
			headline = "수정 삭제";
		} else {
			idIsNull = null;
			id = "";
		}
	%>

<h2 style="text-align: center">게시글 <%=headline %></h2> <hr>

<center>
<form name=boardform method=post action="processboard.jsp" >
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">

<table width=100% border=0 cellspacing=0 cellpadding=7>
 <tr><td align=center>

   <table border=0>
	<tr> <td colspan=2>
		<table>
		    <tr>
				<td width=80>아이디 : </td>
				<td><input type=text name=id size=20 value=<%= id %>></td>
			</tr>
			<tr>
		     <td width=50>이 름 : </td>
		     <td width=100>
				<input type=text name=name value="<%=name%>" size=30 maxlength=20></td>
		    </tr>	
			<tr >
		     <td width=50>제 목 : </td>
		     <td>
				<input type=text name=title size=50 value="<%=title%>" maxlength=100></td>
				<td>조회수 : <%= showcnt %></td>
			</tr>
		</table>
	</td> </tr>

    <tr><td colspan=2>
			<textarea name=content rows=10 cols=90><%=content%></textarea></td></tr>
	<tr>
     <td colspan=2>비밀번호 :
	     <input type=password name=passwd size=20 maxlength=15><font color=red>  
         	게시된 내용을 수정 또는 삭제하려면 이미 등록한 비밀번호가 필요합니다.</font></td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=2></td>
    </tr>
	<tr>
     <td colspan=2>
		<% if (idIsNull == null) { %>
		       	<!-- 버튼을 누르면 boardform.js의 함수를 실행하여 processboard.jsp로 이동 -->
		 		<input type=button value="등록" onClick="insertcheck()">
		<% } else { %>
		       	<!-- 버튼을 누르면 boardform.js의 각 함수를 실행하여 processboard.jsp로 이동 -->
		  		<input type=button value="수정완료" onClick="updatecheck()">
		    	<input type=button value="삭제" onClick="deletecheck()"> 
		<% } %>
		<!-- 목록보기 버튼은 listboard.jsp로 이동 -->
		<input type=button value="목록보기" onClick="location.href='listboard.jsp'"> 
      	<input type=reset value="취소"> 
	 </td>
    </tr> 
   </table>
  </td></tr>
</table>
</form>
</center>
</body>
</html>