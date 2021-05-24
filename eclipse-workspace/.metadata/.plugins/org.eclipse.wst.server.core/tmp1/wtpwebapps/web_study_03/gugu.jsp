<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%!
	int global_cnt = 1;
	%>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

for(int i = 1 ; i < 10; i++){
		out.print(global_cnt + "x" + i + "=" + (global_cnt*i) + " ");
}
out.print("안녕하세요" + global_cnt + "트");
++global_cnt;
%>

</body>
</html>