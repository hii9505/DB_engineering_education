<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "needs.User" %>
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Search Book</title>
</head>
<body>
<h2>검색 결과</h2>
<table width = "100%" border = "1">
	<thead>
		<tr>
			<td>ISBN</td> <td>rentId</td> <td>rentstartdate</td> <td>RenEndDate</td>
			<div><%=  session.getAttribute("Memstat")%></div>
		</tr>
	</thead>
	<tbody>
		<% 
		User user = (User) session.getAttribute("user");
		
		
		LocalDate today = LocalDate.now();
		String isbn = request.getParameter("isbn");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String str = "";
		ResultSet rs = null;
	
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPass = "1234";
			
			//db 연동 Connection 객체
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			// 쿼리를 수행
			String sql ="select * from db_test.rent_reservation where isbn = ? and MemID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setString(2, (String)session.getAttribute("id"));
			rs=pstmt.executeQuery();
			
			//쿼리 성공 수행
			if(rs.next()){
			str = "예약 내역이 존재합니다.";
			
			%>	 
			
			
			
			<tr>
				<td><%=rs.getInt("isbn") %></td>
				<td><%=rs.getString("MemId") %></td>
				<td><%=rs.getString("reserve_date") %></td>
				
			</tr>				
		<%
			
			
			
			
			}
			else{
				
				try {
					
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

					sql = "insert into db_test.rent_reservation values(?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, isbn);
					pstmt.setString(2, (String)session.getAttribute("id"));
					pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE));
					pstmt.executeUpdate();
					
					
					str = "도서 예약에 성공했습니다.";
			}catch (Exception e){
				e.printStackTrace();
				str = "도서 예약에 실패했습니다."; 
			} finally{
				if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
				if(conn != null) try{conn.close();}catch(SQLException sqle){}
			}
				
			}
		}catch(Exception e){
			e.printStackTrace();
			str = "수정에 실패했습니다.";
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null)try{conn.close();}catch(SQLException sqle){}
		}
		
		
%>
<div><%=  str%></div>
	</tbody>
</table>
<br/>

<button onclick="location.href='Admin_page_main.jsp'">돌아가기></button>
<button onclick="location.href='Homepage.jsp'">홈페이지></button>


</body>
</html>