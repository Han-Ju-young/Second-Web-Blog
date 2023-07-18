<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>
<style>
#pageBlock {
	text-align: center;
}
tr {
	height: 50px;
}

#loading {
   width: 100vw;
   height: 40vw;
   top: 0;
   left: 0;
   position: fixed;
   display: block;
   opacity: 0.7;
   background-color: #fff;
   z-index: 99;
   text-align: center;
}
#loading-image {
  position: absolute;
  z-index: 100;
  width:80vw; 
  height: 40vw; 
  margin-left:-40vw;
}
#contents{
  height: 650px;
}
</style>
<jsp:include page="Header.jsp">

<jsp:param name="menuval" value="list" />

</jsp:include>
</head>
<body>
<script type="text/javascript">
    function loading_st() {
    	layer_str = "<div style='width: 100%; height: 500px; line-height: 500px; margin-top: 50px;' id='loading'>"
    	+"<strong style=''>로딩중입니다...</strong>"+
    	"<img style='width: 250px; height: 250px' id='loading-image' src='https://i.gifer.com/8oNq.gif'/>"
    	+"</div>";
        document.write(layer_str);
    }
    function loading_ed() {
        var ta = document.getElementById('loading');
        ta.style.display = 'none';
    }
    loading_st();
    window.onload = loading_ed;
</script>
<%@ page import="java.util.ArrayList, ReFarmProject.BoardEntity, ReFarmProject.BoardDAO, java.text.SimpleDateFormat" %>
	
<%
BoardDAO bdao = new BoardDAO();
int cnt = 0;

String type = request.getParameter("type");
String keyword = request.getParameter("keyword");
boolean isSearch = type != null && keyword != null;

int pageSize = 10; 
String pageNum = request.getParameter("pageNum");
if(pageNum == null){ 
	pageNum ="1";
}

int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize + 1;

int endRow= currentPage * pageSize;

ArrayList<BoardEntity> boardList = null;


if(isSearch){
	boardList = bdao.getSearch(startRow, pageSize, type, keyword); 
	cnt = bdao.getCount(type, keyword);
}
else{
	boardList = bdao.getBoardList(startRow, pageSize);
	cnt = bdao.getBoardCount();
}

%>
<fieldset>
<h2 style="text-align: center">게시판 글 목록</h2>
<hr>
<center>
	<div id="contents">
	<br>
    <div class="container">
	<form action="listboard.jsp" method="get">
        <!-- 검색분류 -->
        <select name="type">
        <%
        	String typeval = "";
        	if(type == null) {
        		typeval = "제목";
        	} else if(type.equals("name")) {
        		typeval = "작성자";
        	} else {
        		typeval = "제목";
        	}
        %>
        	<option value="<%=typeval %>"><%=typeval %></option>
            <option value="title">제목</option>
            <option value="name">작성자</option>
        </select>

        <!-- 검색어 -->
        <% if(isSearch){ %>
            <input type="text" name="keyword" value='<%=keyword%>' required>
        <% } else { %>
            <input type="text" name="keyword" required>
        <% } %>

        <!-- 전송버튼 -->
        <input type="submit" value="검색">
		<input id="writebtn" type="button" value="글쓰기" onclick="location.href='editboard.jsp'">
    </form>
	</div>
	
	<br>
	<table width=800 border=0 cellpadding=1 cellspacing=3>
	<tr>
		<th><font color=blue><b>번호</b></font></th>
    	<th style="width: 150px"><font color=blue><b>제목</b></font></th>
    	<th><font color=blue><b>작성자</b></font></th>
    	<th><font color=blue><b>작성일</b></font></th>
    	<th><font color=blue><b>조회수</b></font></th>
	</tr>
	<%
	int row = 0;
	int boardItemNum = 1;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	for(int i=0;i<boardList.size(); i++){
		BoardEntity bb = (BoardEntity) boardList.get(i);
		String color = "lightgray";
		if ( ++row % 2 == 0 ) color = "white"; 
	%>
	<tr bgcolor=<%=color %> 
		onmouseover="this.style.backgroundColor='#a8d6ff'"
    	onmouseout="this.style.backgroundColor='<%=color %>'">
    	
		<td align=center><a href="showboard.jsp?id=<%= bb.getId()%>"><%= boardItemNum %></a></td>
		<td align=center><%= bb.getTitle() %></td>		
       	<td align=center><%= bb.getName() %></td>
       	<td align=center><%= df.format(bb.getDate()) %></td>
       	<td align=center><%= bb.getShowcnt() %></td>
	</tr>
	<%
		boardItemNum += 1;
    }
	%>
	</table>
	</div>
</fieldset>
<%

if(cnt != 0){
	int pageCount = cnt/pageSize + (cnt%pageSize == 0? 0:1);
	
	int pageBlock = 3;
	
	int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
	
	int endPage = startPage + pageBlock - 1;
	if(endPage > pageCount){
		endPage = pageCount;
	}
%>
	<div id="pageBlock">
	<img style="width: 60px; height: 60px" src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif"/>
<%
	if(startPage > pageBlock){
%>
		<a href="listboard.jsp?pageNum=<%=startPage-pageBlock%>">   이전   </a>
<%
	}
	
	for(int i=startPage; i<=endPage; i++){
%>
		<a href ="listboard.jsp?pageNum=<%=i%>">   <%=i%>   </a>
<%
	}
	if(endPage < pageCount){
%>
		<a href ="listboard.jsp?pageNum=<%=startPage+pageBlock%>">   다음   </a>
<%
	}
%>
<img style="width: 60px; height: 60px" src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif"/>

</div>
<%
}
%>
</center>
<br><br>
<jsp:include page="Footer.jsp" />
</body>
</html>