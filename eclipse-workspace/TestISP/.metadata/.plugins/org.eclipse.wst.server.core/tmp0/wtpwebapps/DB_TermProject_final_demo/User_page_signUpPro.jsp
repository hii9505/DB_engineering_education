<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>회원 가입</title>
</head>
<body>
<%
	String[] info = {
		request.getParameter("id"), //0
		request.getParameter("pw"), //1
		request.getParameter("name"),//2
		request.getParameter("email"),//3
		request.getParameter("phone"),//4
		request.getParameter("stat")//5
	};
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		for(int i=0 ; i<info.length ; i++){
			if(info[i]==null){
				throw new Exception("입력되지 않은 정보가 있습니다.");
			}
		}
		String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		String sql = "SELECT id FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, info[0]);
		rs = pstmt.executeQuery();
		if(rs.next()){
			throw new Exception("중복된 아이디가 있습니다");
		}
		
		sql = "INSERT INTO member(id,pw,usr_name,Email,phonenum,memstat) VALUES(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		for(int i = 0; i<info.length ; i++){
			pstmt.setString(i+1, info[i]);
		}
		pstmt.executeUpdate();
	}catch (Exception e){
		e.printStackTrace();
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
<br>회원가입 완료. 메인페이지로 가서 로그인하세요.<br>
<button onclick="location.href='User_page_main.jsp'">메인페이지로</button> 
</body>
</html>