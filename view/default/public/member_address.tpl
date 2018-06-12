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
	<h2>收货地址</h2>
	<table id="cart" cellspacing="1">
		<tr><th>收货人</th><th>地址</th><th>邮编</th><th>电话</th><th>电子邮件</th><th>标志性建筑</th><th>操作</th></tr>
		{foreach from=$AllAddress key=key item=value}
		<tr><td>{$value->name}</td><td>{$value->address}</td><td>{$value->code}</td><td>{$value->tel}</td><td>{$value->email}</td><td>{$value->buildings}</td><td>
                {if $value->selected == 1}
					<span style="color:green;'">是|</span>
                {else}
					<a href="?a=member&m=selected&id={$value->id}">首选|</a>
                {/if}
				<a href="?a=member&m=update&id={$value->id}">修改</a>|
				<a href="?a=member&m=delete&id={$value->id}">删除</a>
			    </td></tr>
		{/foreach}
	</table>
	<p style="text-align:center;margin:5px 0;"><a href="?a=cart&m=flow">[去结算中心]</a></p>
		<form action="" method="post">
		<dl>
			<dd>江 浙 沪：<input type="radio" name="flag" value="1" checked="checked" /> 是 <input type="radio" name="flag" value="0" /> 否</dd>
			<dd>收 货 人：<input type="text" name="name" class="text" /></dd>
			<dd>收货地址：<input type="text" name="address" class="text" /></dd>
			<dd>电子邮件：<input type="text" name="email" class="text" /></dd>
			<dd>邮政编码：<input type="text" name="code" class="text" /></dd>
			<dd>手机号码：<input type="text" name="tel" class="text" /></dd>
			<dd>标志建筑：<input type="text" name="buildings" class="text" /></dd>
			<dd><input type="submit" name="send" value="" class="submit" /></dd>
		</dl>
	</form>
</div>
{include file='default/public/footer.tpl'}
</body>
</html>