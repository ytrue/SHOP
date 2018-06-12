function updateManage() {
	var fm = document.update;
	
	if (fm.pass.value.length < 6) {
		alert('管理员密码不得小于6位！');
		fm.pass.focus();
		return false;
	}
	if (fm.pass.value != fm.notpass.value ) {
		alert('管理员密码和确认密码必须保持一致！');
		fm.notpass.focus();
		return false;
	}
	if (fm.level.value == 0) {
		alert('管理员等级权限必须选择！');
		fm.level.focus();
		return false;
	}
	
	return true;
}

function addManage() {
	var fm = document.add;
	
	if (fm.user.value == '') {
		alert('管理员用户名不得为空！');
		fm.user.focus();
		return false;
	}
	if (fm.user.value.length < 2) {
		alert('管理员用户名不得小于2位！');
		fm.user.focus();
		return false;
	}
	if (fm.user.value.length > 20) {
		alert('管理员用户名不得大于20位！');
		fm.user.focus();
		return false;
	}
	if (fm.pass.value.length < 6) {
		alert('管理员密码不得小于6位！');
		fm.pass.focus();
		return false;
	}
	if (fm.pass.value != fm.notpass.value ) {
		alert('管理员密码和确认密码必须保持一致！');
		fm.notpass.focus();
		return false;
	}
	if (fm.level.value == 0) {
		alert('管理员等级权限必须选择！');
		fm.level.focus();
		return false;
	}
	if (fm.flag.value != '') {
		alert('管理员用户名被占用！');
		fm.user.focus();
		return false;
	}
	return true;
}


function checkUser(){
    var user = document.getElementById("user");
    var flag = document.getElementById("flag");
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"POST",
        sync:false,
        url:'?a=manage&m=isUser',
        data:"user="+user.value,
        success: function(msg) {
            if(msg==1){
                flag.value = 'true';
            } else {
				flag.value = '';
			}
        },
        failure: function(a) {
            alert(a);
        },
        soap:this
    });
}





