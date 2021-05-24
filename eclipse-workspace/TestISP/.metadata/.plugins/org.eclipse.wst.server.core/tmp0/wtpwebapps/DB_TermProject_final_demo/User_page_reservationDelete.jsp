<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<% 
	String isbn = request.getParameter("isbn");
	String in_id = request.getParameter("in_id");
	String in_pw = request.getParameter("in_pw");
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
		String sql ="";
		sql = "DELETE FROM rent_reservation WHERE isbn= ? AND memId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		pstmt.setString(2, in_id);
		pstmt.executeUpdate();
		str="도서( "+isbn+" ) 에 대한 사용자( "+in_id+" )의 예약 삭제 완료";
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
	<%=str %>
<br/><form method="post" action = "User_page_myReservation.jsp">
	<input type="hidden" name="in_id" value =<%=in_id %> >
	<input type="hidden" name="in_pw" value = <%=in_pw %> >
	<input type="submit" value="돌아가기">
</form>
</body>
</html>