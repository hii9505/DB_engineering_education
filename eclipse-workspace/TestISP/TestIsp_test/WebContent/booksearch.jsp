<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<%


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
		String sql ="select Id, Pw from db_test.member ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		

		

		//���� ���� ����
		str = "member ������ �������µ� ���� ";
	}catch(Exception e){
		e.printStackTrace();
		str = "������ �������µ� �����߽��ϴ�.";
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
        background: green;
        
        border: 1px white;
        height: 50px;
        width: 50px;
        font-size: large;
        color: white;
    }

</style>

<body>
	
	 <div id = "background">
        <center>
            <div><font size=5><strong>���� ��� �˻�</strong></font></div>
           <form method="post" action="booksearch_information.jsp">
           <div>
           <input type="text" id ="book_info" name="book_info" placeholder="���� ���� �˻�">
           </div>
           <input type="submit" id = "check" value="Ȯ��">
           
        </center>
    </div>
    
</body>
</html>