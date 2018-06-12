<?php /* Smarty version 2.6.26, created on 2017-12-16 19:23:55
         compiled from default/public/member_update.tpl */ ?>
﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城系统</title>
<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/default/style/member.css" />
</head>
<body>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 个人中心
</div>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/member_sidebar.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div id="main">
	<h2>修改收货地址</h2>
		<form action="?a=member&m=update&id=<?php echo $this->_tpl_vars['OneAddress'][0]->id; ?>
" method="post">
		<dl>
			<dd>江 浙 沪：<input type="radio" name="flag" value="1" checked="checked" /> 是 <input type="radio" name="flag" value="0" /> 否</dd>
			<dd>收 货 人：<input type="text" name="name" class="text" value="<?php echo $this->_tpl_vars['OneAddress'][0]->name; ?>
" /></dd>
			<dd>收货地址：<input type="text" name="address" class="text" value="<?php echo $this->_tpl_vars['OneAddress'][0]->address; ?>
"  /></dd>
			<dd>电子邮件：<input type="text" name="email" class="text"value="<?php echo $this->_tpl_vars['OneAddress'][0]->email; ?>
"  /></dd>
			<dd>邮政编码：<input type="text" name="code" class="text" value="<?php echo $this->_tpl_vars['OneAddress'][0]->code; ?>
" /></dd>
			<dd>手机号码：<input type="text" name="tel" class="text"  value="<?php echo $this->_tpl_vars['OneAddress'][0]->tel; ?>
"  /></dd>
			<dd>标志建筑：<input type="text" name="buildings" class="text" value="<?php echo $this->_tpl_vars['OneAddress'][0]->buildings; ?>
" /></dd>
			<dd><input type="submit" name="send" value="" class="submit"  /></dd>
		</dl>
	</form>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>