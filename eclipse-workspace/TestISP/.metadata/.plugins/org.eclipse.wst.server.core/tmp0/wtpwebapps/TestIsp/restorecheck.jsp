<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone_number");
	String pwd = request.getParameter("pwd");
	String stat = request.getParameter("stat");
	String result = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		//db ���� Connection ��ü
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// ������ ����
		String sql ="UPDATE db_test.member SET pw = ? , usr_name = ?, Email = ?, PhoneNum = ? where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, phone);
		pstmt.setString(5,(String)session.getAttribute("id"));
		pstmt.executeUpdate();		
		session.invalidate();
		
		
		
		
		//���� ���� ����
		str = "������ �����Ͽ����ϴ�";
	}catch(Exception e){
		e.printStackTrace();
		str = "������ �����߽��ϴ�.";
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
            <div><font size=5><strong>������ ������ �ٽ� �α������ּ���</strong></font></div>
           <form method="post" action="Homepage.jsp">
           <input type="submit" id = "check" value="Ȯ��">
           </form>
            
        </center>
    </div>
    
</body>
</html>