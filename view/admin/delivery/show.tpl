<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城后台管理</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/admin/style/delivery.css" />
</head>
<body>

<h2><a href="?a=delivery&m=add">添加快递</a>订单 -- 快递列表</h2>

<div id="list">
	<table>
		<tr><th>快递名称</th><th>官方网站</th><th>描述</th><th>省内/省外/额外</th><th>操作</th></tr>
        {foreach from=$AllDelivery key=key item=value}
			<tr><td>{$value->name}</td><td>{$value->url}</td><td>{$value->info}</td><td>{$value->price_in}/{$value->price_out}/{$value->price_add}</td><td><a href="?a=delivery&m=update&id={$value->id}"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=delivery&m=delete&id={$value->id}" onclick="return confirm('你真的要删除这个快递吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
            {foreachelse}
			<tr><td colspan="3">没有任何快递</td></tr>
        {/foreach}
	</table>
</div>
<div id="page">{$page}</div>

</body>
</html>