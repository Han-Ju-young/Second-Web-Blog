<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
nav {
	font-size: 12pt;
	font-family: 'PT Sans', Arial, Sans-serif;
	position: relative;
}

nav ul {
	padding: 0;
	margin: 0 auto;
	width: auto;
}

nav li {
	
}

nav a {
	line-height: 50px;
	height: 50px;
}

nav li a {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

nav li:last-child a {
	border-right: 0;
}

nav a:hover, nav a:active {
	
}

nav a#pull {
	display: none;
}

html {
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

ul {
	/*list-style-type: none;*/
	margin: 0;
	padding: 0;
	background-color: #333;
	text-align: center;
}

li {
	/*position: relative;*/
	display: inline-block;
	font-size: 20px;
}

li a {
	color: #FFFFFF;
	text-align: center;
	padding: 14.5px 16px;
	text-decoration: none;
}

li a:hover {
	/*color: #597812;*/
	color: #FFD400;
	font-weight: normal;
}

.menu {
	width: 5000px;
	height: 50px;
	text-align: center;
	max-width: 100%;
	background-position: center;
	background-size: cover;
	background-color: #333333;
	color: white;
	position: absolute;
	z-index: 1;
}
#log {
	font-size:15px;
	display: right;
}
</style>
</head>
<%
	String nameval = (String)request.getParameter("menuval");
%>

<body topmargin="0" bottommargin="100" leftmargin="0" rightmargin="0" style="background-color: #F6F6F6">
	<div class="menu">
		<nav class="clearfix">
			<ul class="clearfix">
				<li style="float: left; margin-top: 15px; margin-left: 10px"><span>Re Farm Project</span></li>
<%
				if(nameval.equals("main")) {
				%>
					<li><a href="main.jsp" style="color: #FFD400">Home</a></li>
					<li><a href="work.jsp">일자리 정보</a></li>
          			<li><a href="program.jsp">체험 프로그램</a></li>
          			<li><a href="town.jsp">체험 마을</a></li>
          			<li><a href="listboard.jsp">게시판</a></li>
          		<%
          			if(session.getAttribute("sessionID")==null){ 
          		%>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          			
          		<%
          			} else {
          		%>
          			<li style="float: right;"><a id="log" href="UserInfoForm.jsp">내정보</a></li>
          			<li style="float: right;"><a id="log" href="LogoutPro.jsp">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("work")) {
				%>
					<li><a href="main.jsp">Home</a></li>
					<li><a href="work.jsp" style="color: #FFD400">일자리 정보</a></li>
          			<li><a href="program.jsp">체험 프로그램</a></li>
          			<li><a href="town.jsp">체험 마을</a></li>
          			<li><a href="listboard.jsp">게시판</a></li>
				<%
          			if(session.getAttribute("sessionID")==null){ 
          		%>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: right;"><a id="log" href="UserInfoForm.jsp">내정보</a></li>
          			<li style="float: right;"><a id="log" href="LogoutPro.jsp">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("pro")) {
				%>
					<li><a href="main.jsp">Home</a></li>
					<li><a href="work.jsp">일자리 정보</a></li>
          			<li><a href="program.jsp" style="color: #FFD400">체험 프로그램</a></li>
          			<li><a href="town.jsp">체험 마을</a></li>
          			<li><a href="listboard.jsp">게시판</a></li>
				<%
          			if(session.getAttribute("sessionID")==null){ 
          		%>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: right;"><a id="log" href="UserInfoForm.jsp">내정보</a></li>
          			<li style="float: right;"><a id="log" href="LogoutPro.jsp">로그아웃</a></li>
				<%
          			}
				} else if(nameval.equals("town")) {
				%>
					<li><a href="main.jsp">Home</a></li>
					<li><a href="work.jsp">일자리 정보</a></li>
          			<li><a href="program.jsp">체험 프로그램</a></li>
          			<li><a href="town.jsp" style="color: #FFD400">체험 마을</a></li>
          			<li><a href="listboard.jsp">게시판</a></li>
				<%
          			if(session.getAttribute("sessionID")==null){ 
          		%>
          			<li style="float: right;"><a id="log" href="UserInfoForm.jsp">내정보</a></li>
          			<li style="float: right;"><a id="log" href="LogoutPro.jsp">로그아웃</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: right;"><a id="log" href="LogoutPro.jsp">로그아웃</a></li>
          			<li style="float: right;"><a id="log" href="UserInfoForm.jsp">내정보</a></li>
				<%
          			}
				} else if(nameval.equals("list")) {
				%>
					<li><a href="main.jsp">Home</a></li>
					<li><a href="work.jsp">일자리 정보</a></li>
					<li><a href="program.jsp">체험 프로그램</a></li>
          			<li><a href="town.jsp">체험 마을</a></li>
					<li><a href="listboard.jsp" style="color: #FFD400">게시판</a></li>
				<%
          			if(session.getAttribute("sessionID")==null){ 
          		%>
          			<li style="float: right;"><a id="log" href="JoinForm.jsp">회원가입</a></li>
          			<li style="float: right;"><a id="log" href="LoginForm.jsp">로그인</a></li>
          		<%
          			} else {
          		%>
          			<li style="float: right;"><a id="log" href="UserInfoForm.jsp">내정보</a></li>
          			<li style="float: right;"><a id="log" href="LogoutPro.jsp">로그아웃</a></li>
				<%
          			}
				}
%>			
      		</ul>
    	</nav>
    </div>
    <br>
	<br>
	<br>
  </body>
</html>