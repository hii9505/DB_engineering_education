<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form method="get" action="homepage">
    <br> 이름 <input type="text"> </br>
    <br>주민등록번호 <input type="text"> - <input type="text"> </br>
    <br>아이디<input type="text"> </br>
    <br>비밀번호 <input type="password"> </br>
    <br>비밀번호 확인 <input type="password"> </br>
    <br>우편번호 <input type="text"> </br>
    <br>주소 <input type="text"><input type="text"> </br>
    <br>핸드폰번호 <input type="text"> </br>
    <br>직업 
    <span style="float: left; margin-right: 20px"> <label for="job">직업</label>
			<select id="job" name="job" size="1">
				<option value="">선택하세요</option>
				<option value="학생">학생</option>
				<option value="컴퓨터/인터넷">컴퓨터/인터넷</option>
				<option value="언론">언론</option>
				<option value="공무원">공무원</option>
				<option value="군인">군인</option>
				<option value="서비스업">서비스업</option>
				<option value="교육">교육</option>
		</select>
		</span></br>
	<br>매일/SMS 정보 수신
	<input type="checkbox" name="item" value="수신"> 수신 
	<input type="checkbox" name="item" value="수신거부"> 수신거부</br>
	<br>관심분야
	<input type="checkbox" name="item" value="신발"> 생두 <input
			type="checkbox" name="item" value="가방"> 원두 <input
			type="checkbox" name="item" value="벨트"> 로스팅<br> <input
			type="checkbox" name="item" value="모자"> 핸드드립 <input
			type="checkbox" name="item" value="시계"> 에스프레소 <input
			type="checkbox" name="item" value="쥬얼리"> 창업<br>
		</span> </br>
	<input type="submit" value="전송" style="float: right; margin-right: 50px">
	</form>
		
    
</body>
</html>