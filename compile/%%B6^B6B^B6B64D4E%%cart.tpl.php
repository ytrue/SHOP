<?php /* Smarty version 2.6.26, created on 2017-12-16 19:35:38
         compiled from default/public/cart.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/cart.css" />
	<script type="text/javascript" src="view/default/js/ajax.js"></script>
	<script type="text/javascript" src="view/default/js/cart.js"></script>
</head>
<body>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 购物车
</div>


<table id="cart" cellspacing="1">
	<tr><th>编号</th><th>名称</th><th>属性</th><th>重量</th><th class="th">售价</th><th class="th">数量</th><th class="th">小计</th><th class="th">操作</th></tr>
    <?php $this->assign('total', 0); ?>
    <?php $_from = $this->_tpl_vars['FrontCart']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
		<tr><td><?php echo $this->_tpl_vars['value']['sn']; ?>
</td><td><?php echo $this->_tpl_vars['value']['name']; ?>
</td><td>
                <?php $_from = $this->_tpl_vars['value']['attr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k1'] => $this->_tpl_vars['v1']):
?>
                    <?php echo $this->_tpl_vars['k1']; ?>
:
                    <?php $_from = $this->_tpl_vars['v1']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['v2']):
?>
                        <?php echo $this->_tpl_vars['v2']; ?>

                    <?php endforeach; endif; unset($_from); ?>
                <?php endforeach; endif; unset($_from); ?>
                <?php $this->assign('total', $this->_tpl_vars['total']+$this->_tpl_vars['value']['price_sale']*$this->_tpl_vars['value']['num']); ?>
			</td><td><?php echo $this->_tpl_vars['value']['weight']; ?>
/kg</td><td class="price"><?php echo $this->_tpl_vars['value']['price_sale']; ?>
/元</td><td><input type="text" name="num" onkeyup="changeNum(<?php echo $this->_tpl_vars['value']['id']; ?>
,this.value);" class="small" value="<?php echo $this->_tpl_vars['value']['num']; ?>
" /></td><td class="price"><?php echo $this->_tpl_vars['value']['price_sale']*$this->_tpl_vars['value']['num']; ?>
/元</td><td><a href="?a=cart&m=delProduct&id=<?php echo $this->_tpl_vars['value']['id']; ?>
">删除</a></td></tr>
    <?php endforeach; endif; unset($_from); ?>
</table>

<p><a href="./">继续购物</a> | <a href="?a=cart&m=clearProduct">清空购物车</a> | 共计：<strong class="price"><?php echo $this->_tpl_vars['total']; ?>
</strong>/元</p>

<p><a href="?a=cart&m=flow"><img src="view/default/images/checkout.gif" /></a></p>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>