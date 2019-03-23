/**
 * 로그인 검증(admin/ abcD123!) 
 */

window.onload = function() {
	window.document.getElementById('loginBtn').addEventListener('click',login);
}

function login() {
	
	var obj = document.loginFrm;
	
	var id = obj.id.value.trim();
	var pwd = obj.password.value.trim();
	
	if (id == '') {
		obj.id.focus();
		return;
	}
	
	if (pwd == '') {
		obj.password.focus();
		return;
	}
	
	if (id == 'admin' && pwd == 'abcD123!') {
		alert('로그인');
	} else {
		alert('입력 정보가 틀립니다.');
	}
}

function enterLogin() { //////////////////////////// 수정중
	// 패스워드에서 엔터쳤을 때 로그인 함수가 호출되도록 하고 싶음
	// 키다운 이벤트 발생했을 때 엔터라면 로그인 호출되도록..
	
	console.log(window.event.which);
}