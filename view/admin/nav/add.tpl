<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/nav.css" />
<script type="text/javascript" src="view/admin/js/ajax.js"></script>
<script type="text/javascript" src="view/admin/js/nav.js"></script>
</head>
<body>

<h2><a href="?a=nav">返回导航条列表</a>商品 -- 添加导航</h2>


<form method="post" name="add" action="?a=nav&m=add">
	<input type="hidden" name="flag" id="flag" />
	<input type="hidden" name="sid" value="{$OneNav[0]->id}" />
	<dl class="form">
		{if $OneNav}<dd>主类名称：{$OneNav[0]->name}</dd>{/if}
		<dd>名　　称：<input type="text" name="name"  id="name" onblur="checkName();" class="text" /> ( * 2-4位之间 )</dd>
		<dd><span class="middle">简　　介：</span><textarea name="info"></textarea> <span class="middle">( * 200位以内 )</span></dd>
		{if $OneNav}
		<dd>关联品牌：{html_checkboxes options=$AllBrand name=brand}</dd>
		{/if}
		<dd>价格区间:{html_checkboxes options=$AllPrice name=price}</dd>
		<dd><input type="submit" name="send" onclick="return addNav();" value="新增导航" class="submit" /></dd>
	</dl>
</form>


</body>
</html>