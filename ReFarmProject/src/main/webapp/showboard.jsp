<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
td {
	board
}
</style>
<title>게시글 정보</title>
</head>

<script language=JavaScript src="boardform.js"></script>

<body>
	<%@ page import="ReFarmProject.*, java.text.SimpleDateFormat, java.util.Date" %>
	<%
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String id = request.getParameter("id");
		BoardDAO brddb = new BoardDAO(); 
		BoardEntity brd = brddb.getBoard(id);
		String passwd = brd.getPasswd();
		String name = brd.getName();
		int showcnt = brd.getShowcnt()+1;
		String title = brd.getTitle();
		String content = brd.getContent();
		Date date = brd.getDate();
	%>

<h2 style="text-align: center">게시글 내용</h2>
<hr>
<center>
<form name=boardform method=post action="processboard.jsp" >
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
	
	<table width=800 border=0 cellpadding=1 cellspacing=3>
	<tr>
		<th style="width: 150px"><b>제목</b></th>
		<td><%= title %></td>
		<th style="width: 50px"><b>조회수</b></th>
    <td><%= showcnt %></td>
	</tr>
	<tr>
    	<th><b>작성자</b></th>
    <td><%= name %></td>
	</tr>
	<tr>
    	<th><b>작성일</b></th>
    <td><%= df.format(date) %></td>
	</tr>
	<tr>
    	<th><b>내용</b></th>
    <td><%= content %></td>
	</tr>
	
	</table>
	<div style="text-align: center">
	<br>
	<input type=button value="수정하기" onClick="location.href='editboard.jsp?id=<%= id %>'">
		<input type=button value="삭제하기" onClick="location.href='editboard.jsp?id=<%= id %>'"> 
		<input type=button value="목록보기" onClick="location.href='listboard.jsp'">
		</div>
	</div>


</form>
</center>
</body>