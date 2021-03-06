<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="needs.*" %>

<% 
	request.setCharacterEncoding("UTF-8");
%>

<% 
	User user = (User) session.getAttribute("user");
	ArrayList<Reservation> reservations = new ArrayList<Reservation>();

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
		
		String sql = "select ISBN, reserve_date from db_test.rent_reservation where Memid like ? order by reserve_date desc;";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, user.id);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Reservation reservation = new Reservation();
			reservation.isbn = rs.getString(1);
			reservation.start = rs.getString(2);
			reservations.add(reservation);
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
		<link rel="stylesheet" href="./css/style.css" />
	</head>
	<body>
		<header>
			<h1>welcome, <%= user.id %></h1>
		</header>
		<main id="yourReservation">
			<h2>현재 예약 목록</h2>
			<form action="./yourReservation.jsp" method="post">
				<table>
				    <thead>
				        <tr>
				            <th>isbn</th>
				            <th>start</th>
				            <th>cancel?</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<% int k = 1; for (Reservation r : reservations) { %>
				    	 <tr>
				            <th><%= r.isbn %></th>
				            <th><%= r.start %></th>
				            <th><input type="checkbox" name="cancel" value="<%= r.isbn %>" /></th>
				        </tr>
				       <% k++;} if (k == 1) { %>
				    	 <tr>
				            <th colspan="3">예약된 책이 없습니다.</th>
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