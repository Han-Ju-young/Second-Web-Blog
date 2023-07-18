<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="ReFarmProject.ReFarmData"%>
<%@page import="ReFarmProject.ReFarm"%>
<%@page import="ReFarmProject.ReCountryData" %>
<%@page import="ReFarmProject.ReCountry" %>
<%@page import="java.util.List"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램</title>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<style>
div {
	text-align: center;
	margin-bottom: 20px;
}
img {
	width: 200px;
	height: 150px;
}
table {
	display: inline-block;
	float: center;
	text-align: center;
	border: 1px solid black;
    border-collapse: collapse;
  }
 th {
 	font-size: 25px;
 }
 td {
    border: 1px solid black;
 }
 #t1 {
 	margin-right: 20px;
 }
#t2 {
	margin-left: 20px;
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
<jsp:include page="Header.jsp">

<jsp:param name="menuval" value="pro" />

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
<img style="width: 60px; height: 60px" src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif"/>
<img style="width: 60px; height: 60px; float: right" src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif"/>
<div><span style="font-size: 30px; text-align: center">귀농귀촌 체험 프로그램</span></div>

<div>
<table id="t1">
<th colspan="5">귀농형 프로그램 운영 마을</th>
<%
	String btxt = "";
	List<ReFarm> list1 = ReFarmData.getReFarmData();
	for(ReFarm v: list1){
		if(v.getState().equals("마감")) {
			btxt = "둘러보기";
		} else {
			btxt = "신청하기";
		}
%>
<tr onmouseover="this.style.backgroundColor='#94cafc'" onmouseout="this.style.backgroundColor='white'">
	<td><img src=<%= v.getImg() %> /></td>
	<td><%= v.getTitle() %></td>
	<td><%= v.getCountry() %></td>
	<td><%= v.getState() %></td>
	<td><button onclick='FarmPage()'><%= btxt %></button></td>
</tr>
<%
	}
%>
</table>

<table id="t2">
<th colspan="5">귀촌형 프로그램 운영 마을</th>
<%
	List<ReCountry> list2 = ReCountryData.getReCountryData();
	for(ReCountry v: list2){
		if(v.getState().equals("마감")) {
			btxt = "둘러보기";
		} else {
			btxt = "신청하기";
		}
%>
<tr onmouseover="this.style.backgroundColor='#94fcb8'" onmouseout="this.style.backgroundColor='white'">
	<td><img src=<%= v.getImg() %> /></td>
	<td><%= v.getTitle() %></td>
	<td><%= v.getCountry() %></td>
	<td><%= v.getState() %></td>
	<td><button onclick='CountryPage()'><%= btxt %></button></td>
</tr>
<%
	}
%>
</table>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>