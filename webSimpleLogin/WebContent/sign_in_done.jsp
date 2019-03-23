<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	Boolean login = (Boolean)session.getAttribute("login"); 

	if(login == null || !login) {
		response.sendRedirect("http://localhost:8080/webSimpleLogin/login.jsp");
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 성공</title>
</head>
<body>
	세션없으면 돌아가~
</body>
</html>