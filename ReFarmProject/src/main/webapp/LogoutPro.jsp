<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>�α׾ƿ� ó��</title>
</head>
<body>
    <%
        session.invalidate(); // ��缼������ ����
        response.sendRedirect("main.jsp"); // �α��� ȭ������ �ٽ� ���ư���.
    %>
</body>
</html>
