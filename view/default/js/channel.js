function channel(j) {
	for (var i=1; i<=4; i++) {
		var style = document.getElementById('button'+i).style;
		style.backgroundPosition = 'right';
		style.color = '#333';
		var content = document.getElementById('c'+i).style;
		content.display= 'none';
	}
	var style = document.getElementById('button'+j).style;
	style.backgroundPosition = 'left';
	style.color = '#fff';
	var content = document.getElementById('c'+j).style;
	content.display= 'block';
}