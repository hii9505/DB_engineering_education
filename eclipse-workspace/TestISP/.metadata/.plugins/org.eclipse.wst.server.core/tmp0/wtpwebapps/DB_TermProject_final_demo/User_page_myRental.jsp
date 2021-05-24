<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>USER RENTAL DATA</title>
<% 
		String in_id = request.getParameter("in_id");
		String in_pw = request.getParameter("in_pw");
%>
</head>
<body>
<h2>검색 결과</h2>
<form method="post" action = "User_page_main.jsp">
	<input type="hidden" name="id" value =<%=in_id %> >
	<input type="hidden" name="pw" value = <%=in_pw %> >
	<input type="submit" value="메인 페이지 돌아가기">
</form>
<table width = "100%" border = "1">
	<thead>
		<tr>
			<td>ISBN</td>	<td>TITLE</td>	<td>AUTHOR</td>	<td>PUBLISHER</td>
			<td>Start Date</td> <td>End Date</td> <td>MENU</td>
		</tr>
	</thead>
	<tbody>
		
<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
			String dbId = "root";
			String dbPass = "1234";
		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			String sql = "";
			
			sql = "SELECT a.* ,  b.rentStartDate , b.rentEndDate FROM books a JOIN books_on_rent b  on (a.isbn = b.isbn) WHERE b.rentMemID = ? ORDER BY b.rentEndDate";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, in_id);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
		%>	
				<tr>
					<td><%=rs.getInt("isbn") %></td>
					<td><%=rs.getString("title") %></td>
					<td><%=rs.getString("author") %></td>
					<td><%=rs.getString("publisher") %></td>
					<td><%=rs.getString("rentStartDate") %></td>
					<td><%=rs.getString("rentEndDate") %></td>
					<td>
					<form name="tableDataFrom" method="post">
						<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>>
						<input type = "hidden" name = "in_id" value=<%=in_id%> >
						<input type = "hidden" name = "in_pw" value=<%=in_pw%> >
						<input type="submit" value="반납신청" onclick="javascript: form.action='User_page_turnIn.jsp';" />
					</form>
					</td>
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
<br>

</body>
</html>