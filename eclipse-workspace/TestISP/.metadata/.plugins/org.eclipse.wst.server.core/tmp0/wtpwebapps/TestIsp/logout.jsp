<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<% session.invalidate();%>  //모든 세션값을 초기화한다.
<center>
<h3>로그아웃 되었습니다.</h3>
<a href="homepage_interpreter.jsp">Login Page...</a>
</center>

</body>
</html>