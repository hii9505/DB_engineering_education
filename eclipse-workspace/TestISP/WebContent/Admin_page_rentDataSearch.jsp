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
<h2>�˻� ���</h2>
<table width = "100%" border = "1">
	<thead>
		<tr>
			<td>ISBN</td>	<td>TITLE</td>	<td>AUTHOR</td>	<td>PUBLISHER</td>
			<td>RentMem ID</td> <td>Start Date</td> <td>End Date</td> <td>MENU</td>
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
			if(searchVal.isEmpty()){ //������ ��� ��ü �˻�
				sql = "SELECT a.* , b.rentMemID, b.rentStartDate , b.RentEndDate From Books a Join Books_on_rent b  on (a.isbn = b.isbn)";
			}
			else { 
				if(searchBy.compareTo("ISBN")==0){  //isbn ���� �˻�
					sql = "SELECT a.* , b.rentMemID, b.rentStartDate , b.RentEndDate From Books a Join Books_on_rent b  on (a.isbn = b."+searchVal+")";
				}
				else if(searchBy.compareTo("Title")==0){ //�������� �˻�
					sql = "SELECT a.* , b.rentMemID, b.rentStartDate , b.RentEndDate From Books a Join Books_on_rent b  on (a.isbn = b.isbn) WHERE a.title LIKE '%"+searchVal+"%'";
				}
				else { // SEARCH BY MEMBER ID
					sql = "SELECT a.* , b.rentMemID, b.rentStartDate , b.RentEndDate From Books a Join Books_on_rent b  on (a.isbn = b.isbn) WHERE b.rentMemID LIKE '%"+searchVal+"%'";
				}
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
		%>	
				<tr>
					<td><%=rs.getInt("isbn") %></td>
					<td><%=rs.getString("title") %></td>
					<td><%=rs.getString("author") %></td>
					<td><%=rs.getString("publisher") %></td>
					<td><%=rs.getString("rentMemId") %></td>
					<td><%=rs.getString("rentStartDate") %></td>
					<td><%=rs.getString("rentEndDate") %></td>
					<td>
					<form name="tableDataFrom" method="post">
					<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>> <!-- ���� jsp�� isbn�� �Ѱ��ֱ����� input. hidden �̶� ����ڿ��� �Ⱥ���. -->
						<input type="submit" value="�뿩 ���� ����" onclick="javascript: form.action='Admin_page_rentUpdate.jsp';" />
						<input type="submit" value="������ Ȯ��" onclick="javascript: form.action='Admin_page_reservationCheck.jsp';" />
						<input type="submit" value="����" onclick="javascript: form.action='Admin_page_rentDelete.jsp';" />
						<input type="text" maxlength="10" name="sureDelete" placeholder="Type'delete'& Push btn"> 
					</form>
					</td>
				</tr>
							
	<%		}
	}catch (Exception e){
		e.printStackTrace();
		str = "member ���̺��� ���ο� ���ڵ� �߰��� �����߽��ϴ�."; 
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
	</tbody>
</table>
<br/>
<button onclick="location.href='Admin_page_main.jsp'">���ư���</button>

</body>
</html>