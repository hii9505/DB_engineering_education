<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="needs.User" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% 
	String[] isbns = request.getParameterValues("return");
	LocalDate today = LocalDate.now();
	User user = (User) session.getAttribute("user");

	Connection connection = null;
	PreparedStatement pstmt = null;
%>

<%
	try {
		RequestDispatcher rd =request.getRequestDispatcher("./yourRentalPage.jsp");
		
		if (isbns == null)
			request.setAttribute("message", "return failed");
		else {
			String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPass = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

			String sql = "insert into db_test.turn_in_request(ISBN, MemId, request_date) values(?, ?, ?);";
			pstmt = connection.prepareStatement(sql);
			
			int r = 0;
			
			for (String isbn : isbns) {
				pstmt.setString(1, isbn);
				pstmt.setString(2, user.id);
				pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE));
				r = pstmt.executeUpdate();
				pstmt.clearParameters();
			}
		}
		rd.forward(request, response);
	}
	catch (Exception e){
		e.printStackTrace();
	}
	finally {
		if (pstmt != null)
			try{pstmt.close();}catch(SQLException sqle){}
		if (connection != null)
			try{connection.close();}catch(SQLException sqle){}
	}
%>