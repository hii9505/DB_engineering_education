<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="needs.User" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<% 
	
	String in_id="";
	String in_pw="";
	boolean isLogined = false;
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(! (id==null) ){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
			String dbId = "root";
			String dbPass = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			
			String sql = "SELECT * FROM member WHERE id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){ //입력된 아이디가 존재 하면
				if(pw.equals(rs.getString("pw"))){
					in_id = id;
					in_pw = pw;
					isLogined = true;
				} else {
					throw new Exception("패스워드가 틀림.");
				}
			} else {
				throw new Exception("등록 되지 않은 아이디");
			}
			
		
		}catch (Exception e){
			e.printStackTrace();
			out.println(e.getMessage());
		} finally{
			if(rs != null) try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
	}

%>
<title>USER PAGE</title>
</head>
<body>

<hr>
<h2>로그인 정보</h2>
<% if( isLogined ){
	%> 
	<%=in_id %> 님 로그인 하셨습니다.
	<button onclick="location.href='User_page_main.jsp'">로그 아웃</button> <hr>
	<form>
	<input type = "hidden" name = "in_id" value=<%=in_id%> >
	<input type = "hidden" name = "in_pw" value=<%=in_pw%> >
	- 회원메뉴 - <br>
	<input type="submit" value="회원정보 수정" onclick="javascript: form.action='User_page_memDataUpdate.jsp';">
	<input type="submit" value="대여도서 조회" onclick="javascript: form.action='User_page_myRental.jsp';">
	<input type="submit" value="예약도서 조회" onclick="javascript: form.action='User_page_myReservation.jsp';">
	<input type="submit" value="TOP10 조회" onclick="javascript: form.action='User_page_rankPage.jsp';">
	<hr>
	<h2>도서 검색</h2>
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="Title">Title ]<br/>
		<input type = "text" name="searchVal" maxlength = "40">
		<input type="submit" value="검색" onclick="javascript: form.action='User_page_bookSearch.jsp';"> 
		<!--폼 정보 id, searchBy, searchVal  -->
	<br>(아무것도 입력하지 않으면 전체 조회)
	</form>
	<% 
} else {
	%>
	<form>
	<input type="text" maxlength="40" name="id" placeholder="insert id"><br>
	<input type="password" maxlength="40" name="pw" placeholder="insert pw"><br>
	<input type="submit" value = "LOGIN" onclick="javascript: form.action='User_page_main.jsp';">
	</form>
	<button onclick="location.href='User_page_signUp.jsp'">회원 가입</button>
	<%	
}
%>
<hr>
<button onclick="location.href='FRONT_PAGE.jsp'">(개발자용)FrontPage</button>

</body>
</html>