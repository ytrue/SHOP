window.onload = function () {
	var attrArr = $('attrid').value.split(';');
	var attrType = $('attrtype').value.split('|');
	var ddLoction = document.getElementById('text').getElementsByTagName('dd')[5];
	
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
		dd.appendChild(addAttrName);
		for (var j = 0; j < attrValueArr.length; j ++) {
			var input = document.createElement('input');
			var inputText = document.createTextNode(attrValueArr[j] + ' ');
			if (attrType[i] == 1) {
				input.type = 'checkbox';
			} else {
				input.type = 'radio';
			}
			dd.appendChild(input);
			dd.appendChild(inputText);
			input.name = 'attr[' + attrNamePrototype + '][]';
			input.value = attrValueArr[j];
			if (j == 0 && input.type != 'checkbox') input.checked = true;
		}
		ddLoction.parentNode.insertBefore(dd, ddLoction);
	}
};

function $(id) {
	return document.getElementById(id);
}