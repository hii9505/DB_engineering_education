<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*"  %>
 <%@ page import = "java.util.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Update rent data</title>
</head>
<body>
<% 
	
	String isbn = request.getParameter("isbn");
	String memid = request.getParameter("up_rentMemID");
	String dateS = request.getParameter("up_rentStartDate");
	String dateE = request.getParameter("up_rentEndDate");
	

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
		String sql = "select Id, Memstat FROM Member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			if(memid.equals(rs.getString("Id")) ) {
				sql = "UPDATE books_on_rent SET rentMemID = ? ,rentStartDate = ? , rentEndDate = ? WHERE isbn = "+isbn;
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, memid);
				pstmt.setString(2, dateS);
				pstmt.setString(3, dateE);
				
				pstmt.executeUpdate();
				
				sql = "SELECT * FROM books_on_rent WHERE isbn ="+isbn;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
				%>
				정보가 수정됐습니다.
				<ul>
					<li>ISBN : <%=rs.getInt("isbn") %></li>
					<li>memID : <%=rs.getString("rentMemID") %> </li> 
					<li>start Date : <%=rs.getString("rentStartDate") %></li>
					<li>end Date: <%=rs.getString("rentEndDate") %></li>			
				</ul>
				<%
				break;
				}
			}
			if(! rs.next()){
				out.print("존재하지 않는 ID 입니다.");
			}
		}
	}catch (Exception e){
		e.printStackTrace();
		str = "member 테이블에 새로운 레코드 추가에 실패했습니다."; 
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>

<button onclick="location.href='Admin_page_main.jsp'">돌아가기</button>
</body>
</html>