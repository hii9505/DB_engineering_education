<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "needs.User" %>
<%@ page import = "java.time.LocalDate" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Search Book</title>
</head>
<body>
<h2>�˻� ���</h2>
<table width = "100%" border = "1">
	<thead>
		<tr>
			<td>ISBN</td> <td>rentId</td> <td>rentstartdate</td> <td>RenEndDate</td>
			<div><%=  session.getAttribute("Memstat")%></div>
		</tr>
	</thead>
	<tbody>
		<% 
		User user = (User) session.getAttribute("user");
		int plus_data = 0;
		
		String Memstat = (String)session.getAttribute("Memstat");
		
		if(Memstat.equals("Undergrduate")){
			plus_data = 10;
		}else if(Memstat.equals("Graduate_school")){
			plus_data = 30;
		}else if(Memstat.equals("faculty_member")){
			plus_data = 60;
		}
		
		
		
		LocalDate today = LocalDate.now();
		String isbn = request.getParameter("isbn");
		
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
			String sql ="select * from db_test.books_on_rent where isbn = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs=pstmt.executeQuery();
			
			//���� ���� ����
			if(rs.next()){
			str = "�뿩 �����Ͽ����ϴ�. �����Ͻðڽ��ϱ�?";
			
			%>	 
			
			
			
			<tr>
				<td><%=rs.getInt("isbn") %></td>
				<td><%=rs.getString("RentMemID") %></td>
				<td><%=rs.getString("RentStartDate") %></td>
				<td><%=rs.getString("RentEndDate") %></td>
				<td>
				<form name="tableDataFrom" method="post">
				<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>> <!-- ���� jsp�� isbn�� �Ѱ��ֱ����� input. hidden �̶� ����ڿ��� �Ⱥ���. -->
				 	<input type="submit" value="å ����" onclick="javascript: form.action='booksearch_reservation.jsp';"/>
				</form>
				</td>
			</tr>				
		<%
			
			
			
			
			}
			else{
				
				try {
					
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

					sql = "insert into db_test.books_on_rent values(?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, isbn);
					pstmt.setString(2, (String)session.getAttribute("id"));
					pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE));
					pstmt.setString(4, today.plusDays(plus_data).format(DateTimeFormatter.ISO_LOCAL_DATE));
					pstmt.executeUpdate();
					
					
					
					if(true){
						try {
							
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

								sql = "insert into db_test.rental_record values(?,?,?)";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, isbn);
								pstmt.setString(2, (String)session.getAttribute("id"));
								pstmt.setString(3, today.format(DateTimeFormatter.ISO_LOCAL_DATE));
								pstmt.executeUpdate();
					
							
						}catch (Exception e){
							e.printStackTrace();
						
						} finally{
							if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
							if(conn != null) try{conn.close();}catch(SQLException sqle){}
						}
						
					}				
						
						str = "���� ���⿡ �����߽��ϴ�.";}
				catch (Exception e){
					e.printStackTrace();
					str = "���� ���⿡ �����߽��ϴ�."; 
				} finally{
					if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
					if(conn != null) try{conn.close();}catch(SQLException sqle){}
				}
				
		}
					
					
					
					
				
			
		}catch(Exception e){
			e.printStackTrace();
			str = "������ �����߽��ϴ�.";
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null)try{conn.close();}catch(SQLException sqle){}
		}
		
		
%>
<div><%=  str%></div>
	</tbody>
</table>
<br/>

<button onclick="location.href='Admin_page_main.jsp'">���ư���></button>
<button onclick="location.href='Homepage.jsp'">Ȩ������></button>

</body>
</html>