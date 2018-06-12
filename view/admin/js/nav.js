function updateNav() {
	var fm = document.update;
	if (fm.info.value.length > 200) {
		alert('导航简介不得大于200位！');
		fm.info.focus();
		return false;
	}
	return true;
}

function addNav() {
	var fm = document.add;
	
	if (fm.name.value == '') {
		alert('导航名称不得为空！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length < 2) {
		alert('导航名称不得小于2位！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length > 4) {
		alert('导航名称不得大于4位！');
		fm.name.focus();
		return false;
	}
	if (fm.info.value.length > 200) {
		alert('导航简介不得大于200位！');
		fm.info.focus();
		return false;
	}
	if (fm.flag.value != '') {
		alert('导航名称被占用！');
		fm.name.focus();
		return false;
	}
	return true;
}


function checkName(){
    var name = document.getElementById("name");
    var flag = document.getElementById("flag");
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"POST",
        sync:false,
        url:'?a=nav&m=isName',
        data:"name="+name.value,
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





