<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Rental Info</title>
</head>
<body>

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
		String sql = "select *from books_on_rent where isbn="+isbn;
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();	
		
		
		if(rs.next()){
		%>
		<form method="post" action="Admin_page_rentUpdatePro.jsp">
			<hr>
			<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>>
			RentMemberID : <%=rs.getString("rentMemID") %> -> <input type="text" name="up_rentMemID"value = <%=rs.getString("rentMemID") %>> <br/>
			RentStartDate: <%=rs.getDate("rentStartDate") %> -> <input type = "date" name="up_rentStartDate" value = <%=rs.getString("rentStartDate") %>><br/>
			RendEndDate : <%=rs.getDate("rentEndDate") %> -> <input type = "date" name="up_rentEndDate" value = <%=rs.getString("rentEndDate") %>><br/>
			<hr>
			<input type="submit" value="����">
		</form>
		<% 
		}
	}catch (Exception e){
		e.printStackTrace();
		str = "member ���̺� ���ο� ���ڵ� �߰��� �����߽��ϴ�."; 
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
<button onclick="history.back(-1);">���ư���</button>
</body>
</html>