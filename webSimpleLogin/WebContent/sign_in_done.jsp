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
<title>�α��� ����</title>
</head>
<body>
	���Ǿ����� ���ư�~
</body>
</html>