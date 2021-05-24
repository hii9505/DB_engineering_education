<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<% 
	String isbn = request.getParameter("isbn");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String str = "";
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		String sql ="";
		sql = "SELECT * FROM books_on_rent WHERE isbn="+isbn;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		sql = "SELECT * FROM rent_reservation WHERE isbn="+isbn;
		pstmt = conn.prepareStatement(sql);
		rs2 = pstmt.executeQuery();
		
		if(rs.next()){
			throw new Exception("삭제 실패 : 대여 정보가 존재합니다. 도서 번호 "+isbn);
		} 
		if(rs2.next()){
			throw new Exception("삭제 실패 : 예약 정보가 존재합니다. 도서 번호 "+isbn);
		}
		
		sql = "delete from books where isbn="+isbn;
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		str="삭제완료";
	}catch (Exception e){
		e.printStackTrace();
		out.print(e.getMessage());
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
<title>Insert title here</title>
</head>
<body>
	<br/>
<button onclick="location.href='Admin_page_main.jsp'">돌아가기</button>
</body>
</html>