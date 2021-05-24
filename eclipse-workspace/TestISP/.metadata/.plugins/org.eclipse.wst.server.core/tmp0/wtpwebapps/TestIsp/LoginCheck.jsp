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
		
		//db ���� Connection ��ü
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// ������ ����
		String sql ="select id, Memstat,email,PhoneNum from db_test.member where id like ? and pw like ?; ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		rs = pstmt.executeQuery();
		

		
		
			if(rs.next()){
				result = "�α��ο� ���� �Ͽ����ϴ�.";
				session.setAttribute("id",id);
				session.setAttribute("pwd",pwd); //���� ����
				user.id = rs.getString(1);
				user.position = rs.getString(2);
				user.email = rs.getString(3);
				user.phone = rs.getString(4);	
				session.setAttribute("Memstat", rs.getString(2));
				session.setAttribute("user", user);
			}else{
				result = "���̵� ��й�ȣ�� ���� �ʽ��ϴ�. �ٽ� �Է����ֽʽÿ�";
				
			}
		
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
           <input type="submit" id = "check" value="Ȯ��">
           </form>
            
        </center>
    </div>
    
</body>
</html>