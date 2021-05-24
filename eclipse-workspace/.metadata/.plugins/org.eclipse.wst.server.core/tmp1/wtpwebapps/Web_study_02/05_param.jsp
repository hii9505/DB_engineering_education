<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿</title>
<script type="text/javascript" src="param.js"></script>
</head>
<body>
<form method="get" action="ParamServlet" name="frm">
아이디 : <input type="text" name="id"><br>
pw : <input type="password" name="pw"><br>
<input type="submit" value="전송" onclick="return check()">
<input type="reset" value="reset" onclick="retrun check()">
</form>
</body>
</html>