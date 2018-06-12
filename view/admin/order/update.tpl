<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城后台管理</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/admin/style/order.css" />
	<script type="text/javascript" src="view/admin/js/order.js"></script>
</head>
<body>

<h2><a href="?a=order">返回订单列表</a>订单 -- 修改订单</h2>

<div id="list">

	<table id="cart" cellspacing="1">
		<caption>订单信息</caption>
		<tr><th>订单编号</th><th>下单时间</th></tr>
		<tr><td>{$OneOrder[0]->ordernum}</td><td>{$OneOrder[0]->date}</td></tr>
	</table>

	<table id="cart" cellspacing="1">
		<caption>商品列表</caption>
		<tr><th>编号</th><th>名称</th><th>属性</th><th class="th">售价</th><th class="th">数量</th><th class="th">小计</th></tr>
        {assign var=total value=0}
        {foreach from=$OneOrder[0]->goods key=key item=value}
			<tr><td>{$value.sn}</td><td>{$value.name}</td><td>
                    {foreach from=$value.attr key=k1 item=v1}
                        {$k1}:
                        {foreach from=$v1 item=v2}
                            {$v2}
                        {/foreach}
                    {/foreach}
                    {assign var=total value=$total+$value.price_sale*$value.num}
				</td><td class="price">{$value.price_sale}/元</td><td>{$value.num}</td><td class="price">{$value.price_sale*$value.num}/元</td></tr>
        {/foreach}
	</table>

	<table id="cart" cellspacing="1">
		<caption>用户信息</caption>
		<tr><th>用户名</th><th>收货人</th><th>电子邮件</th></tr>
		<tr><td>{$OneOrder[0]->user}</td><td>{$OneOrder[0]->name}</td><td>{$OneOrder[0]->email}</td></tr>
	</table>

	<table id="cart" cellspacing="1">
		<caption>送货信息</caption>
		<tr><th>邮政编码</th><th>手机号码</th><th>标志性建筑</th><th>收货地址</th></tr>
		<tr><td>{$OneOrder[0]->code}</td><td>{$OneOrder[0]->tel}</td><td>{$OneOrder[0]->buildings}</td><td>{$OneOrder[0]->address}</td></tr>
	</table>

	<table id="cart" cellspacing="1">
		<caption>支付信息</caption>
		<tr><th>物流方式</th><th>支付方式</th><th>费用</th></tr>
		<tr><td>{$OneOrder[0]->delivery}</td><td>{$OneOrder[0]->tel}</td><td><span class="red">{$OneOrder[0]->price}/元</span></td></tr>
	</table>

	<table id="cart" cellspacing="1">
		<caption>备注信息</caption>
		<tr><th>备注信息</th><th>缺货方式</th></tr>
		<tr><td>{$OneOrder[0]->text}</td><td>{$OneOrder[0]->ps}</td></tr>
	</table>

</div>

<form method="post" name="update" action="?a=order&m=update&id={$OneOrder[0]->id}">
	<input type="hidden" name="user" value="{$OneOrder[0]->user}">
	<dl class="form">
        {if $OneOrder[0]->order_state == '已取消'}
			<dd>订单状态：<span class="red">已取消，此订单已失效，可以删除！</span></dd>
        {else}
			<dd>订单状态：
				<input type="radio" name="order_state" {if $OneOrder[0]->order_state == '未确认'}checked="checked"{/if} value="未确认" /> 未确认
				<input type="radio" name="order_state" {if $OneOrder[0]->order_state == '已确认'}checked="checked"{/if} value="已确认" /> 已确认
				<input type="radio" name="order_state" {if $OneOrder[0]->order_state == '已取消'}checked="checked"{/if} value="已取消" /> 已取消
			</dd>
			<dd>支付状态：
				<input type="radio" name="order_pay" {if $OneOrder[0]->order_pay == '未付款'}checked="checked"{/if} value="未付款" /> 未付款
				<input type="radio" name="order_pay" {if $OneOrder[0]->order_pay == '已付款'}checked="checked"{/if} value="已付款" /> 已付款
			</dd>
			<dd>配送状态：
				<input type="radio" name="order_delivery" {if $OneOrder[0]->order_delivery == '未发货'}checked="checked"{/if} value="未发货" /> 未发货
				<input type="radio" name="order_delivery" {if $OneOrder[0]->order_delivery == '已配货'}checked="checked"{/if} value="已配货" /> 已配货
				<input type="radio" name="order_delivery" {if $OneOrder[0]->order_delivery == '已发货'}checked="checked"{/if} value="已发货" /> 已发货
			</dd>
			<dd class="delivery">
				物流配送：<select name="delivery_name" onchange="changeDelivery();">
					<option value="0"> -- 请选择一家物流 -- </option>
                    {foreach from=$AllDelivery key=key item=value}
                        {if $OneOrder[0]->delivery_name == $value->name}
							<option value="{$value->name}" url="{$value->url}" selected="selected">{$value->name}</option>
                        {else}
							<option value="{$value->name}" url="{$value->url}">{$value->name}</option>
                        {/if}
                    {/foreach}
				</select> <input type="hidden" value="{$OneOrder[0]->delivery_url}" name="delivery_url" />
			</dd>
			<dd class="delivery">
				运 单 号：<input type="text" name="delivery_number" class="text" value="{$OneOrder[0]->delivery_number}" />
			</dd>
        {/if}
        {if $OneOrder[0]->refund == 1}
			<dd><span class="red">此订单正在申请退款中，如确认无误，请勾上：</span> <label for="refund"><input type="checkbox" value="2" name="refund" id="refund" />确认退款</label></dd>
        {/if}
        {if $OneOrder[0]->refund == 2}
			<dd><span class="red">此订单已经退款成功！</dd>
        {/if}
		<dd><input type="submit" name="send" class="submit" value="修改订单" /></dd>
	</dl>
</form>

</body>
</html>