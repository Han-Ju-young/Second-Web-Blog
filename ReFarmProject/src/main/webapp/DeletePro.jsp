<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="ReFarmProject.MemberDAO" %>    
<%@ page import="ReFarmProject.MemberBean" %>    
<html>
<head>
    <title>ȸ�� ���� ó��</title>
<style>
body {
	text-align: center;
}
</style>
</head>
<body>
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = request.getParameter("password");
        
        // ���ǿ��� ���̵�, DeleteForm.jsp���� �Է¹��� ��й�ȣ�� �����´�.
        // ������ ����� ������ ȸ�������� �����Ѵ�. - ��������� ��ȯ
        MemberDAO dao = new MemberDAO();
        int check = dao.deleteMember(id, pw);
        
        if(check == 1){
            session.invalidate(); // �����ߴٸ� ���������� �����Ѵ�.
    %>
        <br><br>
        <b><font size="4" color="gray">ȸ�������� �����Ǿ����ϴ�.</font></b>
        <br><br><br>
    
        <input type="button" value="Ȯ��" onclick="location.href='main.jsp'">
    
    <%    
         // ��й�ȣ�� Ʋ����� - ������ �ȵǾ��� ���
        }else{
    %>
        <script>
            alert("��й�ȣ�� ���� �ʽ��ϴ�.");
            history.go(-1);
        </script>
    <%
        } 
    %>
</body>
</html>