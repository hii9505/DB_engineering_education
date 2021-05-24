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
			if(rs.next()){ //�Էµ� ���̵� ���� �ϸ�
				if(pw.equals(rs.getString("pw"))){
					in_id = id;
					in_pw = pw;
					isLogined = true;
				} else {
					throw new Exception("�н����尡 Ʋ��.");
				}
			} else {
				throw new Exception("��� ���� ���� ���̵�");
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
<h2>�α��� ����</h2>
<% if( isLogined ){
	%> 
	<%=in_id %> �� �α��� �ϼ̽��ϴ�.
	<button onclick="location.href='User_page_main.jsp'">�α� �ƿ�</button> <hr>
	<form>
	<input type = "hidden" name = "in_id" value=<%=in_id%> >
	<input type = "hidden" name = "in_pw" value=<%=in_pw%> >
	- ȸ���޴� - <br>
	<input type="submit" value="ȸ������ ����" onclick="javascript: form.action='User_page_memDataUpdate.jsp';">
	<input type="submit" value="�뿩���� ��ȸ" onclick="javascript: form.action='User_page_myRental.jsp';">
	<input type="submit" value="���൵�� ��ȸ" onclick="javascript: form.action='User_page_myReservation.jsp';">
	<input type="submit" value="TOP10 ��ȸ" onclick="javascript: form.action='User_page_rankPage.jsp';">
	<hr>
	<h2>���� �˻�</h2>
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="Title">Title ]<br/>
		<input type = "text" name="searchVal" maxlength = "40">
		<input type="submit" value="�˻�" onclick="javascript: form.action='User_page_bookSearch.jsp';"> 
		<!--�� ���� id, searchBy, searchVal  -->
	<br>(�ƹ��͵� �Է����� ������ ��ü ��ȸ)
	</form>
	<% 
} else {
	%>
	<form>
	<input type="text" maxlength="40" name="id" placeholder="insert id"><br>
	<input type="password" maxlength="40" name="pw" placeholder="insert pw"><br>
	<input type="submit" value = "LOGIN" onclick="javascript: form.action='User_page_main.jsp';">
	</form>
	<button onclick="location.href='User_page_signUp.jsp'">ȸ�� ����</button>
	<%	
}
%>
<hr>
<button onclick="location.href='FRONT_PAGE.jsp'">(�����ڿ�)FrontPage</button>

</body>
</html>