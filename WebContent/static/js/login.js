function mycheck() {
	if (form2.username.value == "") {
		alert("请输入用户名！");
		form2.username.focus();
		return;
	}
	if (form2.pwd.value == "") {
		alert("请输入密码！");
		form2.pwd.focus();
		return;
	}
	if (form2.yanzheng.value == "") {
		alert("请输入验证码！");
		form2.yanzheng.focus();
		return;
	}
	if (form2.yanzheng.value != form2.vcode.value) {
		alert("请输入正确的验证码！");
		form2.yanzheng.focus();
		return;
	}
	form2.submit();
}