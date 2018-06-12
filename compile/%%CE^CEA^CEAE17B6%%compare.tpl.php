<?php /* Smarty version 2.6.26, created on 2017-12-20 20:26:48
         compiled from default/public/compare.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/compare.css" />
</head>
<body>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 商品对比
</div>

<div id="sidebar">
	<h2>浏览记录</h2>
	<div style="margin:0 0 10px 0">
        <?php $_from = $this->_tpl_vars['FrontRecord']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
            <?php if ($this->_tpl_vars['key'] < 5): ?>
				<dl style="border:none;">
					<dt><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']['nav']; ?>
&goodsid=<?php echo $this->_tpl_vars['value']['id']; ?>
" target="_blank"><img src="<?php echo $this->_tpl_vars['value']['thumbnail2']; ?>
" style="width:100px;height:100px;" alt="<?php echo $this->_tpl_vars['value']['name']; ?>
" title="<?php echo $this->_tpl_vars['value']['name']; ?>
" /></a></dt>
					<dd class="price">￥<?php echo $this->_tpl_vars['value']['price']; ?>
</dd>
					<dd class="title"><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']['nav']; ?>
&goodsid=<?php echo $this->_tpl_vars['value']['id']; ?>
" target="_blank"><?php echo $this->_tpl_vars['value']['name']; ?>
</a></dd>
				</dl>
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>
		<p><a href="?a=list&m=delRecord">清空记录</a></p>
	</div>
</div>

<div id="main">
	<h2>同类商品对比</h2>
	<div class="pro">
        <?php $_from = $this->_tpl_vars['Compare']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
			<dl>
				<dt><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank"><img src="<?php echo $this->_tpl_vars['value']->thumbnail2; ?>
" alt="<?php echo $this->_tpl_vars['value']->name; ?>
" title="<?php echo $this->_tpl_vars['value']->name; ?>
" /></a></dt>
				<dd class="price">价格：<strong>￥<?php echo $this->_tpl_vars['value']->price_sale; ?>
</strong> <del>￥<?php echo $this->_tpl_vars['value']->price_market; ?>
</del></dd>
				<dd class="title"><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank"><?php echo $this->_tpl_vars['value']->name; ?>
</a></dd>
				<dd>编号：<?php echo $this->_tpl_vars['value']->sn; ?>
</dd>
				<dd>品牌：<?php echo $this->_tpl_vars['value']->brand; ?>
</dd>
				<dd>属性：<?php echo $this->_tpl_vars['value']->attr; ?>
</dd>
				<dd>重量：<?php echo $this->_tpl_vars['value']->weight; ?>
kg</dd>
				<dd>评论：<a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
#commend" target="_blank">已有<?php echo $this->_tpl_vars['value']->count; ?>
人评价</a></dd>
				<dd>销量：已销售<strong><?php echo $this->_tpl_vars['value']->sales; ?>
</strong><?php echo $this->_tpl_vars['value']->unit; ?>
</dd>
				<dd style="text-align:center;"><a href="?a=compare&m=delCompare&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
">删除此对比商品</a></dd>
			</dl>
        <?php endforeach; endif; unset($_from); ?>
		<div id="page"><a href="?a=compare&m=clearCompare" style="padding:8px;font-size:14px;">清空对比商品</a></div>
	</div>
</div>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>