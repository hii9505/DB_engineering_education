<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<% 
	String isbn = request.getParameter("isbn");
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
		
		String sql_check_TurnInRequest = "SELECT * FROM turn_in_request WHERE isbn="+isbn;
		pstmt = conn.prepareStatement(sql_check_TurnInRequest);
		rs = pstmt.executeQuery();
		if(rs.next()){
			throw new Exception("�̹� �ݳ� ��û�� ���� �����Դϴ�.");
		}
		
		String sql = "DELETE FROM books_on_rent WHERE isbn="+isbn;
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		str="�ݳ��Ϸ� (ISBN : "+isbn+" )";
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
<title>Rent data delete page</title>
</head>
<body>
	<%=str %>
	<br/>
<button onclick="location.href='Admin_page_main.jsp'">���ư���</button>
</body>
</html>