function adminLogin() {
	var fm = document.login;
	
	if (fm.user.value == '') {
		alert('管理员姓名不得为空！');
		fm.user.focus();
		return false;
	}
	if (fm.pass.value == '') {
		alert('管理员密码不得为空！');
		fm.pass.focus();
		return false;
	}	
	if (fm.code.value == '') {
		alert('验证码不得为空！');
		fm.code.focus();
		return false;
	}	
	if (fm.ajaxlogin.value != '') {
		alert('用户名或密码不正确！');
		fm.pass.focus();
		return false;
	}
	if (fm.ajaxcode.value != '') {
		alert('验证码不正确！');
		fm.pass.focus();
		return false;
	}
	return true;
}


function checkLogin(){
    var user = document.getElementById("user");
    var pass = document.getElementById("pass");
    var ajaxlogin = document.getElementById("ajaxlogin");
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"POST",
        sync:false,
        url:'?a=admin&m=ajaxLogin',
        data:"user="+user.value+"&pass="+pass.value,
        success: function(msg) {
            if(msg==1){
                ajaxlogin.value = 'true';
            } else {
				ajaxlogin.value = '';
			}
        },
        failure: function(a) {
            alert(a);
        },
        soap:this
    });
}


function checkCode(){
    var code = document.getElementById("code");
    var ajaxcode = document.getElementById("ajaxcode");
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"POST",
        sync:false,
        url:'?a=admin&m=ajaxCode',
        data:"code="+code.value,
        success: function(msg) {
            if(msg==1){
                ajaxcode.value = 'true';
            } else {
				ajaxcode.value = '';
			}
        },
        failure: function(a) {
            alert(a);
        },
        soap:this
    });
}