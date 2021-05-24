<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    
      int global_cnt = 2;
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "1">
<%
	int n = 3;
	for(int i = 1 ; i < global_cnt; i++ ){
%>
	<tr>
		<td><%= i  %></td>
		<td>단</td>
	</tr>
	
<% 
	}
	global_cnt++;
%>	
</table>
</body>
</html>