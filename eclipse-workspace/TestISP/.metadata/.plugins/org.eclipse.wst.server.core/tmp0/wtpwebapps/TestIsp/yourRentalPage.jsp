<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="needs.*" %>

<% 
	request.setCharacterEncoding("UTF-8");
%>

<% 
	User user = (User) session.getAttribute("user");
	ArrayList<Rental> rentals = new ArrayList<Rental>();

	Connection connection = null;

	PreparedStatement pstmt = null;
	String message = (String) request.getAttribute("message");
%>

<%
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select ISBN, RentStartDate from db_test.books_on_rent where RentMemid like ? order by RentStartDate desc;";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, user.id);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Rental rental = new Rental();
			rental.isbn = rs.getString(1);
			rental.start = rs.getString(2);
			rentals.add(rental);
		}
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

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
	</head>
	<body>
		<header>
			<h1>welcome, <%= user.id %></h1>
		</header>
		<main id="yourRental">
			<h2>현재 대여 목록</h2>
			<form action="./yourRental.jsp" method="post">
				<table>
				    <thead>
				        <tr>
				            <th>isbn</th>
				            <th>start</th>
				            <th>return?</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<% int j = 1; for (Rental r : rentals) { %>
				    	 <tr>
				            <th><%= r.isbn %></th>
				            <th><%= r.start %></th>
				            <th><input type="checkbox" name="return" value="<%= r.isbn %>" /></th>
				        </tr>
				       <% j++;} if (j == 1) { %>
				    	 <tr>
				            <th colspan="3">대여한 책이 없습니다.</th>
				        </tr>
				        <% } %>
				    </tbody>
				</table>
				<p><input type="submit" value="바로 가기" /></p>
			</form>
		</main>
		<p><%= ((message != null) ? message : "") %></p>
	</body>
</html>