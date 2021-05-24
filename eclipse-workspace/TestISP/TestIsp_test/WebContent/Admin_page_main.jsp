<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv ="Content-Type" content="text/html ; charset=EUC-KR">
<title>Library Administer page</title>
</head>
<body>
<h1>도서 대여 관리 기능</h1>
<hr><hr>
<h2>도서 추가 </h2>
<hr>
	<form method="post" action = "Admin_page_bookInsertion.jsp">
		책이름: <input type="text" name="title" maxlength="40"><br/>  
		작가	: <input type="text" name="author" maxlength="40"><br/>
		출판	: <input type="text" name="publisher" maxlength="40"><br/>
		<input type="submit" value="입력완료">
	</form>
<br><br>

<h2>장서 목록 검색</h2>
<hr>
	<form method="post" action = "Admin_page_bookSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="Title">Title ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="검색">
	</form>
	<br>(아무것도 입력하지 않으면 전체 조회)
<br><br>

<h2>대여 중인 도서 관리</h2>
<hr>
	<form method="post" action = "Admin_page_rentDataSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="Title">Title /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="검색">
	</form>
	<br>(아무것도 입력하지 않으면 전체 조회)
<br><br>

<h2>도서 예약 정보 관리</h2>
<hr>
	<form method="post" action = "Admin_page_reservationSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="검색">
	</form>
	<br>(아무것도 입력하지 않으면 전체 조회)
<br><br>

<h2>반납 신청 도서 조회</h2>
<hr>
	<form method="post" action = "Admin_page_turnInSearch.jsp">
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="검색">
	</form>
	<br>(아무것도 입력하지 않으면 전체 조회)
<br><br>
<h2>과거 대여 내역</h2>
<hr>
	<form method="post" action = "Admin_page_rentalRecordSearch.jsp">
		FROM <input type="date" name="date_start" placeholder = "YYYY-MM-DD"> 
		TO   <input type="date" name="date_end" placeholder = "YYYY-MM-DD"> <br>
		SEARCH BY [<input type="radio" name="searchBy" value="ISBN" checked>ISBN /
				   <input type="radio" name="searchBy" value="usrID">userID ]<br/>
		<input type = "text" name="searchVal" maxlength = "40"><input type="submit" value="검색">
	</form>
	<br>(아무것도 입력하지 않으면 전체 조회)
<br><br>
<hr><hr>
<h1>회원 정보 관리 기능</h1>
<hr><hr>
	<form method="post" action = "Admin_page_searchMemberData.jsp">
		SEARCH BY<br/> 
		[<input type="radio" name="searchBy" value="ID" checked> ID /
	     <input type="radio" name="searchBy" value="Name"> NAME /
	     <input type="radio" name="searchBy" value="Phone"> Phone('-'포함) /
	     <input type="radio" name="searchBy" value="Email"> Email ]<br/>
	    [<input type="checkbox" name="check_student" value="student" checked>Student
	     <input type="checkbox" name="check_graduated" value="graduated" checked>Graduated
	     <input type="checkbox" name="check_faculty_member" value="faculty_member" checked>faculty_member ]<br> 
		<input type = "text" name="searchVal" maxlength = "40" > <input type="submit" value="검색">
	</form>
	<br> (아무것도 입력 하지 않으면 전체 회원을 조회합니다.)
<hr>
<button onclick="location.href='Admin_page_showTopTen.jsp'"><h2>[미구현] 최다 대출 TOP 유저 조회</h2>></button>
</body>
</html>