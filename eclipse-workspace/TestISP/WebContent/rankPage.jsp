<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="needs.User" %>

<% 
	request.setCharacterEncoding("UTF-8"); 
	LocalDate today = LocalDate.now();
	LocalDate startOfMonth = today.withDayOfMonth(1);
	LocalDate endOfMonth = today.withDayOfMonth(today.lengthOfMonth());
%>

<% 
	User user = (User) session.getAttribute("user");
	ArrayList<String> top10 = new ArrayList<String>();

	Connection connection = null;

	PreparedStatement pstmt = null;
	String startDate = (request.getParameter("start") != null) ? request.getParameter("start") : startOfMonth.format(DateTimeFormatter.ISO_LOCAL_DATE);
	String endDate = (request.getParameter("end") != null) ? request.getParameter("end") : endOfMonth.format(DateTimeFormatter.ISO_LOCAL_DATE);
	String message = (String) request.getAttribute("message");
%>

<%
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";	
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		if (startOfMonth.isBefore(endOfMonth) || startOfMonth.isEqual(endOfMonth)) {
			String sql = "select RentMemid from db_test.Books_On_Rent where RentStartDate between ? and ? group by RentMemId order by count(RentMemId) desc limit 10;";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				top10.add(rs.getString(1));
			}
		}
		else {
			request.setAttribute("message", "start date is after the end date");
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
		<main id="rank">
			<h2>홈</h2>
			<form action="./rankPage.jsp" method="post">
			    <p><label for="start"><input type="date" name="start" id="start" value="<%= startDate %>" pattern="\d{4}-\d{2}-\d{2}" required="required" /> 부터</label> <label for="end"><input type="date" name="end" id="end" value="<%= endDate %>" pattern="\d{4}-\d{2}-\d{2}" required="required" /> 까지</label></p>
			    <p><input type="submit" value="바로 가기" /></p>
				<table>
				    <thead>
				        <tr>
				            <th>rank</th>
				            <th>name</th>
				        </tr>
				    </thead>
				    <tbody>
				    	<% int i = 1; for (String member : top10) { %>
				    	 <tr>
				            <th><%= i++ %></th>
				            <th><%= member %></th>
				        </tr>
				       <% } if (i == 1) { %>
				    	 <tr>
				            <th colspan="2">대여 기록이 없습니다.</th>
				        </tr>
				        <% } %>
				    </tbody>
				</table>
			</form>
		</main>
		<p><%= ((message != null) ? message : "") %></p>
	</body>
</html>