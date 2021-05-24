<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="needs.User" %>
<%
	User user = (User) session.getAttribute("user");
%>
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
                       
                        <div><font color="white"><%= (user == null) ? "로그인을 하십시오." : user.id %></font></div>
                        
                 	<form method="post" action="booksearch.jsp">
                    <input type="submit" value="도서검색" id="search">                 
                 	</form>
                 	
                    <form method="post" action="rankPage.jsp">
                    <input type="submit" value="랭킹 top10" id="ranking">
                    </form>
                  	
                    
                </center>
        </div>
        
        

</body>

<script type="text/javascript">
</script>
</html>