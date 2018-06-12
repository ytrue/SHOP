<?php /* Smarty version 2.6.26, created on 2017-12-15 22:21:14
         compiled from admin/Delivery/update.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城后台管理</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/admin/style/delivery.css" />
	<script type="text/javascript" src="view/admin/js/delivery.js"></script>
</head>
<body>

<h2><a href="?a=delivery">返回快递列表</a>订单 -- 修改快递</h2>

<form method="post" name="update" action="?a=delivery&m=update&id=<?php echo $this->_tpl_vars['OneDelivery'][0]->id; ?>
">
	<dl class="form">
		<dd>快递名称：<?php echo $this->_tpl_vars['OneDelivery'][0]->name; ?>
</dd>
		<dd>官方网站：<input type="text" name="url" value="<?php echo $this->_tpl_vars['OneDelivery'][0]->url; ?>
" class="text" /> ( * 200内之内)</dd>
		<dd><span class="middle">快递描述：</span><textarea name="info"><?php echo $this->_tpl_vars['OneDelivery'][0]->info; ?>
</textarea> <span class="middle">( * 200位以内 )</span></dd>
		<dd>省内运费：<input type="text" name="price_in" class="text" value="<?php echo $this->_tpl_vars['OneDelivery'][0]->price_in; ?>
" /> ( * 单位/元，省内的起步运费)</dd>
		<dd>省外运费：<input type="text" name="price_out" class="text" value="<?php echo $this->_tpl_vars['OneDelivery'][0]->price_out; ?>
" /> ( * 单位/元，省外的起步运费)</dd>
		<dd>额外运费：<input type="text" name="price_add" class="text" value="<?php echo $this->_tpl_vars['OneDelivery'][0]->price_add; ?>
" /> ( * 单位/元，超过10公斤之后每1公斤的运费)</dd>
		<dd><input type="submit" name="send" onclick="return updateDelivery();" value="修改快递" class="submit" /></dd>
	</dl>
</form>

</body>
</html>