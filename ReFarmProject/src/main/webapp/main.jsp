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
<title>Ȩ ȭ��</title>

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
    	+"<strong style=''>�ε����Դϴ�...</strong>"+
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
	���ڸ� ����</a>
</strong></p>
<table id="workT" >
<tr>
	<th>��� ��</th>
	<th colspan="2">���� ����</th>
	<th>���/������</th>
	<th>�����ϱ�</th>
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
	<td style="width: 10%"><button onclick='getWork()'>�����ϱ�</button></td>
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
	�ͳ���� ü�� ���α׷�</a>
</strong></p>
<table id="t1">
<th id="rth" colspan="5"><a ref="program.jsp" style="text-decoration: none; color: black;"
	onmouseover="this.style.color='green'" onmouseout="this.style.color='black'">
	�ͳ��� ���α׷� � ����</a></th>
<%
	String btxt = "";
	List<ReFarm> refarmlist = ReFarmData.getReFarmData();
	for(int i=0; i<3; i++){
		ReFarm rf = (ReFarm) refarmlist.get(i);
		if(rf.getState().equals("����")) {
			btxt = "�ѷ�����";
		} else {
			btxt = "��û�ϱ�";
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
	������ ���α׷� � ����</a></th>
<%
	List<ReCountry> recountrylist = ReCountryData.getReCountryData();
	for(int i=0; i<3; i++){
		ReCountry rc = (ReCountry) recountrylist.get(i);
		if(rc.getState().equals("����")) {
			btxt = "�ѷ�����";
		} else {
			btxt = "��û�ϱ�";
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
	����� ü�踶�� ����</a>
</strong></p>
<table id="townT" >
<tr>
	<th>ü�踶����</th>
	<th>�õ�</th>
	<th>�ñ���</th>
	<th>ü�����α׷���</th>
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
	�Խ���</a>
</strong></p>
	<table id="boardT" width=97% border=1>
	<tr>
		<th><b>��ȣ</b></th>
    	<th><b>����</b></th>
    	<th><b>�ۼ���</b></th>
    	<th><b>�ۼ���</b></th>
    	<th><b>��ȸ��</b></th>
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