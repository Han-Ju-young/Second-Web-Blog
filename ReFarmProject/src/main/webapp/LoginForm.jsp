<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <%
        // ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
    %>
    <title>�α���</title>
    
<style>
div {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
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
img {
	width: 100px;
	height: 100px;
}
</style>
    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("���̵� �Է��ϼ���");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("��й�ȣ�� �Է��ϼ���");    
                inputForm.password.focus();
                return false;
            }
        } 
    </script>
 
</head>
<body>
    <div id="wrap">
    <b><font size="6" color="gray">���̵�� ��й�ȣ�� �Է����ּ���</font></b>
        <form name="loginInfo" method="post" action="LoginPro.jsp" 
                onsubmit="return checkValue()">
        
            <!-- �̹��� �߰� -->
            <img src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif">
            <br><br>
            
            <table>
                <tr>
                    <td bgcolor="skyblue">���̵�</td>
                    <td><input type="text" name="id" maxlength="50"></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">��й�ȣ</td>
                    <td><input type="password" name="password" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="button" value="Ȩ����" onclick="location.href='main.jsp'"/>
            <input type="submit" value="�α���"/>
            <input type="button" value="ȸ������" onclick="location.href='JoinForm.jsp'" />
        </form>
        
        <% 
            // ���̵�, ��й�ȣ�� Ʋ����� ȭ�鿡 �޽��� ǥ��
            // LoginPro.jsp���� �α��� ó�� ����� ���� �޽����� ������.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>��й�ȣ�� Ȯ���� �ּ���.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>���̵� Ȯ���� �ּ���.</font>");
            }
        %>    
    </div>    
</body>
</html>
