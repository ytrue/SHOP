<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/brand.css" />
<script type="text/javascript" src="view/admin/js/ajax.js"></script>
<script type="text/javascript" src="view/admin/js/brand.js"></script>
</head>
<body>

<h2><a href="?a=brand">返回品牌列表</a>商品 -- 添加品牌</h2>

<form method="post" name="add" action="?a=brand&m=add">
	<input type="hidden" name="flag" id="flag" />
	<dl class="form">
		<dd>品牌名称：<input type="text" id="name" onblur="checkName();" name="name" class="text" /> ( * 2-20位之间 ) <span class="red">[必填]</span></dd>
		<dd>官方网站：<input type="text" name="url" class="text" /> ( * 200内之内)</dd>
		<dd><span class="middle">品牌简介：</span><textarea name="info"></textarea> <span class="middle">( * 200位以内 )</span></dd>
		<dd><input type="submit" name="send" onclick="return addBrand();" value="新增品牌" class="submit" /></dd>
	</dl>
</form>


</body>
</html>