<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

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
			<td>ISBN</td> <td>TITLE</td> <td>AUTHOR</td> <td>PUBLISHER</td> <td>status</td> <td>MENU</td>
		</tr>
	</thead>
	<tbody>
		<% 
		String in_id = request.getParameter("in_id");
		String in_pw = request.getParameter("in_pw");
		String searchBy = request.getParameter("searchBy");
		String searchVal = request.getParameter("searchVal");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs_book = null;
		ResultSet rs_rentStat = null;
		ResultSet rs_reserved = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
			String dbId = "root";
			String dbPass = "1234";
		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			String sql = "";
			if(searchVal.isEmpty()){
				sql = "SELECT * FROM books";
			}
			else {
				if(searchBy.compareTo("ISBN")==0){
					sql = "SELECT * FROM books WHERE isbn ="+searchVal;
				}else {
					sql = "SELECT * FROM books WHERE title like '%"+searchVal+"%'";
				}	
			}
			
			pstmt = conn.prepareStatement(sql);
			rs_book = pstmt.executeQuery();
			while (rs_book.next())
			{
		%>	
				<tr>
					<td><%=rs_book.getInt("isbn") %></td>
					<td><%=rs_book.getString("title") %></td>
					<td><%=rs_book.getString("author") %></td>
					<td><%=rs_book.getString("publisher") %></td>
					
					<%
						sql = "SELECT * FROM books_on_rent WHERE isbn="+rs_book.getInt("isbn");
						pstmt=conn.prepareStatement(sql);
						rs_rentStat = pstmt.executeQuery();
						if(rs_rentStat.next() ){
					%>
							<td>대여 중 ( <%=rs_rentStat.getDate("RentEndDate") %> 까지 )</td>
					<%
						} else {
							sql = "SELECT * FROM rent_reservation WHERE isbn= ? ORDER BY reserve_date LIMIT 1";
							pstmt=conn.prepareStatement(sql);
							pstmt.setInt(1, rs_book.getInt("isbn"));
							rs_reserved = pstmt.executeQuery();
							if(rs_reserved.next()){
								if(in_id.equals(rs_reserved.getString("memid")) ){
									%>
									<td>대여 가능</td>
									<%
								} else {
									%>
									<td>예약 중</td>
									<%
								}
							} else {
							%>
								<td>대여 가능</td>
							<%
							}
						}
					%>
					
					<td>
						<form name="tableDataFrom" method="post">
							<input type="hidden" name="isbn" value= <%=rs_book.getInt("isbn") %> >
							<input type="hidden" name="in_id" value =<%=in_id %> >
							<input type="hidden" name="in_pw" value = <%=in_pw %> >
							<input type="submit" value="대여" onclick="javascript: form.action='User_page_bookRent.jsp';"/>
							<input type="submit" value="예약" onclick="javascript: form.action='User_page_bookReservation.jsp';"/>
							<input type="submit" value="예약확인" onclick="javascript: form.action='User_page_reservationCheck.jsp';"/>
						</form>
					</td>
					
				</tr>				
		<%		
			}		
		}catch (Exception e){
			e.printStackTrace(); 
		} finally{
			if(rs_book != null) try{rs_book.close();}catch(SQLException sqle){}
			if(rs_rentStat != null) try{rs_rentStat.close();}catch(SQLException sqle){}
			if(rs_reserved != null) try{rs_reserved.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
		%>
	</tbody>
</table>
<br>
<form method="post" action = "User_page_main.jsp">
<input type="hidden" name="id" value =<%=in_id %> >
<input type="hidden" name="pw" value = <%=in_pw %> >
<input type="submit" value="메인 페이지 돌아가기">
</form>
</body>
</html>