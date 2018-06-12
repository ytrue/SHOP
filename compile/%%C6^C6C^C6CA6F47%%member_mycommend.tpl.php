<?php /* Smarty version 2.6.26, created on 2017-12-18 20:14:45
         compiled from default/public/member_mycommend.tpl */ ?>
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
	<h2>我的评价</h2>
	<div class="mycommend">
			<?php $_from = $this->_tpl_vars['MyCommend']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
			<div class="mycommend">
				<p><img src="<?php echo $this->_tpl_vars['value']->thumbnail2; ?>
" /></p>
				<p><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->goods_id; ?>
" target="_blank"><?php echo $this->_tpl_vars['value']->name; ?>
</a></p>
				<p class="attr"><?php echo $this->_tpl_vars['value']->attr; ?>
</p>
				<p><em><?php echo $this->_tpl_vars['value']->date; ?>
</em><?php echo $this->_tpl_vars['value']->content; ?>
</p>
				<p>
						<?php if ($this->_tpl_vars['value']->star == 5): ?><span class="star">★★★★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 4): ?><span class="star">★★★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 3): ?><span class="star">★★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 2): ?><span class="star">★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 1): ?><span class="star">★</span><?php endif; ?>
				</p>
				<p>
					<?php if ($this->_tpl_vars['value']->re_content): ?>
						<span class="red">商家回复：<?php echo $this->_tpl_vars['value']->re_content; ?>
</span>
					<?php endif; ?>
				</p>
			</div>
			<?php endforeach; endif; unset($_from); ?>	
	</div>
	<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>
</div>



<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>