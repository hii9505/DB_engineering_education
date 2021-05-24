<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Update member info</title>
</head>
<body>

<% 
	String id = request.getParameter("id");
	out.print("id:"+id);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/termproject";
		String dbId = "root";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		String sql = "select *from member where id= ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next()){
		%>
		<form method="post" action="Admin_page_memberDataUpdatePro.jsp">
		<ul>
			<li>
				ID : <%=rs.getString("id") %> (not allowed to change)
				<input type="hidden" name="id" value=<%=rs.getString("id") %>>
			</li>
			<li>
				PW : <%=rs.getString("pw") %> ->
				<input type="text" name="up_pw" value=<%=rs.getString("pw") %>>
			</li> 
			<li>
				NAME : <%=rs.getString("usr_name") %> ->
				<input type="text" name="up_name"value = <%=rs.getString("usr_name") %>>
			</li>
			<li>
				EMAIL: <%=rs.getString("email") %> ->
				<input type = "text" name="up_email" value = <%=rs.getString("email") %>>
			</li>
			<li>
				Phone: <%=rs.getString("phoneNum") %> ->
				<input type = "text" name="up_phone" value = <%=rs.getString("phoneNum") %>>
			</li>
		</ul>
		 <%
		 if (rs.getString("memStat").equals("student")){
			 %>
			    구분: <input type="RADIO" id = "stat" name = "stat" value=student CHECKED>학부생
                      <input type="RADIO" id = "stat" name = "stat" value=graduated>대학원생
                      <input type="RADIO" id = "stat" name = "stat" value=faculty_member>교직원</br>
			 <%
		 } else if(rs.getString("memStat").equals("graduated")){
			 %>
			    구분: <input type="RADIO" id = "stat" name = "stat" value=student >학부생
                      <input type="RADIO" id = "stat" name = "stat" value=graduated checked>대학원생
                      <input type="RADIO" id = "stat" name = "stat" value=faculty_member>교직원</br>
			 <%
		 } else { //faculty member
			 %>
			    구분: <input type="RADIO" id = "stat" name = "stat" value=student>학부생
                      <input type="RADIO" id = "stat" name = "stat" value=graduated>대학원생
                      <input type="RADIO" id = "stat" name = "stat" value=faculty_member checked>교직원</br>
			 <%
		 }
		 %>
		<input type="submit" value="수정">
		</form>
		<% 
		}
	}catch (Exception e){
		e.printStackTrace();
		str = "member 테이블에 새로운 레코드 추가에 실패했습니다."; 
	} finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>

<button onclick="history.back(-1);">돌아가기</button>
</body>
</html>