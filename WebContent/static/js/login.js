function mycheck() {
	if (form2.name.value == "" || form2.name.value == null) {
		alert("请输入用户名！");
		form2.name.focus();
		return;
	}
	if (form2.pwd.value == "" || form2.name.value == null) {
		alert("请输入密码！");
		form2.pwd.focus();
		return;
	}
	form2.submit();
}