<?php /* Smarty version 2.6.26, created on 2017-12-16 19:20:07
         compiled from default/public/member_address.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	<h2>收货地址</h2>
	<table id="cart" cellspacing="1">
		<tr><th>收货人</th><th>地址</th><th>邮编</th><th>电话</th><th>电子邮件</th><th>标志性建筑</th><th>操作</th></tr>
		<?php $_from = $this->_tpl_vars['AllAddress']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
		<tr><td><?php echo $this->_tpl_vars['value']->name; ?>
</td><td><?php echo $this->_tpl_vars['value']->address; ?>
</td><td><?php echo $this->_tpl_vars['value']->code; ?>
</td><td><?php echo $this->_tpl_vars['value']->tel; ?>
</td><td><?php echo $this->_tpl_vars['value']->email; ?>
</td><td><?php echo $this->_tpl_vars['value']->buildings; ?>
</td><td>
                <?php if ($this->_tpl_vars['value']->selected == 1): ?>
					<span style="color:green;'">是|</span>
                <?php else: ?>
					<a href="?a=member&m=selected&id=<?php echo $this->_tpl_vars['value']->id; ?>
">首选|</a>
                <?php endif; ?>
				<a href="?a=member&m=update&id=<?php echo $this->_tpl_vars['value']->id; ?>
">修改</a>|
				<a href="?a=member&m=delete&id=<?php echo $this->_tpl_vars['value']->id; ?>
">删除</a>
			    </td></tr>
		<?php endforeach; endif; unset($_from); ?>
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
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>