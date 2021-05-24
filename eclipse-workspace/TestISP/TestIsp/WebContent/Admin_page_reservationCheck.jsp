<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Check Reservation</title>
</head>
<body>
<h3>�ش� ������ ���� ������ ����Ʈ</h3>
<table width="100%" border=1>
<thead>
	<tr>
		<td>ISBN</td><td>ID</td><td>reserveDate</td>
	</tr>
</thead>
<% 
	String isbn = request.getParameter("isbn");
	
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
		String sql = "select *from rent_reservation where isbn="+isbn+" ORDER BY reserve_date";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();	
		while(rs.next()){
			%>
			<tr>
				<td> <%=rs.getInt("ISBN") %></td>
				<td> <%=rs.getString("MemID") %></td>
				<td> <%=rs.getString("reserve_date") %></td>
			</tr>
			<%
		}
	}catch (Exception e){
		e.printStackTrace();
		str = "member ���̺� ���ο� ���ڵ� �߰��� �����߽��ϴ�."; 
		out.print(str);
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
</table>

<button onclick="history.back(-1);">���ư���</button>
</body>
</html>