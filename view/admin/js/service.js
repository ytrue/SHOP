function addService() {
	var fm = document.add;
	
	if (fm.name.value == '') {
		alert('售后服务名称不得为空！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length < 2) {
		alert('售后服务名称不得小于2位！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length > 20) {
		alert('售后服务名称不得大于20位！');
		fm.name.focus();
		return false;
	}
	if (fm.flag.value != '') {
		alert('品牌名称被占用！');
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
        url:'?a=service&m=isName',
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





