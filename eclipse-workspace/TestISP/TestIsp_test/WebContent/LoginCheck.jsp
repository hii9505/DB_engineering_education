<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="needs.User" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%
    User user = new User();
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String result = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		//db 연동 Connection 객체
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// 쿼리를 수행
		String sql ="select id, Memstat,email,PhoneNum from db_test.member where id like ? and pw like ?; ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		rs = pstmt.executeQuery();
		

		
		
			if(rs.next()){
				result = "로그인에 성공 하였습니다.";
				session.setAttribute("id",id);
				session.setAttribute("pwd",pwd); //삭제 고려
				user.id = rs.getString(1);
				user.position = rs.getString(2);
				user.email = rs.getString(3);
				user.phone = rs.getString(4);	
				session.setAttribute("Memstat", rs.getString(2));
				session.setAttribute("user", user);
			}else{
				result = "아이디나 비밀번호가 맞지 않습니다. 다시 입력해주십시오";
				
			}
		
		//쿼리 성공 수행
		str = "member 변수를 가져오는데 성공 ";
	}catch(Exception e){
		e.printStackTrace();
		str = "변수를 가져오는데 실패했습니다.";
	}finally{
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>
<!DOCTYPE html html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html "charset="EUC-KR">
<title>레코드 추가</title>
</head>
<style>

#background{
        background: #cccccc;
        height: 1000px;
    }

    #check{
        background: red;
        border: 1px white;
        height: 50px;
        width: 400px;
        font-size: large;
        color: white;
    }

</style>

<body>
	
	 <div id = "background">
        <center>
            <div><font size=5><strong><%=result%></strong></font></div>
           <form method="post" action="homepage_interpreter.jsp">
           <input type="submit" id = "check" value="확인">
           </form>
            
        </center>
    </div>
    
</body>
</html>