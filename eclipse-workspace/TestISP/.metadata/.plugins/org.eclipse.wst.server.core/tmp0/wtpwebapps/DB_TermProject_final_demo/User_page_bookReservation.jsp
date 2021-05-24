<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Reserve book</title>
</head>
<%
	String isbn = request.getParameter("isbn");
	String in_id = request.getParameter("in_id");
	String in_pw = request.getParameter("in_pw");
	LocalDateTime today = LocalDateTime.now();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String msg = "ȸ�� "+in_id+" �� �� ���� ��û ���.";
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
		String dbId = "root";
		String dbPass = "1234";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		sql = "SELECT * FROM books_on_rent WHERE isbn= ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		rs= pstmt.executeQuery();
		while(rs.next()){ //������ ����
			if(in_id.equals(rs.getString("rentMemid")) ){ //������ ���ʰ� �ƴϸ�
				throw new Exception("���� ���� ������ ���� �� �� �����ϴ�."); 
			}
		} 
		pstmt.clearParameters();
		
		sql = "SELECT * FROM rent_reservation WHERE isbn= ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		rs= pstmt.executeQuery();
		while(rs.next()){ //������ ����
			if(in_id.equals(rs.getString("memid")) ){ //������ ���ʰ� �ƴϸ�
				throw new Exception("�̹� �����Ͻ� �����Դϴ�."); 
			}
		} 
		pstmt.clearParameters();
		
		/* ���� ���� throw �� �߻��ϸ� ���� ������ ������ ��*/

		
		sql = "INSERT INTO rent_reservation VALUES (?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		pstmt.setString(2, in_id);
		pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
		pstmt.executeUpdate();
		pstmt.clearParameters();
%>

<body>
<h2><%=msg %></h2>
<% 
		sql = "SELECT * FROM rent_reservation WHERE isbn="+isbn;
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			%>
			<ul>
				<li>������ȣ <%=rs.getInt("isbn") %></li>
				<li>��ûID <%=rs.getString("MemID") %></li>
				<li>�뿩���� <%=rs.getString("reserve_date") %></li>
			</ul>
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

<hr>
<form method="post" action = "User_page_main.jsp">
	<input type="hidden" name="id" value =<%=in_id %> >
	<input type="hidden" name="pw" value = <%=in_pw %> >
	<input type="submit" value="���� ������ ���ư���">
</form>
</body>
</html>