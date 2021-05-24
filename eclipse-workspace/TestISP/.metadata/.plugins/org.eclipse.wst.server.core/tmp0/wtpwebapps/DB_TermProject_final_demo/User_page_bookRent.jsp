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
	String msg = "회원 "+in_id+" 님 ";
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
			throw new Exception("이미 대출 중인 도서입니다.");
		} 
		pstmt.clearParameters();
		
		sql = "SELECT * FROM rent_reservation WHERE isbn= ? ORDER BY reserve_date LIMIT 1";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		rs= pstmt.executeQuery();
		if(rs.next()){ //예약자 존재
			if(! in_id.equals(rs.getString("memid")) ){ //예약자 차례가 아니면
				throw new Exception("선 예약자가 있습니다."); 
			}
		} 
		pstmt.clearParameters();
		
		/* 여기 까지 throw 안 발생하면 대출 가능한 상태인 것*/
		//
		sql = "SELECT memstat FROM member WHERE id = ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, in_id);
		rs= pstmt.executeQuery();
		if(rs.next()){
			if(rs.getString("memstat").equals("graduated")){
				msg += " 대학원생 신분으로 대여기간은 30일 입니다.";
				period = 30;
			} else if (rs.getString("memstat").equals("faculty_member") ){
				msg += " 교직원 신분으로 대여기간은 60일 입니다.";
				period = 60;
			} else {
				msg += " 학생 및 기타 신분으로 대여기간은 10일 입니다.";
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
<h2>신청 결과</h2>
<% 
		sql = "SELECT * FROM books_on_rent WHERE isbn="+isbn;
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			%>
			<ul>
				<li>고유번호 <%=rs.getInt("isbn") %></li>
				<li>신청ID <%=rs.getString("RentMemID") %></li>
				<li>대여시작 <%=rs.getString("RentStartDate") %></li>
				<li>반납기한 <%=rs.getString("RentEndDate") %></li>
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
	<input type="submit" value="메인 페이지 돌아가기">
</form>
</body>
</html>