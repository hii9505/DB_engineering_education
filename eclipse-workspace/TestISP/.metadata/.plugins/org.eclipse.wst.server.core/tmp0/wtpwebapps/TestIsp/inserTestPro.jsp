<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone_number");
	String pwd = request.getParameter("pwd");
	String stat = request.getParameter("stat");
	
	Timestamp register = new Timestamp(System.currentTimeMillis()); // 현재날짜 시간
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		//db 연동 Connection 객체
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// 쿼리를 수행
		String sql ="insert into db_test.member values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setString(6, stat);
		pstmt.executeUpdate();
		
		//쿼리 성공 수행
		str = "member 테이블에 새로운 레코드를 추가했습니다  확인";
	}catch(Exception e){
		e.printStackTrace();
		str = "member 테이블에 새로운 레코드를 추가에 실패했습니다.";
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
<body>
	
	<center>
	<%=str %>
	<form method="post" action="Homepage.jsp">
		<input type="submit" value="확인">
	</form>
	<center/>
<div>안녕</div>
</body>
</html>