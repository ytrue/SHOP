<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/member.css" />
</head>
<body>
{include file='default/public/header.tpl'}
<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 个人中心
</div>

{include file='default/public/member_sidebar.tpl'}

<div id="main">
	<h2>订单详情</h2>
	<table id="cart" cellspacing="1">
		<caption>订单状态</caption>
		<tr><th>订单号</th><th>订单状态</th><th>支付状态</th><th>配送状态</th></tr>
		<tr><td>{$OneOrder[0]->ordernum}</td><td>{$OneOrder[0]->order_state}</td><td>{$OneOrder[0]->order_pay}</td><td>{$OneOrder[0]->order_delivery}</td></tr>
	</table>

	<table id="cart" cellspacing="1">
		<caption>商品列表</caption>
		<tr><th>编号</th><th>名称</th><th>属性</th><th class="th">售价</th><th class="th">数量</th><th class="th">小计</th><th>评价</th></tr>
        {assign var=total value=0}
        {foreach from=$OneOrder[0]->goods key=key item=value}
			<tr><td>{$value.sn}</td><td><a href="?a=details&navid={$value.nav}&goodsid={$value.id}" target="_blank">{$value.name}</a></td><td>
                    {foreach from=$value.attr key=k1 item=v1}
                        {$k1}:
                        {foreach from=$v1 item=v2}
                            {$v2}
                        {/foreach}
                    {/foreach}
                    {assign var=total value=$total+$value.price_sale*$value.num}
				</td><td class="price">{$value.price_sale}/元</td><td>{$value.num}</td><td class="price">{$value.price_sale*$value.num}/元</td>
				<td>
                    {if $OneOrder[0]->order_delivery == '已发货'}
						<a href="?a=member&m=commend&goods_id={$value.id}&order_id={$OneOrder[0]->id}">评价</a>
                    {else}
						---
                    {/if}
				</td>
			</tr>
        {/foreach}
	</table>

	<table id="cart" cellspacing="1">
		<caption>配送信息</caption>
		<tr><th>配送状态</th><th>物流方式</th><th>运单号</th></tr>
		<tr><td>{$OneOrder[0]->order_delivery}</td><td>
                {if $OneOrder[0]->order_delivery == '已发货'}
					<a href="{$OneOrder[0]->delivery_url}" target="_blank">{$OneOrder[0]->delivery_name}</a>
                {/if}
			</td><td>{$OneOrder[0]->delivery_number}</td></tr>
	</table>

	<table id="cart" cellspacing="1">
		<caption>支付信息</caption>
		<tr><th>支付状态</th><th>支付方式</th><th>总金额</th></tr>
		<tr><td>{$OneOrder[0]->order_pay}</td><td>{$OneOrder[0]->pay}</td><td><span class="red">{$OneOrder[0]->price}/元</span></td></tr>
	</table>

	<table id="cart" cellspacing="1">
		<caption>备注信息</caption>
		<tr><th>备注信息</th><th>缺货方式</th></tr>
		<tr><td>{$OneOrder[0]->text}</td><td>{$OneOrder[0]->ps}</td></tr>
	</table>

	<p style="text-align:center;padding:10px;">
        {if $OneOrder[0]->order_state == '已取消' || $OneOrder[0]->order_pay == '已付款' || $OneOrder[0]->order_delivery == '已配货' || $OneOrder[0]->order_delivery == '已发货'}
            {if $OneOrder[0]->refund == 1}
				<span class="red">此订单正在申请退款中！</span>
            {else}
                {if $OneOrder[0]->refund == 2}
					<span class="green">此订单已经退款成功！</span>
                {else}
					<span class="red">此订单已被锁定！无法支付！</span>
                {/if}
            {/if}
        {else}
			<a href="?a=member&m=alipay&id={$OneOrder[0]->id}"><img src="view/default/images/fu.gif" alt="付款" style="border:none;" /></a>
        {/if}
	</p>

	<p style="text-align:center"><a href="{$prev}">[返回]</a></p>
</div>

{include file='default/public/footer.tpl'}
</body>
</html>