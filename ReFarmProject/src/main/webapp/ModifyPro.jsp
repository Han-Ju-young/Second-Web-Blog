<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%-- �ڹٺ� Ŭ���� import --%>      
<%@ page import="ReFarmProject.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="ReFarmProject.MemberDAO" %> 
    
<html>
<head>
    <title>ȸ������ ����ó��</title>
<style>
body {
	text-align: center;
}
</style>
</head>
<body>
    <%-- �ڹٺ� ���� �׼��±� ��� --%>
    <jsp:useBean id="memberBean" class="ReFarmProject.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%
        // ���ǿ��� ���̵� ������ MemberBean�� �����Ѵ�.
        String id= (String)session.getAttribute("sessionID"); 
        memberBean.setId(id);
    
        // ������ ȸ�������� ����ִ� MemberBean�� DAO�� �����Ͽ� ȸ������ ������ �Ѵ�.
        MemberDAO dao = new MemberDAO();
        dao.updateMember(memberBean);
    
    	response.sendRedirect("UserInfoForm.jsp");
    %>
</body>
</html>
