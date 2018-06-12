<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/compare.css" />
</head>
<body>
{include file='default/public/header.tpl'}
<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 商品对比
</div>

<div id="sidebar">
	<h2>浏览记录</h2>
	<div style="margin:0 0 10px 0">
        {foreach from=$FrontRecord key=key item=value}
            {if $key < 5}
				<dl style="border:none;">
					<dt><a href="?a=details&navid={$value.nav}&goodsid={$value.id}" target="_blank"><img src="{$value.thumbnail2}" style="width:100px;height:100px;" alt="{$value.name}" title="{$value.name}" /></a></dt>
					<dd class="price">￥{$value.price}</dd>
					<dd class="title"><a href="?a=details&navid={$value.nav}&goodsid={$value.id}" target="_blank">{$value.name}</a></dd>
				</dl>
            {/if}
        {/foreach}
		<p><a href="?a=list&m=delRecord">清空记录</a></p>
	</div>
</div>

<div id="main">
	<h2>同类商品对比</h2>
	<div class="pro">
        {foreach from=$Compare key=key item=value}
			<dl>
				<dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img src="{$value->thumbnail2}" alt="{$value->name}" title="{$value->name}" /></a></dt>
				<dd class="price">价格：<strong>￥{$value->price_sale}</strong> <del>￥{$value->price_market}</del></dd>
				<dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">{$value->name}</a></dd>
				<dd>编号：{$value->sn}</dd>
				<dd>品牌：{$value->brand}</dd>
				<dd>属性：{$value->attr}</dd>
				<dd>重量：{$value->weight}kg</dd>
				<dd>评论：<a href="?a=details&navid={$value->nav}&goodsid={$value->id}#commend" target="_blank">已有{$value->count}人评价</a></dd>
				<dd>销量：已销售<strong>{$value->sales}</strong>{$value->unit}</dd>
				<dd style="text-align:center;"><a href="?a=compare&m=delCompare&goodsid={$value->id}">删除此对比商品</a></dd>
			</dl>
        {/foreach}
		<div id="page"><a href="?a=compare&m=clearCompare" style="padding:8px;font-size:14px;">清空对比商品</a></div>
	</div>
</div>

{include file='default/public/footer.tpl'}
</body>
</html>