<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html "charset="EUC-KR">
<title>레코드 추가</title>
</head>

<style>
    #background{
        background: #cccccc;
        height: 1000px;
    }

    #title{
        background: black;
    }

   
    #Line_front{
        background: black;
        height: 50px;
        width: 600px;
    }

    #id{
        height: 25px;
        width: 500px;
    }

    #name{
        height: 25px;
        width: 500px;
    }


    #email{
        height: 25px;
        width: 500px;
    }

    #phone_number{
        height: 25px;
        width: 500px;
    }

    #pwd{
        height: 25px;
        width: 500px;
    }

    #pwd_check{
        height: 25px;
        width: 500px;
    }
    
    #stat{
        height: 25px;
        width: 500px;
    }



</style>
<body>


<div id = "background">
        <div id = "container">        
            <div id="title"><font size="10" color="red"><strong>DB05</strong></font></div>
        </div>
        <center>    
             <p>
                 <div><strong>아이디 이외에 수정하실 정보를 입력하세요</strong></div>
             </p>   

		 <form method="post" action="restorecheck.jsp">

          			<div>아이디: <%= (String)session.getAttribute("id") %></div>
          			<input type="text" id = "pwd" name = "pwd" placeholder="비밀번호"></br>
                    <input type="text" id = "email" name = "email" placeholder="이메일"></br>
                    <input type="text" id = "phone_number" name = "phone_number" placeholder="전화번호"></br>
                   	<input type="text" id = "name" name = "name" placeholder="이름"></br>
                   	<input type="text" id = "stat" name = "stat" placeholder="구분"></br>
            <input type="submit" value="확인">
		</form>

        </center>
    </div>
        
    

</body>
</html>