<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/brand.css" />
</head>
<body>

<h2><a href="?a=brand&m=add">添加品牌</a>商品 -- 品牌列表</h2>

<div id="list">
	<table>
		<tr><th>品牌名称</th><th>官方网站</th><th>品牌简介</th><th>操作</th></tr>
		{foreach from=$AllBrand key=key item=value}
		<tr><td>{$value->name}</td><td>{$value->url}</td><td>{$value->info}</td><td><a href="?a=brand&m=update&id={$value->id}"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=brand&m=delete&id={$value->id}" onclick="return confirm('你真的要删除这个品牌吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
		{foreachelse}
		<tr><td colspan="4">没有任何品牌</td></tr>
		{/foreach}
	</table>
</div>
<div id="page">{$page}</div>

</body>
</html>