<?php /* Smarty version 2.6.26, created on 2017-12-11 21:37:37
         compiled from admin/service/add.tpl */ ?>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/service.css" />
<script type="text/javascript" src="view/admin/js/ajax.js"></script>
<script type="text/javascript" src="view/admin/js/service.js"></script>
<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
</head>
<body>

<h2><a href="?a=service">返回售后服务列表</a>商品 -- 添加售后服务</h2>

<form method="post" name="add" action="?a=service&m=add">
	<input type="hidden" name="flag" id="flag" />
	<dl class="form">
		<dd>售后服务名称：<input type="text" id="name" onblur="checkName();" name="name" class="text" /> ( * 2-20位之间 ) <span class="red">[必填]</span></dd>
		<dd><textarea id="TextArea1" name="content" class="ckeditor"></textarea></dd>
		<dd>售后服务首选：<input type="radio" name="first" value="0" checked="checked" /> 否 <input type="radio" name="first" value="1" /> 是</dd>
		<dd><input type="submit" name="send" onclick="return addService();" value="新增售后服务" class="submit" /></dd>
	</dl>
</form>


</body>
</html>