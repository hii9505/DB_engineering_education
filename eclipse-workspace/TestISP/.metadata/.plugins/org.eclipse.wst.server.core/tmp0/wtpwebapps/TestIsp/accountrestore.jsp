<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>


<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_test?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "1234";
		
		//db ���� Connection ��ü
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		// ������ ����
		String sql ="select * from db_test.member where id=?";
		pstmt = conn.prepareStatement(sql);
		
		rs=pstmt.executeQuery();
		while (rs.next())
		
		
		
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

    #title{
        background: black;
    }

   
    #Line_front{
        background: black;
        height: 50px;
        width: 600px;
    }

    #id{
        height: 25px;
        width: 500px;
    }

    #name{
        height: 25px;
        width: 500px;
    }


    #email{
        height: 25px;
        width: 500px;
    }

    #phone_number{
        height: 25px;
        width: 500px;
    }

    #pwd{
        height: 25px;
        width: 500px;
    }

    #pwd_check{
        height: 25px;
        width: 500px;
    }
    



</style>
<body>


<div id = "background">
        <div id = "container">        
            <div id="title"><font size="10" color="red"><strong>DB05</strong></font></div>
        </div>
        <center>
             <p>
                 <div><strong>���̵� �̿ܿ� �����Ͻ� ������ �Է��ϼ���</strong></div>
             </p>   

		 	<form method="post" action="restorecheck.jsp">
          			<div>���̵�: <%= (String)session.getAttribute("id") %></div>
          			��й�ȣ:<input type="text" id = "pwd" name = "pwd" placeholder="��й�ȣ"></br>
                                             �̸���   :<input type="text" id = "email" name = "email" placeholder="�̸���"></br>
                                             ��ȭ��ȣ:<input type="text" id = "phone_number" name = "phone_number" placeholder="��ȭ��ȣ"></br>
                   	�̸�      :<input type="text" id = "name" name = "name" placeholder="�̸�"></br>
                   	����: <input type="RADIO" id = "stat" name = "stat" value=Undergrduate CHECKED>�кλ�
                   	<input type="RADIO" id = "stat" name = "stat" value=Graduate_school>���п���
                   	<input type="RADIO" id = "stat" name = "stat" value=faculty_member>������</br>
            <input type="submit" value="Ȯ��" onclick="Question();">
            
		 	</form>
        </center>    
</div>

    

</body>

<script type="text/javascript">


function Question(){
	
var result = confirm("�����Ͻðھ��:?");
	
	if(result)
		{
			document.write("<h1> �����մϴ�. </h1>")
					<form method="post" action="restorecheck.jsp">
					<input type="submit" value="Ȯ��" onclick="Question();">
					</form>")
		}
	else{
			document.write("<h1> ���� ������ ����Ͽ����ϴ�. </h1>")
	}
	
}
	

</script>
</html>