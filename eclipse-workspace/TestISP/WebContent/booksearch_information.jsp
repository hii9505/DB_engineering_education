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
			<td>ISBN</td> <td>TITLE</td> <td>AUTHOR</td> <td>PUBLISHER</td> <td>MENU</td>
		</tr>
	</thead>
	<tbody>
		<% 
		String book_info = request.getParameter("book_info");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String str = "";
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		String sql = "";
		if(book_info.isEmpty()){
			sql = "SELECT * FROM db_test.books";
		}
		else {
				sql = "SELECT * FROM db_test.books where title = '" + book_info + "'" ;
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
				<td>
				<form name="tableDataFrom" method="post">
				<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>> <!-- ���� jsp�� isbn�� �Ѱ��ֱ����� input. hidden �̶� ����ڿ��� �Ⱥ���. -->
				 	<input type="submit" value="å  ����" onclick="javascript: form.action='booksearch_rent.jsp';"/> 
		
				</form>
				</td>
			</tr>				
		<%
		}
		
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