<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/brand.css" />
<script type="text/javascript" src="view/admin/js/brand.js"></script>
</head>
<body>

<h2><a href="?a=brand">返回品牌列表</a>商品 -- 修改品牌</h2>

<form method="post" name="update" action="?a=brand&m=update&id={$OneBrand[0]->id}">
	<dl class="form">
		<dd>品牌名称：{$OneBrand[0]->name}</dd>
		<dd>官方网站：<input type="text" name="url" value="{$OneBrand[0]->url}" class="text" /> ( * 200内之内)</dd>
		<dd><span class="middle">品牌简介：</span><textarea name="info">{$OneBrand[0]->info}</textarea> <span class="middle">( * 200位以内 )</span></dd>
		<dd><input type="submit" name="send" onclick="return updateBrand();" value="修改品牌" class="submit" /></dd>
	</dl>
</form>

</body>
</html>