<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    int num1 = 10, num2 = 20;
    public int add(int num1, int num2) {
    	return num1 + num2;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= num1 %> 
+
<%= num2 %>
=
<%= add(num1, num2) %>

</body>
</html>