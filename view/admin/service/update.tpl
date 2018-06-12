 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/service.css" />
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
</head>
<body>

<h2><a href="?a=service">返回售后服务列表</a>商品 -- 售后服务</h2>

<form method="post" name="update" action="?a=service&m=update&id={$OneService[0]->id}">
	<dl class="form">
		<dd>售后服务名称：{$OneService[0]->name}</dd>
		<dd><textarea id="TextArea1" name="content" class="ckeditor">{$OneService[0]->content}</textarea></dd>
		<dd>售后服务首选：<input type="radio" name="first" value="0" {if $OneService[0]->first == 0}checked="checked"{else}{/if} /> 否 <input type="radio" name="first" value="1" {if $OneService[0]->first == 1}checked="checked"{else}{/if} /> 是</dd>
		<dd><input type="submit" name="send" value="修改售后服务" class="submit" /></dd>
	</dl>
</form>

</body>
</html>