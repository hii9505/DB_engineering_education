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
<title>Rent Book</title>
</head>
<%
	String isbn = request.getParameter("isbn");
	String in_id = request.getParameter("in_id");
	String in_pw = request.getParameter("in_pw");
	LocalDate today = LocalDate.now();
	int period = 10;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String msg = "ȸ�� "+in_id+" �� ";
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
		String dbId = "root";
		String dbPass = "1234";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
		sql = "SELECT * FROM books_on_rent WHERE isbn="+isbn;
		pstmt=conn.prepareStatement(sql);
		rs= pstmt.executeQuery();
		if(rs.next() ){
			throw new Exception("�̹� ���� ���� �����Դϴ�.");
		} 
		pstmt.clearParameters();
		
		sql = "SELECT * FROM rent_reservation WHERE isbn= ? ORDER BY reserve_date LIMIT 1";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		rs= pstmt.executeQuery();
		if(rs.next()){ //������ ����
			if(! in_id.equals(rs.getString("memid")) ){ //������ ���ʰ� �ƴϸ�
				throw new Exception("�� �����ڰ� �ֽ��ϴ�."); 
			}
		} 
		pstmt.clearParameters();
		
		/* ���� ���� throw �� �߻��ϸ� ���� ������ ������ ��*/
		//
		sql = "SELECT memstat FROM member WHERE id = ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, in_id);
		rs= pstmt.executeQuery();
		if(rs.next()){
			if(rs.getString("memstat").equals("graduated")){
				msg += " ���п��� �ź����� �뿩�Ⱓ�� 30�� �Դϴ�.";
				period = 30;
			} else if (rs.getString("memstat").equals("faculty_member") ){
				msg += " ������ �ź����� �뿩�Ⱓ�� 60�� �Դϴ�.";
				period = 60;
			} else {
				msg += " �л� �� ��Ÿ �ź����� �뿩�Ⱓ�� 10�� �Դϴ�.";
				period = 10;
			}
		}
		pstmt.clearParameters();
		
		sql = "INSERT INTO books_on_rent values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		pstmt.setString(2, in_id);
		pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE));
		pstmt.setString(4, today.plusDays(period).format(DateTimeFormatter.ISO_LOCAL_DATE));
		pstmt.executeUpdate();
		pstmt.clearParameters();
		
		sql = "INSERT INTO rental_record VALUES(?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		pstmt.setString(2, in_id);
		pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE));
		pstmt.executeUpdate();
		pstmt.clearParameters();
%>

<body>
<h2>��û ���</h2>
<% 
		sql = "SELECT * FROM books_on_rent WHERE isbn="+isbn;
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			%>
			<ul>
				<li>������ȣ <%=rs.getInt("isbn") %></li>
				<li>��ûID <%=rs.getString("RentMemID") %></li>
				<li>�뿩���� <%=rs.getString("RentStartDate") %></li>
				<li>�ݳ����� <%=rs.getString("RentEndDate") %></li>
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
<%=msg %>
<hr>
<form method="post" action = "User_page_main.jsp">
	<input type="hidden" name="id" value =<%=in_id %> >
	<input type="hidden" name="pw" value = <%=in_pw %> >
	<input type="submit" value="���� ������ ���ư���">
</form>
</body>
</html>