<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homepage</title>
</head>
<style>
       #background{
        background: #cccccc;
        height: 1000px;
    }

    #title{
        background: black;
    }

    #mypage{
        background: green;
        border: 1px white;
        height: 150px;
        width: 150px;
        font-size: large;
        color: white;
    }
    
   
    #deletemypage{
        background: red;
        border: 1px white;
        height: 150px;
        width: 150px;
        font-size: large;
        color: white;
    }
    #search{
        background: green;
        border: 1px white;
        height: 300px;
        width: 300px;
        font-size: large;
        color: white;
    }
    #rental{
        background: blue;
        border: 1px white;
        height: 300px;
        width: 300px;
        font-size: large;
        color: white;
    }
    #AddBook{
        background: black;
        border: 1px white;
        height: 300px;
        width: 300px;
        font-size: large;
        color: white;
    }
    #reservation{
        background: violet;
        border: 1px white;
        height: 300px;
        width: 300px;
        font-size: large;
        color: white;
    }
    #ranking{
        background: rgb(211, 102, 14);
        border: 1px white;
        height: 300px;
        width: 300px;
        font-size: large;
        color: white;
    }

</style>

<body>

   <div id = "background">

                <center>
                    <div id = "container">        
                        <div id="title"><font size="10" color="white"><strong>도서예약관리</strong></font></br>
                        <form method="post" action="Login.jsp">
                        <input type="submit" value="로그인">
                        </form>
                        <form method="post" action="logout.jsp">
                        <input type="submit" value="로그아웃"></br>
                        </form>
                        <div><font color="white"><%=(String)session.getAttribute("id") %></font></div>
                        </div>
                    </div>
                    <form method="post" action="accountrestore.jsp">
                    <input type="submit" value="회원수정" id="mypage">
                    </form>
                 	<form method="post" action="deleteAccount.jsp">
                 		<input type="submit" value="회원탈퇴" id="deletemypage">
                 	</form>
                    <input type="submit" value="도서검색" id="search">
                    <input type="submit" value="도서대출반납" id="rental"></br>
                    <input type="submit" value="도서등록" id="AddBook">
                    <input type="submit" value="도서예약" id="reservation">
                    <input type="submit" value="랭킹 top10" id="ranking">
                    
                </center>
        </div>

</body>
</html>