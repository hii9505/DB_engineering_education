<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>�ݳ� ��û ��ȸ</title>
</head>
<body>
<table width = "100%" border = "1">
<h2> ��ȸ�� �ݳ� ��û </h2>
<hr>
	<thead>
		<tr>
			<td>ISBN</td> <td>memID</td> <td>request Date</td> <td>MENU</td>
		</tr>
	</thead>
	<tbody>
		<% 
		String searchBy = request.getParameter("searchBy");
		String searchVal = request.getParameter("searchVal");
		
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
			
			if(searchVal.isEmpty()){ //������ ��� ��ü �˻�
				sql = "SELECT * FROM turn_in_request ";
			}
			else { 
				if(searchBy.compareTo("ISBN")==0){  //isbn ���� �˻�
					sql = "SELECT * FROM turn_in_request WHERE isbn="+searchVal;
				}
				else { // SEARCH BY MEMBER ID
					sql = "SELECT * FROM turn_in_request WHERE memID LIKE '%"+searchVal+"%'";
				}
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getInt("ISBN") %></td>
					<td><%=rs.getString("MemID") %></td>
					<td><%=rs.getString("request_date") %></td>
					<td>
						<form>
						<input type="hidden" name="isbn" value=<%=rs.getInt("isbn") %>> <!-- ���� jsp�� isbn�� �Ѱ��ֱ����� input. hidden �̶� ����ڿ��� �Ⱥ���. -->
						<input type="submit" value="�ݳ� ����" onclick="javascript: form.action='Admin_page_turnInAccept.jsp';" />
						</form>
					</td>
				</tr>
				<%	
			}
			
		}catch (Exception e){
			e.printStackTrace();
			str = "member ���̺� ���ο� ���ڵ� �߰��� �����߽��ϴ�."; 
			out.println(str);
		} finally{
			if(rs != null) try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
%>
	</tbody>
</table>
<br/>
<button onclick="location.href='Admin_page_main.jsp'">���ư���</button>

</body>
</html>