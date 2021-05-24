<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Update member info Result</title>
</head>
<body>
	
	<% 
	String id = request.getParameter("id");
	String pw = (request.getParameter("up_pw").equals("") )? request.getParameter("old_pw"): request.getParameter("up_pw");
	String name = request.getParameter("up_name");
	String email = request.getParameter("up_email");
	String phone = request.getParameter("up_phone");
	String memstat = request.getParameter("stat");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		String sql = "UPDATE member SET pw = ? ,usr_name = ? , email = ?, phoneNum=?, memstat=? WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pw);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, phone);
		pstmt.setString(5, memstat);
		pstmt.setString(6, id);
		pstmt.executeUpdate();
		
		sql = "SELECT * FROM member WHERE id= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			out.println("수정되었습니다. 다시 로그인하세요.");
		}
	}catch (Exception e){
		e.printStackTrace();
		out.println(e.getMessage());
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
<button onclick="location.href='User_page_main.jsp'">돌아가기</button>
</body>
</html>