<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
</head>
<%
	String isbn = request.getParameter("isbn");
	String in_id = request.getParameter("in_id");
	String in_pw = request.getParameter("in_pw");
	LocalDate today = LocalDate.now();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String msg = "회원 "+in_id+" 님 ";
	
%>
<title>USER TURN IN</title>
</head>
<body>
<%
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
	String dbId = "root";
	String dbPass = "1234";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	sql = "SELECT isbn FROM turn_in_request WHERE isbn="+isbn;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next()){
		throw new Exception("이미 반납 신청된 도서입니다.");
	}
	pstmt.clearParameters();
	
	sql = "INSERT INTO turn_in_request VALUES(?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, isbn);
	pstmt.setString(2, in_id);
	pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE));
	pstmt.executeUpdate();
	pstmt.clearParameters();
	
	sql = "SELECT isbn FROM turn_in_request WHERE isbn="+isbn;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next()){
		out.println("해당 도서의 반납 신청이 완료됐습니다.");
	}
} catch (Exception e){
	e.printStackTrace();
	out.println(e.getMessage());
} finally {
	if(rs != null) try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>
<form method="post" action = "User_page_myRental.jsp">
	<input type="hidden" name="in_id" value =<%=in_id %> >
	<input type="hidden" name="in_pw" value = <%=in_pw %> >
	<input type="submit" value="돌아가기">
</form>
</body>
</html>