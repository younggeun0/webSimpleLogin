<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Login</title>
<link rel="stylesheet" type="text/css" href="login.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		// ���̵� ���忩�� Ȯ��
		var savedId = localStorage.getItem("saveId");
		alert(savedId);
		
		if (savedId != null) { // localStorage�� ���̵� ����Ǿ� ������ 
			$("#id").val(savedId);
			$("#saveId").prop("checked","checked");
		}
		
		$("#loginBtn").click(function() {
			var id = $("#id").val();
			
			if (id == "") {
				$("#id").focus();
				return;
			}
			
			var password = $("#password").val();
			
			if (password == "") {
				$("#password").focus();
				return;
			}
			
			// ���̵� ����
			if ($("#saveId").is(":checked") == true) {
				localStorage.setItem("saveId",id);
			}
			
			$("[name='loginFrm']").submit();
		});
		
		$("#saveId").change(function() {
			alert($("#saveId").is(":checked"));
			if ($("#saveId").is(":checked") == false) {
				localStorage.removeItem("saveId");
			}
		});
	});
</script>
</head>
<body>
<div id="loginDiv">
	<div id="loginHeader">
		<img src="http://localhost:8080/webSimpleLogin/common/images/logo2.jpg" alt="sist"/><strong><span style="margin-left:10px;">Simple Login</span></strong>
	</div>
	<div id="loginDiv-content">
		<form name="loginFrm" method="post" action="sign_in_process.jsp">
			<div class="float-left">
				<input type="text" id="id" name="id" placeholder="���̵�" class="inputBox"/><br/>
				<input type="password" id="password" name="password" placeholder="��й�ȣ" class="inputBox"/>
			</div>
			<div class="float-left">
				<input type="button" value="�α���" id="loginBtn" class="btn"/>
			</div>
			<div class="float-left">
				<input type="checkbox" id="saveId" name="saveId"/><span class="small-font">���̵� ����</span>
				<div>
					<a href="http://localhost:8080/webSimpleLogin/sign_up.html" target="_blank">
						<span class="small-font">ȸ������</span>
					</a>
					<a href="#void">
						<span class="small-font">���̵�</span>
					</a>��
					<a href="#void">
						<span class="small-font">��й�ȣ ã��</span>
					</a>
					</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>