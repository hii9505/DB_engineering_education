<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Insert book</title>
</head>
<body>
<%
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	int isbn=-1;
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "insert into db_test.books(title,author,publisher) values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, publisher);
		
		pstmt.executeUpdate();
		pstmt.close();
		
		sql = "select isbn,title,author,publisher from db_test.books ORDER BY isbn DESC limit 1 ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
 		if(rs.next())
		{
%>
		<ul>
		 	<li>ISBN : <%=rs.getInt("isbn") %></li>
		 	<li>Title: <%=rs.getString("title") %></li>
		 	<li>Author:<%=rs.getString("author") %></li>
			<li>publisher:<%=rs.getString("publisher") %></li>
		</ul>
<%
		}
		str = "도서 등록 완료.";
	}catch (Exception e){
		e.printStackTrace();
		str = "member 테이블에 새로운 레코드 추가에 실패했습니다."; 
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
<%=str %><br/>
<button onclick="location.href='Admin_page_main.jsp'">돌아가기</button>
</body>
</html>