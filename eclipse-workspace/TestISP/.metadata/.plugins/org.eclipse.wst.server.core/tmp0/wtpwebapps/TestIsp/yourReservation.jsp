<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="needs.User" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% 
	String[] isbns = request.getParameterValues("cancel");
	User user = (User) session.getAttribute("user");

	Connection connection = null;
	PreparedStatement pstmt = null;
%>

<%
	try {
		RequestDispatcher rd =request.getRequestDispatcher("./yourReservationPage.jsp");
		if (isbns == null)
			request.setAttribute("message", "cancel failed");
		else {
			String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPass = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

			String sql = "delete from db_test.rent_reservation where MemId like ? and ISBN like ?;";
			pstmt = connection.prepareStatement(sql);
			
			int r = 0;
			
			for (String isbn : isbns) {
				pstmt.setString(1, user.id);
				pstmt.setString(2, isbn);
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