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
<h2>회원 정보를 수정합니다.</h2>
<%  
String id = request.getParameter("in_id");
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
	String sql = "SELECT * FROM MEMBER WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
%>
<form method="post" >
	<ul>
		<li>
			ID : <%=rs.getString("id") %> (not allowed to change)
			<input type="hidden" name="id" value=<%=rs.getString("id") %>>
		</li>
		<li>
			새로운 PW : <input type="password" name="up_pw" placeholder="새로운 패스워드 입력">
					<input type="hidden" name="old_pw" value = <%=rs.getString("pw") %>>
		</li> 
		<li>
			name : <input type="text" name="up_name"value = <%=rs.getString("usr_name") %>>
		</li>
		<li>
			e-mail :<input type = "text" name="up_email" value = <%=rs.getString("email") %>>
		</li>
		<li>
			Phone :<input type = "text" name="up_phone" value = <%=rs.getString("phoneNum") %>>
		</li>
		<li>
			STAT : <%=rs.getString("memStat") %> (now allowed to change);
			<input type="hidden" name="stat" value = <%=rs.getString("memStat") %>>
		</li>
	</ul>
	
	<input type="submit" value="수정" onclick="javascript: form.action='User_page_memDataUpdatePro.jsp';"> 
	<input type="submit" value="회원탈퇴" onclick="javascript: form.action='User_page_memWithdrawl.jsp';" />
	<input type="text" maxlength="10" name="sureDelete" placeholder="Type'delete'& Push btn">
	</form>
<% 
	}
}catch (Exception e){
	e.printStackTrace();
	out.println("데이터 조회 오류 발생");
} finally{
	if(rs != null) try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>

<button onclick="history.back(-1);">돌아가기</button>
</body>
</html>