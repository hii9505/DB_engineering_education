<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>


<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		//db 연동 Connection 객체
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// 쿼리를 수행
		String sql ="select * from db_test.member where id=?";
		pstmt = conn.prepareStatement(sql);
		
		rs=pstmt.executeQuery();
		while (rs.next())
		
		
		
		//쿼리 성공 수행
		str = "수정에 성공하였습니다";
	}catch(Exception e){
		e.printStackTrace();
		str = "수정에 실패했습니다.";
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>

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
          			비밀번호:<input type="text" id = "pwd" name = "pwd" placeholder="비밀번호"></br>
                                             이메일   :<input type="text" id = "email" name = "email" placeholder="이메일"></br>
                                             전화번호:<input type="text" id = "phone_number" name = "phone_number" placeholder="전화번호"></br>
                   	이름      :<input type="text" id = "name" name = "name" placeholder="이름"></br>
                   	구분: <input type="RADIO" id = "stat" name = "stat" value=Undergrduate CHECKED>학부생
                   	<input type="RADIO" id = "stat" name = "stat" value=Graduate_school>대학원생
                   	<input type="RADIO" id = "stat" name = "stat" value=faculty_member>교직원</br>
            <input type="submit" value="확인" onclick="Question();">
            
		 	</form>
        </center>    
</div>

    

</body>

<script type="text/javascript">


function Question(){
	
var result = confirm("실행하시겠어요:?");
	
	if(result)
		{
			document.write("<h1> 실행합니다. </h1>")
					<form method="post" action="restorecheck.jsp">
					<input type="submit" value="확인" onclick="Question();">
					</form>")
		}
	else{
			document.write("<h1> 정보 수정을 취소하였습니다. </h1>")
	}
	
}
	

</script>
</html>