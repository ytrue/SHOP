<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/price.css" />
</head>
<body>

<h2><a href="?a=price&m=add">添加价格区间</a>商品 -- 价格区间列表</h2>

<div id="list">
	<table>
		<tr><th>左区间</th><th>右区间</th><th>操作</th></tr>
		{foreach from=$AllPrice key=key item=value}
		<tr><td>{$value->price_left}</td><td>{$value->price_right}</td><td><a href="?a=price&m=update&id={$value->id}"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=price&m=delete&id={$value->id}" onclick="return confirm('你真的要删除这个价格区间吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
		{foreachelse}
		<tr><td colspan="3">没有价格区间</td></tr>
		{/foreach}
	</table>
</div>
<div id="page">{$page}</div>

</body>
</html>