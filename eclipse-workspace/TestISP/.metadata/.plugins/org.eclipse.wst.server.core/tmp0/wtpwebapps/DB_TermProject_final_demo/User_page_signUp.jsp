<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form>
ID : <input type = "text" maxlength=40 name="id"><br>
PW : <input type = "text" maxlength=40 name="pw"><br>
Name : <input type = "text" maxlength=40 name="name"><br>
Email :<input type = "text" maxlength=40 name="email"><br>
Phone : <input type = "text" maxlength=20 name="phone"><br>
STAT [<input type="radio" name="stat" value="student" checked>Student
	  <input type="radio" name="stat" value="graduated" checked>Graduated
	  <input type="radio" name="stat" value="faculty_member" checked>faculty_member ]<br> 
<input type="submit" value="회원가입" onclick="javascript: form.action='User_page_signUpPro.jsp';">
</form>
<br>
<button onclick="history.back(-1);">돌아가기</button>
</body>
</html>