function changeDelivery() {
	var fm = document.update;
	var name = fm.delivery_name;
	var url = fm.delivery_url;
	
	url.value = name.options[name.selectedIndex].getAttribute('url');
}

window.onload = function () {
	var fm = document.update;
	var order = fm.order_delivery;
	var dd = document.getElementsByTagName('dd');
	var delivery = [];
	for (var i = 0; i < dd.length; i ++) {
		if (dd[i].className == 'delivery') {
			delivery.push(dd[i]);
		}
	}
	
	if (order[2].checked) {
		delivery[0].style.display = 'block';
		delivery[1].style.display = 'block';
	} else {
		delivery[0].style.display = 'none';
		delivery[1].style.display = 'none';
	}
	
	order[2].onclick = function () {
		delivery[0].style.display = 'block';
		delivery[1].style.display = 'block';
	}
	
	order[0].onclick = function () {
		delivery[0].style.display = 'none';
		delivery[1].style.display = 'none';
	}
	
	order[1].onclick = function () {
		delivery[0].style.display = 'none';
		delivery[1].style.display = 'none';
	}
	
	
}