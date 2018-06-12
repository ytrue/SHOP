<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/attr.css" />
</head>
<body>

<h2><a href="?a=attr">返回自定义属性列表</a>商品 -- 添加自定义属性</h2>

<form method="post" name="add" action="?a=attr&m=add">
	<dl class="form">
		<dd>属性名称：<input type="text" name="name" class="text" /> <span class="red">[必填]</span> ( * 2-4位之间 )</dd>
		<dd>选择方式：<input type="radio" name="way" value="0" checked="checked" /> 单选 <input type="radio" name="way" value="1" /> 多选</dd>
		<dd><span class="middle">属性项目：</span><textarea name="item"></textarea> <span class="middle">( * 每个项目用'|'隔开，例如：白色|黑色|红色 )</span></dd>
		<dd>请选择一下关联的类别：</dd>
		{foreach from=$addNav key=key item=value}
		<dd>{$value->name}</dd>
		{if $value->child}
		<dd>{html_checkboxes name=nav options=$value->child}</dd>
		{/if}
		{foreachelse}
		<dd>没有任何类别，请先<a href="?a=nav&m=add">添加</a>类别</dd>
		{/foreach}
		<dd><input type="submit" name="send" onclick="return addAttr();" value="新增自定义属性" class="submit" /></dd>
	</dl>
</form>

</body>
</html>