<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/flow.css" />
	<script type="text/javascript" src="view/default/js/flow.js"></script>
</head>
<body>
{include file='default/public/header.tpl'}
<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 结算
</div>


<form method="post" name="flow" action="?a=cart&m=order">
	<table id="cart" cellspacing="1">
		<caption>商品列表</caption>
		<tr><th>编号</th><th>名称</th><th>属性</th><th class="th">售价</th><th class="th">数量</th><th>总重量</th><th class="th">小计</th></tr>
        {assign var=total value=0}
        {foreach from=$FrontCart key=key item=value}
			<tr><td>{$value.sn}</td><td>{$value.name}</td><td>
                    {foreach from=$value.attr key=k1 item=v1}
                        {$k1}:
                        {foreach from=$v1 item=v2}
                            {$v2}
                        {/foreach}
                    {/foreach}
                    {assign var=total value=$total+$value.price_sale*$value.num}
                    {assign var=weight value=$weight+$value.weight*$value.num}
				</td><td class="price">{$value.price_sale}/元</td><td>{$value.num}</td><td>{$value.weight*$value.num}/kg</td><td class="price">{$value.price_sale*$value.num}/元</td></tr>
        {/foreach}
	</table>


	<p><a href="?a=cart">返回修改</a> | 商品总计：<strong>{$total}</strong>/元</p>

	<table id="cart" cellspacing="1">
		<caption>收货人信息</caption>
		<tr><td width="25%">收货人信息：</td><td width="25%">{$FrontAddress[0]->name}</td><td width="25%">电子邮件：</td><td width="25%">{$FrontAddress[0]->email}</td></tr>
		<tr><td>收货人地址：</td><td>{$FrontAddress[0]->address}</td><td>邮政编码：</td><td>{$FrontAddress[0]->code}</td></tr>
		<tr><td>手机信息：</td><td>{$FrontAddress[0]->tel}</td><td>标志性建筑：</td><td>{$FrontAddress[0]->buildings}</td></tr>
	</table>

	<p><a href="?a=member&m=address">修改收货人信息</a></p>

	<table id="cart" cellspacing="1">
		<caption>物流配送信息</caption>
		<tr><th width="10%"></th><th width="20%">名称</th><th width="50%">描述</th><th>起步运费</th></tr>
        {foreach from=$FrontDelivery key=key item=value}
			<tr><td><input type="radio" name="delivery_radio" {if $key == 0 } checked="checked" {/if} weight="{$weight}" add="{$value->price_add}" value="{if $FrontAddress[0]->flag == 1}{$value->price_in}{else}{$value->price_out}{/if}" title="{$value->name}" onclick="changeDelivery(this);"  /></td><td>{$value->name}</td><td>{$value->info}</td>
				<td>{if $FrontAddress[0]->flag == 1}{$value->price_in}{else}{$value->price_out}{/if}/元</td>
			</tr>
        {/foreach}
		<tr><td colspan="4">总运费：<span id="price1"></span> + ({$weight} - 10) * <span id="price2"></span> = <span id="price3"></span>/元</td></tr>
	</table>

	<p>您要支付的总运费为：<strong id="delivery"></strong>/元</p>

	<table id="cart" cellspacing="1">
		<caption>支付方式</caption>
		<tr><th width="10%"></th><th width="20%">名称</th><th width="50%">描述</th><th>手续费</th></tr>
		<tr><td><input type="radio" name="pay_radio" value="0" title="支付宝" onclick="changePay(this);" checked="checked" /></td><td>支付宝</td><td>通过支付宝在线支付</td><td>0/元</td></tr>
		<tr><td><input type="radio" name="pay_radio" value="2" title="银行转账/汇款" onclick="changePay(this);" /></td><td>银行转账/汇款</td><td>通过转账汇款，联系客服，提供汇款清单和商品订单号</td><td>2/元</td></tr>
		<tr><td><input type="radio" name="pay_radio" value="0" title="货到付款" onclick="changePay(this);" /></td><td>货到付款</td><td>通过配送人员，送货上门，收取费用</td><td>0/元</td></tr>
	</table>

	<p>您要支付的手运费为：<strong id="pay"></strong>/元</p>

	<table id="cart" cellspacing="1">
		<caption>备注信息</caption>
		<tr><th width="30%"'>订单备注：</th><td class="left"><textarea name="text"></textarea></td></tr>
		<tr><th>缺货处理：</th><td class="left"><input type="radio" name="ps" value="等货物全了再发" /> 等货物全了再发 <input type="radio" name="ps" checked="checked" value="先发有货的" /> 先发有货的 <input type="radio" name="ps" value="取消订单" /> 取消订单</td>
	</table>

	<p id="total">商品总计：<strong>{$total}</strong>/元 + 物流运费：<strong></strong>/元 + 支付手续费：<strong></strong>/元</p>

	<p>您总共要支付的金额为：<strong class="price" id="price">0</strong>/元</p>

	<input type="hidden" name="user" value="{$smarty.cookies.user}" />
	<input type="hidden" name="name" value="李炎恢" />
	<input type="hidden" name="email" value="bnbbs@163.com" />
	<input type="hidden" name="address" value="江苏盐城大庆中路" />
	<input type="hidden" name="code" value="224000" />
	<input type="hidden" name="tel" value="13748930203" />
	<input type="hidden" name="buildings" value="移动总部斜对面" />
	<input type="hidden" name="delivery" value="" />
	<input type="hidden" name="pay" value="" />
	<input type="hidden" name="price" value="" />


	<p style="text-align:center;"><input type="submit" class="submit" name="send" value="" /></p>
</form>

{include file='default/public/footer.tpl'}
</body>
</html>