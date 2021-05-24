<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #container {
        background: #cccccc;
        height: 1000px;
    }
 
    #item{
        border: 1px solid #cccccc
    }

    #id{
        height: 25px;
        width: 400px;
    }
    #pwd{
        height: 25px;
        width: 400px;
    }
    
    #login_button{
        background: red;
        border: 1px white;
        height: 50px;
        width: 400px;
        font-size: large;
        color: white;
    }

    #account_maker{
        background: #cccccc;
        border: 1px white;
        height: 25px;
        width: 400px;
    }
</style>

<body>
    <div id = "container">
        <center>
            <div id='item'><font size="10" color="red"><strong>DB05</strong></font></div>
            <div id='item'></div>
            
            <form method="post" action="LoginCheck.jsp">
                <p>
                    <input type="text" id="id" name = "id" placeholder="아이디" ">
                </p>
                <p>
                    <input type="password" id="pwd" name = "pwd" placeholder="비밀번호" " >
                </p>
                <p>
                    <input type="submit"  id="login_button" value="로그인">
                </p>
             </form>   
             
             
             <form method="post" action="insertTestForm.jsp">
                <input type="submit"  id="account_maker" value="회원가입">
             </form>
        </center>
    </div>

</html>