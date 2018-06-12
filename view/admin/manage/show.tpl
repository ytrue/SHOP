<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/manage.css" />
</head>
<body>

<h2><a href="?a=manage&m=add">添加管理员</a>系统 -- 管理员列表</h2>

<div id="list">
	<table>
		<tr><th>用户名</th><th>等级</th><th>登录次数</th><th>最后登录ip</th><th>最后登录时间</th><th>操作</th></tr>
		{foreach from=$AllManage key=key item=value}
		<tr><td>{$value->user}</td><td>{$value->level_name}</td><td>{$value->login_count}</td><td>{$value->last_ip}</td><td>{$value->last_time}</td><td><a href="?a=manage&m=update&id={$value->id}"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=manage&m=delete&id={$value->id}" onclick="return confirm('你真的要删除这个管理员吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
		{foreachelse}
		<tr><td colspan="6">没有任何管理员</td></tr>
		{/foreach}
	</table>
</div>
<div id="page">{$page}</div>

</body>
</html>