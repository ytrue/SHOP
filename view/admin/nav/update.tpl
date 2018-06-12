<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城后台管理</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/admin/style/nav.css" />
	<script type="text/javascript" src="view/admin/js/nav.js"></script>
</head>
<body>

<h2><a href="?a=nav">返回导航条列表</a>商品 -- 修改导航条</h2>

<form method="post" name="update" action="?a=nav&m=update&id={$OneNav[0]->id}">
	<input type="hidden" name="flag" id="flag" />
	<dl class="form">
		<dd>名　　称：{$OneNav[0]->name} </dd>
		<dd><span class="middle">简　　介：</span><textarea name="info">{$OneNav[0]->info}</textarea> <span class="middle">( * 200位以内 )</span></dd>
        {if $OneNav[0]->sid != 0}
			<dd>关联品牌：{html_checkboxes options=$AllBrand selected=$selectedBrand name=brand}</dd>
        {/if}
		<dd>价格区间：{html_checkboxes options=$AllPrice selected=$selectedPrice name=price}</dd>
		<dd><input type="submit" name="send" onclick="return updateNav();" value="修改导航" class="submit" /></dd>
	</dl>
</form>

</body>
</html>