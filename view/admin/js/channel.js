//导航切换
function channel(j) {
	//获取所有的dl标签
	var dl = document.getElementsByTagName('dl');
	//把所有的dl标签隐藏起来
	for (var i = 0; i < dl.length; i ++) {
		dl[i].style.display = 'none';
	}
	//把点击的那个显示出来
	dl[j].style.display = 'block';
}