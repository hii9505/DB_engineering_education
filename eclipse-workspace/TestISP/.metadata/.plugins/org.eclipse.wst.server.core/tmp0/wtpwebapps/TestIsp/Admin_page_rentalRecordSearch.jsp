<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>RENTAL LOG</title>
</head>
<body>
<h2>검색 결과</h2>

<table width = "100%" border = "1">
	<thead>
		<tr>
			<td>ISBN(0 = null)</td> <td>RentMem ID</td> <td>Rent Date</td>
		</tr>
	</thead>
	<tbody>
		<% 
		String date_start = request.getParameter("date_start");
		String date_end = request.getParameter("date_end");
		String searchBy = request.getParameter("searchBy");
		String searchVal = request.getParameter("searchVal");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String str = "";
		try {
			if(date_start.equals("") && date_end.equals("")){
				throw new Exception("[ERROR] 조회 기간 미입력");
			}
			String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
			String dbId = "root";
			String dbPass = "1234";
		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			String sql = "";
			if(searchVal.isEmpty()){ //공란일 경우 전체 검색
				sql="SELECT * FROM rental_record WHERE rent_date >= ? AND rent_date <= ? ";
			}
			else { 
				if(searchBy.compareTo("ISBN")==0){  //isbn 으로 검색
					sql="SELECT * FROM rental_record WHERE rent_date >= ? AND rent_date <= ? AND isbn= "+searchVal;
				}
				else { // SEARCH BY MEMBER ID
					sql="SELECT * FROM rental_record WHERE rent_date >= ? AND rent_date <= ? AND memID LIKE '%"+searchVal+"%'";
				}
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date_start);
			pstmt.setString(2, date_end);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
		%>	
				<tr>
					<td><%=rs.getInt("isbn") %></td>
					<td><%=rs.getString("MemId") %></td>
					<td><%=rs.getString("rent_Date") %></td>
				</tr>
		<% 						
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
	</tbody>
</table>
<br/>
<button onclick="location.href='Admin_page_main.jsp'">돌아가기</button>

</body>
</html>