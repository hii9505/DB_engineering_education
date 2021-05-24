<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Search reservation Data</title>
</head>
<body>
<h2>검색 결과</h2>
<table width = "100%" border = "1">
	<thead>
		<tr>
			<td>ISBN</td>	<td>usrID</td>	<td>reserve date</td>	<td>MENU</td>
		</tr>
	</thead>
	<tbody>
		<% 
		String searchBy = request.getParameter("searchBy");
		String searchVal = request.getParameter("searchVal");

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
			String sql = "";
			if(searchVal.isEmpty()){ //공란일 경우 전체 검색
				sql = "SELECT * FROM rent_reservation";
			}
			else { 
				if(searchBy.compareTo("ISBN")==0){  //isbn 으로 검색
					sql = "SELECT * FROM rent_reservation WHERE isbn="+searchVal;
				}
				else { // SEARCH BY MEMBER ID
					sql = "SELECT * FROM rent_reservation WHERE memId LIKE '%"+searchVal+"%'";
				}
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
		%>	
				<tr>
					<td><%=rs.getInt("isbn") %></td>
					<td><%=rs.getString("memId") %></td>
					<td><%=rs.getString("reserve_date") %></td>
					<td>
					<form name="tableDataFrom" method="post">
					<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>>
					<input type="hidden" name="id" value=<%=rs.getString("memId") %>>
						<input type="submit" value="삭제" onclick="javascript: form.action='Admin_page_reservationDelete.jsp';" />
					</form>
					</td>
				</tr>
							
	<%		}
			
			
			
	}catch (Exception e){
		e.printStackTrace();
		str = "member 테이블에 새로운 레코드 추가에 실패했습니다."; 
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