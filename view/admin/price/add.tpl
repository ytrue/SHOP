<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/price.css" />
</head>
<body>

<h2><a href="?a=price">返回价格区间列表</a>商品 -- 添加价格区间</h2>

<form method="post" name="add" action="?a=price&m=add">
	<dl class="form">
		<dd>价格区间：<input type="text" name="price_left" value="0" class="text small" /> - <input type="text" name="price_right" value="0" class="text small" /> <span class="red">[必填]</span> ( * 不得为0、必须是数字、左区间必须小于右区间 )</dd>
		<dd><input type="submit" name="send" onclick="return addPrice();" value="新增价格区间" class="submit" /></dd>
	</dl>
</form>

</body>
</html>