<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Search Member</title>
</head>
<body>
<h2>검색 결과</h2>
<table width = "100%" border = "1">
	<thead>
		<tr>
			<td>ID</td> <td>PW</td> <td>NAME</td> <td>EMAIL</td> <td>PHONE</td> <td>STAT</td> <td>MENU</td>
		</tr>
	</thead>
	<tbody>
		<% 
		String searchBy = request.getParameter("searchBy");
		String searchVal = request.getParameter("searchVal");
		String isStudent = request.getParameter("check_student");
		String isGraduated = request.getParameter("check_graduated");
		String isFaculty_member = request.getParameter("check_faculty_member");
		
		//out.println(searchBy+" "+searchVal+" "+isStudent+" "+isGraduated+" "+isProfessor);
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
		String sql = "";
		if(searchVal.isEmpty()){
			sql = "SELECT * FROM member WHERE memstat= ? OR memstat= ? OR memstat=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isStudent);
			pstmt.setString(2, isGraduated);
			pstmt.setString(3, isFaculty_member);
			
		}
		else {
			if(searchBy.equals("ID")){
				sql = "SELECT * FROM member WHERE id= ? AND (memstat= ? OR memstat= ? OR memstat=?)";
			} else if(searchBy.equals("Name")){
				sql = "SELECT * FROM member WHERE usr_name= ? AND (memstat= ? OR memstat= ? OR memstat=?)";
			} else if(searchBy.equals("Email")){
				sql = "SELECT * FROM member WHERE email= ? AND (memstat= ? OR memstat= ? OR memstat=?)";
			} else if(searchBy.equals("Phone")){
				sql = "SELECT * FROM member WHERE phoneNum= ? AND (memstat= ? OR memstat= ? OR memstat=?)";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchVal);
			pstmt.setString(2, isStudent);
			pstmt.setString(3, isGraduated);
			pstmt.setString(4, isFaculty_member);
			
		}
		rs = pstmt.executeQuery();
		while (rs.next())
		{
		%>	
			<tr>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("pw") %></td>
				<td><%=rs.getString("usr_name") %></td>
				<td><%=rs.getString("email") %></td>
				<td><%=rs.getString("phoneNum") %></td>
				<td><%=rs.getString("memstat") %></td>
				<td>
				<form name="tableDataFrom" method="post">
				<input type="hidden" name="id" value=<%=rs.getString("id") %>> <!-- 다음 jsp로 isbn을 넘겨주기위한 input. hidden 이라 사용자에겐 안보임. -->
				<input type="hidden" name="Pw" value=<%=rs.getString("pw") %>>
					<input type="submit" value="정보 수정" onclick="javascript: form.action='Admin_page_memberDataUpdate.jsp';"/>
					<input type="submit" value="회원 탈퇴" onclick="javascript: form.action='deleteAccount.jsp';"/>  
				</form>
				</td>
			</tr>				
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
	</tbody>
</table>
<br/>
<button onclick="location.href='Admin_page_main.jsp'">돌아가기</button>

</body>
</html>