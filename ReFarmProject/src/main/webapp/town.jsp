<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ü�踶��</title>
<style>
#pageBlock {
	text-align: center;
}
tr {
	height: 50px;
}
a {
	text-decoration: none;
	color: black;
}
form {
	text-align: center;
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
<jsp:include page="Header.jsp">

<jsp:param name="menuval" value="town" />

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
<%@ page import="java.util.ArrayList, ReFarmProject.TownEntity, ReFarmProject.TownData" %>

<h2 style="text-align: center">����� ü�� ���� ����</h2>
<hr><br>

<%	
	TownData town = new TownData();
	int cnt = 0;

	int pageSize = 10; 
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){ 
		pageNum ="1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize + 1;

	int endRow= currentPage * pageSize;

	ArrayList townList = null;
	
	String type = request.getParameter("type");
	boolean isSearch = type != null;

	
	if(isSearch){
		townList = town.getSearch(startRow, pageSize, type); 
		cnt = town.getTownCount(type);
	}
	else{
		townList = town.getTownList(startRow, pageSize);
		cnt = town.getTownCount();
	}
	
%>
<form action="town.jsp" method="get">
	<strong>������ ü�� ���α׷� Ȯ���ϱ�</strong>
        <!-- �˻��з� -->
        <select name="type">
        <%
        	String typeval = "";
        	if(type == null) {
        		typeval = "��õ";
        	} else {
        		typeval = type;
        	}
        %>
        	<option value="<%=typeval %>"><%=typeval %></option>
            <option value="��õ������">��õ</option>
            <option value="����������">����</option>
            <option value="��걤����">���</option>
            <option value="����Ư����ġ��">����</option>
            <option value="��⵵">���</option>
            <option value="������">����</option>
            <option value="��û�ϵ�">���</option>
            <option value="��û����">�泲</option>
            <option value="����ϵ�">����</option>
            <option value="���󳲵�">����</option>
            <option value="���ϵ�">���</option>
            <option value="��󳲵�">�泲</option>
        </select>

        <!-- ���۹�ư -->
        <input type="submit" value="�˻�">
</form>
<br><br>    
    
<div id="contents">
    <table width=100% border=0 cellpadding=1>
    <tr>
       <td align=center><b></b></td>
       <td align=center><b>ü�踶����</b></td>
       <td align=center><b>�õ�</b></td>
       <td align=center><b>�ñ���</b></td>
       <td align=center><b>ü�����α׷���</b></td>
       <td align=center><b>�ּ�</b></td>
       <td align=center><b>��ǥ��</b></td>
       <td align=center><b>��ȭ��ȣ</b></td>
       <td align=center><b>Ȩ������</b></td>
       <td align=center><b>���������</b></td>
    </tr>
<%      
		int row = 0;
		for(int i=0;i<townList.size(); i++){
			TownEntity tt = (TownEntity) townList.get(i);
%>
    		<tr bgcolor="white"
				onmouseover="this.style.backgroundColor='#a8d6ff'"
    			onmouseout="this.style.backgroundColor='white'">
       			<td align=center style="width: 2%"><%= tt.getId() %></td>
       			<td align=center style="width: 11%"><%= tt.getTown() %></td>
       			<td align=center style="width: 10%"><%= tt.getCity() %></td>
       			<td align=center style="width: 6%"><%= tt.getCountry() %></td>
       			<td align=center style="width: 21%"><%= tt.getInfo() %></td>
       			<td align=center style="width: 15%"><%= tt.getAddress() %></td>
       			<td align=center style="width: 6%"><%= tt.getName() %></td>
       			<td align=center style="width: 10%"><%= tt.getPhone() %></td>
       			<td align=center style="width: 8%"><%= tt.getHomepage() %></td>
       			<td align=center style="width: 11%"><%= tt.getManage() %></td>
    		</tr>
<%
		}
%>
</table>
</div>
</fieldset>
<%

if(cnt != 0){
	int pageCount = cnt/pageSize + (cnt%pageSize == 0? 0:1);
	
	int pageBlock = 10;
	
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
		<a href="town.jsp?pageNum=<%=startPage-pageBlock%>">   ����   </a>
<%
	}
	
	for(int i=startPage; i<=endPage; i++){
%>
		<a href ="town.jsp?pageNum=<%=i%>">   <%=i%>   </a>
<%
	}
	if(endPage < pageCount){
%>
		<a href ="town.jsp?pageNum=<%=startPage+pageBlock%>">   ����   </a>
<%
	}
%>
<img style="width: 60px; height: 60px" src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif"/>
</div>
<%
}
%>
<br><br>
<footer>
	<jsp:include page="Footer.jsp" />
</footer>
</body>
</html>