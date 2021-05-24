<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Update book info</title>
</head>
<body>

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
		String sql = "select *from books where isbn="+isbn;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
%>
<form method="post" action="Admin_page_bookUpdatePro.jsp">
		<ul>
			<li>
				ISBN : <%=rs.getInt("isbn") %> (not allowed to change)
				<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>>
			</li>
			<li>
				Title : <%=rs.getString("Title") %> ->
				<input type="text" name="up_title" value=<%=rs.getString("Title") %>>
			</li> 
			<li>
				Author : <%=rs.getString("Author") %> ->
				<input type="text" name="up_author"value = <%=rs.getString("Author") %>>
			</li>
			<li>
				Publisher: <%=rs.getString("publisher") %> ->
				<input type = "text" name="up_publisher" value = <%=rs.getString("publisher") %>>
			</li>
		</ul>
		
		<input type="submit" value="수정">
		</form>
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

<button onclick="history.back(-1);">돌아가기</button>
</body>
</html>