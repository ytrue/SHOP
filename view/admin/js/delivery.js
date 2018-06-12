function updateDelivery() {
	var fm = document.update;
	if (fm.url.value.length > 200) {
		alert('官方网站不得大于200位！');
		fm.url.focus();
		return false;
	}
	if (fm.info.value.length > 200) {
		alert('快递简介不得大于200位！');
		fm.info.focus();
		return false;
	}
	return true;
}

function addDelivery() {
	var fm = document.add;
	
	if (fm.name.value == '') {
		alert('快递名称不得为空！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length < 2) {
		alert('快递名称不得小于2位！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length > 20) {
		alert('快递名称不得大于20位！');
		fm.name.focus();
		return false;
	}
	if (fm.url.value.length > 200) {
		alert('官方网站不得大于200位！');
		fm.url.focus();
		return false;
	}
	if (fm.info.value.length > 200) {
		alert('快递简介不得大于200位！');
		fm.info.focus();
		return false;
	}
	if (fm.flag.value != '') {
		alert('快递名称被占用！');
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
        url:'?a=delivery&m=isName',
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





