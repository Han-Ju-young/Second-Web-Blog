<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 자바빈 클래스 import --%>
<%@ page import="ReFarmProject.MemberBean"%>
<%-- DAO import --%>   
<%@ page import="ReFarmProject.MemberDAO" %>

<html>
<head>
<title>회원가입 처리 JSP</title>
<style>
#wrap {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
table {
	margin-left: auto;
	margin-right: auto;
	border: 3px solid skyblue
}
td {
	border: 1px solid skyblue
}
#title {
	background-color: skyblue
}
</style>
</head>
<body>
	<%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
	<%
	// 한글 깨짐을 방지하기 위한 인코딩 처리
	request.setCharacterEncoding("euc-kr");
	%>

	<%-- 자바빈 관련 액션태그 사용 --%>
	<jsp:useBean id="memberBean" class="ReFarmProject.MemberBean" />
	<jsp:setProperty property="*" name="memberBean" />
	
	<%
		MemberDAO dao = new MemberDAO();
    
        // 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
        // insertMember()는 회원 정보를 JSP_MEMBER 테이블에 저장한다.
        dao.insertMember(memberBean);
    %>

	<div id="wrap">
		<br>
		<br> <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b> <br>
		<br> <font color="blue"><%=memberBean.getName()%></font>님 가입을 축하드립니다. <br>
		<br>

		<%-- 자바빈에서 입력된 값을 추출한다. --%>
		<table>
			<tr>
				<td id="title">아이디</td>
				<td><%=memberBean.getId()%></td>
			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td><%=memberBean.getPassword()%></td>
			</tr>

			<tr>
				<td id="title">이름</td>
				<td><%=memberBean.getName()%></td>
			</tr>

			<tr>
				<td id="title">성별</td>
				<td><%=memberBean.getGender()%></td>
			</tr>

			<tr>
				<td id="title">생일</td>
				<td><%=memberBean.getBirthyy()%>년 <%=memberBean.getBirthmm()%>월 <%=memberBean.getBirthdd()%>일</td>
			</tr>

			<tr>
				<td id="title">이메일</td>
				<td><%=memberBean.getMail1()%>@<%=memberBean.getMail2()%></td>
			</tr>

			<tr>
				<td id="title">휴대전화</td>
				<td><%=memberBean.getPhone()%></td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td><%=memberBean.getAddress()%></td>
			</tr>
		</table>

		<br> <input type="button" value="확인" onClick="location.href='main.jsp'">
	</div>
</body>
</html>
