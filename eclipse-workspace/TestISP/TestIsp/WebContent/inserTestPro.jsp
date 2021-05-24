<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone_number");
	String pwd = request.getParameter("pwd");
	String stat = request.getParameter("stat");
	
	Timestamp register = new Timestamp(System.currentTimeMillis()); // ���糯¥ �ð�
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		//db ���� Connection ��ü
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// ������ ����
		String sql ="insert into db_test.member values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setString(6, stat);
		pstmt.executeUpdate();
		
		//���� ���� ����
		str = "member ���̺� ���ο� ���ڵ带 �߰��߽��ϴ�  Ȯ��";
	}catch(Exception e){
		e.printStackTrace();
		str = "member ���̺� ���ο� ���ڵ带 �߰��� �����߽��ϴ�.";
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>
<!DOCTYPE html html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html "charset="EUC-KR">
<title>���ڵ� �߰�</title>
</head>
<body>
	
	<center>
	<%=str %>
	<form method="post" action="Homepage.jsp">
		<input type="submit" value="Ȯ��">
	</form>
	<center/>
<div>�ȳ�</div>
</body>
</html>