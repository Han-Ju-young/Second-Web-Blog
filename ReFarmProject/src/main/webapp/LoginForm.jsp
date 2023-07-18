<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <%
        // 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
    %>
    <title>로그인</title>
    
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
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        } 
    </script>
 
</head>
<body>
    <div id="wrap">
    <b><font size="6" color="gray">아이디와 비밀번호를 입력해주세요</font></b>
        <form name="loginInfo" method="post" action="LoginPro.jsp" 
                onsubmit="return checkValue()">
        
            <!-- 이미지 추가 -->
            <img src="https://cdn.pixabay.com/animation/2023/04/14/20/54/20-54-26-27_512.gif">
            <br><br>
            
            <table>
                <tr>
                    <td bgcolor="skyblue">아이디</td>
                    <td><input type="text" name="id" maxlength="50"></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">비밀번호</td>
                    <td><input type="password" name="password" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="button" value="홈으로" onclick="location.href='main.jsp'"/>
            <input type="submit" value="로그인"/>
            <input type="button" value="회원가입" onclick="location.href='JoinForm.jsp'" />
        </form>
        
        <% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
        %>    
    </div>    
</body>
</html>
