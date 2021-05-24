<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Update book</title>
</head>
<body>
<% 
	String isbn = request.getParameter("isbn");
	String title = request.getParameter("up_title");
	String author = request.getParameter("up_author");
	String publisher = request.getParameter("up_publisher");
	

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
		String sql = "UPDATE books SET title = ? ,author = ? , publisher = ? WHERE isbn = "+isbn;
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, publisher);
		pstmt.executeUpdate();
		
		sql = "SELECT * FROM books Where isbn ="+isbn;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
		%>
		정보가 수정됐습니다.
		<ul>
			<li>ISBN : <%=rs.getInt("isbn") %></li>
			<li>Title : <%=rs.getString("Title") %> </li> 
			<li>Author : <%=rs.getString("Author") %></li>
			<li>Publisher: <%=rs.getString("publisher") %></li>			
		</ul>
		<%
		}
	}catch (Exception e){
		e.printStackTrace();
		str = "member 테이블에 새로운 레코드 추가에 실패했습니다."; 
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>

<button onclick="location.href='Admin_page_main.jsp'">돌아가기</button>
</body>
</html>