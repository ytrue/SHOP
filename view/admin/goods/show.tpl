<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/goods.css" />
</head>
<body>

<h2><a href="?a=goods&m=add">添加商品</a>商品 -- 商品列表</h2>

<div id="list">
	<table>
		<tr><th>商品名称</th><th>商品编号</th><th>商品售价</th><th>商品类型</th><th>品牌</th><th>是否上架</th><th>库存</th><th>操作</th></tr>
		{foreach from=$AllGoods key=key item=value}
		<tr><td>{$value->name|truncate:18}</td><td>{$value->sn}</td><td>{$value->price_sale}/元</td><td>{$value->nav_name}</td><td>{$value->brand}</td>
		<td>
		{if $value->is_up == 0}
		<span class="red">否</span> <a href="?a=goods&m=isUp&act=up&id={$value->id}">[上架]</a>
		{else}
		<span class="green">是</span> <a href="?a=goods&m=isUp&act=down&id={$value->id}">[下架]</a>
		{/if}
		</td>
		<td>{$value->inventory}</td><td><a href="?a=goods&m=update&id={$value->id}"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=goods&m=delete&id={$value->id}" onclick="return confirm('你真的要删除这个商品吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
		{foreachelse}
		<tr><td colspan="8">没有任何商品</td></tr>
		{/foreach}
	</table>
</div>
<div id="page">{$page}</div>

</body>
</html>