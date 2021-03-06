<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone_number");
	String pwd = request.getParameter("pwd");
	String stat = request.getParameter("stat");
	String result = "";

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
		String sql ="UPDATE db_test.member SET pw = ? , usr_name = ?, Email = ?, PhoneNum = ? where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, phone);
		pstmt.setString(5,(String)session.getAttribute("id"));
		pstmt.executeUpdate();		
		session.invalidate();
		
		
		
		
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
            <div><font size=5><strong>수정된 정보로 다시 로그인해주세요</strong></font></div>
           <form method="post" action="Homepage.jsp">
           <input type="submit" id = "check" value="확인">
           </form>
            
        </center>
    </div>
    
</body>
</html>