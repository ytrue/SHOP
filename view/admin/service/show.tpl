<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城后台管理</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/admin/style/service.css" />
</head>
<body>

<h2><a href="?a=service&m=add">添加售后服务</a>商品 -- 售后服务</h2>

<div id="list">
	<table>
		<tr><th>售后服务名称</th><th>默认首选</th><th>操作</th></tr>
        {foreach from=$AllService key=key item=value}
			<tr><td>{$value->name}</td><td>{if $value->first == 1}<span class="green">是</span>{else}<span class="red">否</span> | <a href="?a=service&m=first&id={$value->id}">默认</a>{/if}</td><td><a href="?a=service&m=update&id={$value->id}"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=service&m=delete&id={$value->id}" onclick="return confirm('你真的要删除这个售后服务吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
            {foreachelse}
			<tr><td colspan="3">没有任何售后服务</td></tr>
        {/foreach}
	</table>
</div>
<div id="page">{$page}</div>

</body>
</html>