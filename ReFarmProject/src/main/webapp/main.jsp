<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="ReFarmProject.WorkData"%>
<%@page import="ReFarmProject.Work"%>
<%@page import="ReFarmProject.ReFarmData"%>
<%@page import="ReFarmProject.ReFarm"%>
<%@page import="ReFarmProject.ReCountryData" %>
<%@page import="ReFarmProject.ReCountry" %>
<%@page import="ReFarmProject.TownData" %>
<%@page import="ReFarmProject.TownEntity" %>
<%@page import="java.util.List"%>
<%@ page import="java.util.ArrayList, ReFarmProject.BoardEntity, ReFarmProject.BoardDAO, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>홈 화면</title>

<jsp:include page="Header.jsp">
<jsp:param name="menuval" value="main" />
</jsp:include>

<style>
table {
	border-collapse: collapse;
}
#workT, #boardT, #townT {
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 50px;
	text-align: center;
}
div {
	text-align: center;
	margin-bottom: 20px;
}

img {
	width: 200px;
	height: 150px;
}
#t1, #t2 {
	display: inline-block;
	float: center;
	text-align: center;
}
#rth {
 	font-size: 25px;
 	border: none;
}
th {
	margin-bottom: 5px;
}
th, td {
    border-bottom: 1px solid black;
}
#t1 {
 	margin-right: 20px;
}
#t2 {
	margin-left: 20px;
}
hr {
	border: 3px solid black;
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
</style>
<script>
function FarmPage()  {
	window.location.href = "https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/list.do?townType=TOTY01&townTypeDet="
}
function CountryPage()  {
	window.location.href = "https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/list.do?townType=TOTY02&townTypeDet="
}
</script>
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
<img style="width: 100%; height: 300px" src="https://github.com/Han-Ju-young/Second-Web-Blog/assets/102006237/0bcf3a7c-118a-427e-b460-c977f06a31f9">

<div>
<p><strong style="font-size: 20px">
	<a href="work.jsp" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'">
	일자리 정보</a>
</strong></p>
<table id="workT" >
<tr>
	<th>기업 명</th>
	<th colspan="2">공고 정보</th>
	<th>등록/마감일</th>
	<th>지원하기</th>
</tr>
<%	
	List<Work> workList = WorkData.getWorkData();
	for(int i=0; i<5; i++){
		Work w = (Work) workList.get(i);
%>
<tr>
	<td style="width: 10%"><%= w.getTitle() %></td>
	<td style="width: 35%"><%= w.getWorkname() %></td>
	<td style="width: 35%"><%= w.getCareer() %></td>
	<td style="width: 10%"><%= w.getDay() %><br><%= w.getEndday() %></td>
	<td style="width: 10%"><button onclick='getWork()'>지원하기</button></td>
</tr>
<%
	}
%>
</table>
</div>

<hr>

<div>
<p><strong style="font-size: 20px">
	<a href="program.jsp" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'">
	귀농귀촌 체험 프로그램</a>
</strong></p>
<table id="t1">
<th id="rth" colspan="5"><a ref="program.jsp" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'">
	귀농형 프로그램 운영 마을</a></th>
<%
	String btxt = "";
	List<ReFarm> refarmlist = ReFarmData.getReFarmData();
	for(int i=0; i<3; i++){
		ReFarm rf = (ReFarm) refarmlist.get(i);
		if(rf.getState().equals("마감")) {
			btxt = "둘러보기";
		} else {
			btxt = "신청하기";
		}
%>
<tr>
	<td><img src=<%= rf.getImg() %> /></td>
	<td><%= rf.getTitle() %></td>
	<td><%= rf.getCountry() %></td>
	<td><%= rf.getState() %></td>
	<td><button onclick='FarmPage()'><%= btxt %></button></td>
</tr>
<%
	}
%>
</table>

<table id="t2">
<th id="rth" colspan="5"><a ref="program.jsp" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'">
	귀촌형 프로그램 운영 마을</a></th>
<%
	List<ReCountry> recountrylist = ReCountryData.getReCountryData();
	for(int i=0; i<3; i++){
		ReCountry rc = (ReCountry) recountrylist.get(i);
		if(rc.getState().equals("마감")) {
			btxt = "둘러보기";
		} else {
			btxt = "신청하기";
		}
%>
<tr>
	<td><img src=<%= rc.getImg() %> /></td>
	<td><%= rc.getTitle() %></td>
	<td><%= rc.getCountry() %></td>
	<td><%= rc.getState() %></td>
	<td><button onclick='CountryPage()'><%= btxt %></button></td>
</tr>
<%
	}
%>
</table>
</div>

<hr>

<div>
<p><strong style="font-size: 20px">
	<a href="town.jsp" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'">
	농어촌 체험마을 정보</a>
</strong></p>
<table id="townT" >
<tr>
	<th>체험마을명</th>
	<th>시도</th>
	<th>시군구</th>
	<th>체험프로그램명</th>
</tr>
<%	
	TownData town = new TownData();
	ArrayList townList = town.getTownList();
	for(int i=0; i<10; i++){
		TownEntity tt = (TownEntity) townList.get(i);
%>
<tr>
	<td style="width: 20%"><%= tt.getTown() %></td>
	<td style="width: 15%"><%= tt.getCity() %></td>
	<td style="width: 15%"><%= tt.getCountry() %></td>
	<td style="width: 45%"><%= tt.getInfo() %></td>
</tr>
<%
	}
%>
</table>
</div>

<hr>

<div>
	<p><strong style="font-size: 20px">
	<a href="listboard.jsp" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'">
	게시판</a>
</strong></p>
	<table id="boardT" width=97% border=1>
	<tr>
		<th><b>번호</b></th>
    	<th><b>제목</b></th>
    	<th><b>작성자</b></th>
    	<th><b>작성일</b></th>
    	<th><b>조회수</b></th>
	</tr>
	<%
	BoardDAO bdao = new BoardDAO();
	ArrayList boardList = bdao.getBoardList();
	int boardItemNum = 1;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	for(int i=0;i<7; i++){
		BoardEntity bb = (BoardEntity) boardList.get(i);
	%>
	<tr>
		<td style="width: 10%"><a href="showboard.jsp?id=<%= bb.getId()%>" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'"><%= boardItemNum %></a></td>
		<td style="width: 35%"><%= bb.getTitle() %></td>		
       	<td style="width: 15%"><%= bb.getName() %></td>
       	<td style="width: 30%"><%= df.format(bb.getDate()) %></td>
       	<td style="width: 10%"><%= bb.getShowcnt() %></td>
	</tr>
	<%
		boardItemNum += 1;
    }
	%>
	</table>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>