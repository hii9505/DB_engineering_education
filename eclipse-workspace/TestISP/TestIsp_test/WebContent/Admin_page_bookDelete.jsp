<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<% 
	String isbn = request.getParameter("isbn");

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
		
		String sql = "SELECT * FROM books WHERE isbn = "+isbn;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Delete book</title>
</head>
<body>
<% if(rs.next()){
%>
		<form method = "post" action = "Admin_page_bookDeletePro.jsp">
		<hr>
		<ul>
			<li>
				ISBN : <%=rs.getInt("isbn") %>
			</li>
			<li>
				Title : <%=rs.getString("Title") %> 
			</li> 
			<li>
				Author : <%=rs.getString("Author") %>
			</li>
			<li>
				Publisher: <%=rs.getString("publisher") %> 
			</li>
		</ul>
		<hr>
		<p>�� ���� ������ �����ͺ��̽����� ���� �����մϱ�?</p>	 
		<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>>
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

<button onclick="location.href='Admin_page_main.jsp'">���ư���</button>
</body>
</html>