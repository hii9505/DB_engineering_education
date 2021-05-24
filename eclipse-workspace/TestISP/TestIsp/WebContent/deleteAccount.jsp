<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%



	String id = (String)session.getAttribute("id");
	String pwd = (String)session.getAttribute("Pw");
	String result = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
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
		String sql ="delete from db_test.member where id=?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		session.invalidate();
		
		
		String sql2 ="select Id, Pw from db_test.member;";
		pstmt2 = conn.prepareStatement(sql);
		rs = pstmt2.executeQuery();
		

		
		while(rs.next()){
			if(id.equals(rs.getString("id")) && pwd.equals(rs.getString("Pw"))){
				result = "제거에 성공하였습니다";
				session.invalidate();
				break;
			}else{
				result = "제거되지 않았습니다";
			}
		}
		
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
        background: red;
        border: 1px white;
        height: 50px;
        width: 400px;
        font-size: large;
        color: white;
    }

</style>

<body>
	
	 <div id = "background">
        <center>
            <div><font size=5><strong><%= result%></strong></font></div>
           <form method="post" action="Homepage.jsp">
           <input type="submit" id = "check" value="확인">
           </form>
            
        </center>
    </div>
    
</body>
</html>