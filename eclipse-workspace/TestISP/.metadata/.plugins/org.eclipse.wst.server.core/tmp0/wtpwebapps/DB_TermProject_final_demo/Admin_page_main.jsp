<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Library Administer page</title>
</head>
<body>
<h1>���� �뿩 ���� ���</h1>
<hr><hr>
<h2>���� �߰� </h2>
<hr>
	<form method="post" action = "Admin_page_bookInsertion.jsp">
		å�̸�: <input type="text" name="title" maxlength="40"><br/>  
		�۰�	: <input type="text" name="author" maxlength="40"><br/>
		����	: <input type="text" name="publisher" maxlength="40"><br/>
		<input type="submit" value="�Է¿Ϸ�">
	</form>
<br><br>

<h2>�弭 ��� �˻�</h2>
<hr>
	<form method="post" action = "Admin_page_bookSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="Title">Title ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="�˻�">
	</form>
	<br>(�ƹ��͵� �Է����� ������ ��ü ��ȸ)
<br><br>

<h2>�뿩 ���� ���� ����</h2>
<hr>
	<form method="post" action = "Admin_page_rentDataSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="Title">Title /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="�˻�">
	</form>
	<br>(�ƹ��͵� �Է����� ������ ��ü ��ȸ)
<br><br>

<h2>���� ���� ���� ����</h2>
<hr>
	<form method="post" action = "Admin_page_reservationSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="�˻�">
	</form>
	<br>(�ƹ��͵� �Է����� ������ ��ü ��ȸ)
<br><br>

<h2>�ݳ� ��û ���� ��ȸ</h2>
<hr>
	<form method="post" action = "Admin_page_turnInSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="�˻�">
	</form>
	<br>(�ƹ��͵� �Է����� ������ ��ü ��ȸ)
<br><br>
<h2>���� �뿩 ����</h2>
<hr>
	<form method="post" action = "Admin_page_rentalRecordSearch.jsp">
		FROM <input type="date" name="date_start" placeholder = "YYYY-MM-DD"> 
		TO   <input type="date" name="date_end" placeholder = "YYYY-MM-DD"> <br>
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="�˻�">
	</form>
	<br>(�ƹ��͵� �Է����� ������ ��ü ��ȸ)
<br><br>
<hr><hr>
<h1>ȸ�� ���� ���� ���</h1>
<hr><hr>
	<form method="post" action = "Admin_page_searchMemberData.jsp">
		SEARCH BY<br/> 
		[<input type="radio" name="searchBy" value="ID" checked> ID /
	     <input type="radio" name="searchBy" value="Name"> NAME /
	     <input type="radio" name="searchBy" value="Phone"> Phone('-'����) /
	     <input type="radio" name="searchBy" value="Email"> Email ]<br/>
	    [<input type="checkbox" name="check_student" value="student" checked>Student
	     <input type="checkbox" name="check_graduated" value="graduated" checked>Graduated
	     <input type="checkbox" name="check_faculty_member" value="faculty_member" checked>faculty_member ]<br> 
		<input type = "text" name="searchVal" maxlength = "40" > <input type="submit" value="�˻�">
	</form>
	<br> (�ƹ��͵� �Է� ���� ������ ��ü ȸ���� ��ȸ�մϴ�.)
<hr>

<button onclick="location.href='FRONT_PAGE.jsp'">(�����ڿ�)FrontPage</button>
</body>
</html>