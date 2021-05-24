<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%


	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		//db 연동 Connection 객체
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// 쿼리를 수행
		String sql ="select Id, Pw from db_test.member ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		

		

		//쿼리 성공 수행
		str = "member 변수를 가져오는데 성공 ";
	}catch(Exception e){
		e.printStackTrace();
		str = "변수를 가져오는데 실패했습니다.";
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

    #check{
        background: green;
        
        border: 1px white;
        height: 50px;
        width: 50px;
        font-size: large;
        color: white;
    }

</style>

<body>
	
	 <div id = "background">
        <center>
            <div><font size=5><strong>도서 목록 검색</strong></font></div>
           <form method="post" action="booksearch_information.jsp">
           <div>
           <input type="text" id ="book_info" name="book_info" placeholder="도서 정보 검색">
           </div>
           <input type="submit" id = "check" value="확인">
           
        </center>
    </div>
    
</body>
</html>