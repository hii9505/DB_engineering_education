<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<% 
	String id = request.getParameter("id");
	String sure = request.getParameter("sureDelete");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	try {
		if(!sure.equals("delete")){
			throw new Exception("Ȯ�ι��ڿ���");
		}
		String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "DELETE FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		out.println("Ż��Ϸ�");
	}catch (Exception e){
		e.printStackTrace();
		out.println(e.getMessage());
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż��</title>
</head>
<body>
<button onclick="location.href='User_page_main.jsp'">���ư���</button>
</body>
</html>