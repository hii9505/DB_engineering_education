<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
검색 엔진 정보 페이지 

검색 엔진을 선택하세요 
		<span style="float: left; margin-right: 20px"> <label for="job">직업</label>
		<form action="site_move.jsp" >
			<select name="jump" onchange="location.href=this.value">
				<option value="">선택하세요</option>
				<option value="http://www.naver.com">네이버</option>
				<option value="http://daum.net">다음</option>
				<option value="http://www.google.com">구글</option>
				<option value="http://kakaoocorp.com">카카오</option>
			</select>
			<input type="submit" value="이동">
		</form>

</body>
</html>