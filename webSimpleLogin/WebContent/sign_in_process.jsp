<%@page import="wsl.dao.WslDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="lvo" class="wsl.vo.LoginVO" scope="page"/>
<jsp:setProperty name="lvo" property="*"/>

<script type="text/javascript">
<%
	WslDAO w_dao = WslDAO.getInstance();

	if(w_dao.login(lvo)) {
		
		RequestDispatcher rd = request.getRequestDispatcher("sign_in_done.jsp");
		session.setAttribute("login", true);
		rd.forward(request, response);
		
	} else {
	%>
		alert("로그인에 실패했습니다.");
		location.href="http://localhost:8080/webSimpleLogin/login.jsp";	
	<%	
	}
%>
</script>