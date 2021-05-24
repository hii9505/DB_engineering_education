<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% 
        if(request.getSession().getAttribute("id") == null) {
            response.sendRedirect("/TestIsp/homepage_not_login.jsp");
        }else{
        	response.sendRedirect("/TestIsp/Homepage.jsp");
        }
        


    %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div>check</div>

</body>
</html>