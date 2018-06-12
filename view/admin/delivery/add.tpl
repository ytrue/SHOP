<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城后台管理</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/admin/style/delivery.css" />
	<script type="text/javascript" src="view/admin/js/ajax.js"></script>
	<script type="text/javascript" src="view/admin/js/delivery.js"></script>
</head>
<body>

<h2><a href="?a=delivery">返回快递列表</a>订单 -- 添加快递</h2>

<form method="post" name="add" action="?a=delivery&m=add">
	<input type="hidden" name="flag" id="flag" />
	<dl class="form">
		<dd>快递名称：<input type="text" id="name" onblur="checkName();" name="name" class="text" /> ( * 2-20位之间 ) <span class="red">[必填]</span></dd>
		<dd>官方网站：<input type="text" name="url" class="text" /> ( * 200内之内)</dd>
		<dd><span class="middle">快递描述：</span><textarea name="info"></textarea> <span class="middle">( * 200位以内 )</span></dd>
		<dd>省内运费：<input type="text" name="price_in" class="text" /> ( * 单位/元，省内的起步运费)</dd>
		<dd>省外运费：<input type="text" name="price_out" class="text" /> ( * 单位/元，省外的起步运费)</dd>
		<dd>额外运费：<input type="text" name="price_add" class="text" /> ( * 单位/元，超过10公斤之后每1公斤的运费)</dd>
		<dd><input type="submit" name="send" onclick="return addDelivery();" value="新增快递" class="submit" /></dd>
	</dl>
</form>


</body>
</html>