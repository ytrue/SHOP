window.onload = function () {
	var nav = $('nav');
	var brand = $('brand');
	nav.onchange = function () {
		if (this.value == -1) {
			brand.options.length = 1;
		} else {
			changeNav(this.value);
			getAttr(this.value);
		}
	};
};

function changeNav(id){
	var brand = $('brand');
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"GET",
        sync:false,
        url:'?a=goods&m=getBrand&id='+id,
        success: function(msg) {
			var a = msg.split(':');
			brand.options.length = 1;
			for (var i=0;i<a.length;i=i+2) {
				brand.options.add(new Option(a[i+1], a[i]));
			}
        },
        failure: function(a) {
            alert(a);
        },
        soap:this
    });
}

function getAttr(id) {
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"GET",
        sync:false,
        url:'?a=goods&m=getAttr&id='+id,
        success: function(msg) {
        	
        	var ddRe = document.getElementsByTagName('dd');
        	for (var i = ddRe.length - 1; i >= 0; i --) {
        		if (ddRe[i].className == 'tmp') {
        			ddRe[i].parentNode.removeChild(ddRe[i]);
        		}
        	}
        	
			var attrArr = msg.split(';');
			var ddLoction = document.getElementsByTagName('dd')[4];
			
			for (var i = 0; i < attrArr.length; i ++) {
				var attrName = attrArr[i].substr(0, attrArr[i].indexOf(':'));
				var attrNamePrototype = attrName;
				if (attrName.length == 2) {
					attrName = attrName.charAt(0) + '　　' + attrName.charAt(1);
				} else if (attrName.length == 3) {
					attrName = attrName.charAt(0) + ' ' + attrName.charAt(1) + ' ' + attrName.charAt(2);
				}
				var attrValueArr = attrArr[i].substr(attrArr[i].indexOf(':') + 1).split('|');
				
				var dd = document.createElement('dd');
				var addAttrName = document.createTextNode(attrName + '：');
				dd.className = 'tmp';
				dd.appendChild(addAttrName);
				for (var j = 0; j < attrValueArr.length; j ++) {
					var input = document.createElement('input');
					var inputText = document.createTextNode(attrValueArr[j] + ' ');
					input.type = 'checkbox';
					dd.appendChild(input);
					dd.appendChild(inputText);
					input.name = 'attr[' + attrNamePrototype + '][]';
					input.value = attrValueArr[j];
					input.checked = true;
				}
				ddLoction.parentNode.insertBefore(dd, ddLoction);
			}
        },
        failure: function(a) {
            alert(a);
        },
        soap:this
    });
}

function centerWindow(url, name, width, height) {
	var left = (screen.width - width) / 2;
	var top = (screen.height - height) / 2 - 50;
	window.open(url, name, 'width='+width+',height='+height+',top='+top+',left='+left);
}

function $(id) {
	return document.getElementById(id);
}


function addGoods() {
	var fm = document.add;
	if (fm.nav.value == -1) {
		alert('商品类型必须选择！');
		fm.nav.focus();
		return false;
	}
	if (fm.brand.value == -1) {
		alert('商品品牌必须选择！');
		fm.brand.focus();
		return false;
	}
	if (fm.name.value == '') {
		alert('商品名称不得为空！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length < 2) {
		alert('商品名称不得小于2位！');
		fm.name.focus();
		return false;
	}
	if (fm.name.value.length > 100) {
		alert('商品名称不得大于100位！');
		fm.name.focus();
		return false;
	}
	if (fm.sn.value == '') {
		alert('商品编号不得为空！');
		fm.sn.focus();
		return false;
	}
	if (fm.sn.value.length < 2) {
		alert('商品编号不得小于2位！');
		fm.sn.focus();
		return false;
	}
	if (fm.sn.value.length > 50) {
		alert('商品编号不得大于50位！');
		fm.sn.focus();
		return false;
	}
	if (fm.flag.value != '') {
		alert('商品编号已存在，请换个！');
		fm.name.focus();
		return false;
	}
	return true;
}

function checkSn(){
    var sn = document.getElementById("sn");
    var flag = document.getElementById("flag");
    var ajax = new AjaxObj();
    ajax.swRequest({
        method:"POST",
        sync:false,
        url:'?a=goods&m=isSn',
        data:"sn="+sn.value,
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

