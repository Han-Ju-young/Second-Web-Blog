<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="ReFarmProject.WorkData"%>
<%@page import="ReFarmProject.Work"%>
<%@page import="java.util.List"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���ڸ�</title>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<style>
img {
	width: 200px;
	height: 150px;
}
table {
	float: left;
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 50px;
	text-align: center;
	border: 1px solid black;
    border-collapse: collapse;
  }
 th, td {
    border: 2px solid #0088ff;
    
 }
 th {
 	font-size: 20px;
 }
#t2 {
	float: right;
	margin-right: 0px;
}
button {
	color: ##ff8800;
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
function getWork()  {
	window.location.href = "https://www.jobkorea.co.kr/recruit/joblist?menucode=industry&industryCtgr=10009&industry=1000063"
}
</script>
<jsp:include page="Header.jsp">

<jsp:param name="menuval" value="work" />

</jsp:include>
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
<img style="width: 60px; height: 60px" src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif"/>
<span style="font-size: 30px; text-align: center">����ꡤ������Ӿ� ���ڸ� ����</span>
<br>
<table>
<tr>

</tr>
<tr>
	<th>��� ��</th>
	<th colspan="2">���� ����</th>
	<th>���/������</th>
	<th>�����ϱ�</th>
</tr>
<%
	List<Work> workList = WorkData.getWorkData();
	for(int i=0; i<20; i++){
		Work v = (Work) workList.get(i);
%>
<tr onmouseover="this.style.backgroundColor='#a8d6ff'" onmouseout="this.style.backgroundColor='white'">
	<td style="width: 10%"><%= v.getTitle() %></td>
	<td style="width: 35%"><%= v.getWorkname() %></td>
	<td style="width: 35%"><%= v.getCareer() %></td>
	<td style="width: 10%"><%= v.getDay() %><br><%= v.getEndday() %></td>
	<td style="width: 10%"><button onclick='getWork()'>�����ϱ�</button></td>
</tr>
<%
	}
%>
</table>
<jsp:include page="Footer.jsp" />
</body>
</html>