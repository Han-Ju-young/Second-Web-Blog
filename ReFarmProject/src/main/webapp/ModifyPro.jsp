<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- 자바빈 클래스 import --%>      
<%@ page import="ReFarmProject.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="ReFarmProject.MemberDAO" %> 
    
<html>
<head>
    <title>회원정보 수정처리</title>
<style>
body {
	text-align: center;
}
</style>
</head>
<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="ReFarmProject.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%
        // 세션에서 아이디를 가져와 MemberBean에 세팅한다.
        String id= (String)session.getAttribute("sessionID"); 
        memberBean.setId(id);
    
        // 수정할 회원정보를 담고있는 MemberBean을 DAO로 전달하여 회원정보 수정을 한다.
        MemberDAO dao = new MemberDAO();
        dao.updateMember(memberBean);
    
    	response.sendRedirect("UserInfoForm.jsp");
    %>
</body>
</html>
