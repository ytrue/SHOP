<?php /* Smarty version 2.6.26, created on 2017-12-19 22:32:53
         compiled from default/public/member_commend.tpl */ ?>
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

<form method="post" action="?a=member&m=commend&gid=<?php echo $_GET['goods_id']; ?>
">
	<input type="hidden" name="goods_id" value="<?php echo $_GET['goods_id']; ?>
" />
	<input type="hidden" name="order_id" value="<?php echo $_GET['order_id']; ?>
" />
	<input type="hidden" name="attr" value="<?php $_from = $this->_tpl_vars['GoodsOne']['attr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?><?php echo $this->_tpl_vars['key']; ?>
:<?php $_from = $this->_tpl_vars['value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?><?php echo $this->_tpl_vars['value']; ?>
<?php endforeach; endif; unset($_from); ?>;<?php endforeach; endif; unset($_from); ?>" />
	<div id="main">
		<h2>商品评价</h2>
		<div class="commend">
			<a href="?a=details&navid=<?php echo $this->_tpl_vars['GoodsOne']['nav']; ?>
&goodsid=<?php echo $this->_tpl_vars['GoodsOne']['id']; ?>
" target="_blank"><img src="<?php echo $this->_tpl_vars['GoodsOne']['thumbnail2']; ?>
" alt="<?php echo $this->_tpl_vars['GoodsOne']['name']; ?>
" /></a>
			<dl>
				<dt><a href="?a=details&navid=<?php echo $this->_tpl_vars['GoodsOne']['nav']; ?>
&goodsid=<?php echo $this->_tpl_vars['GoodsOne']['id']; ?>
" target="_blank"><?php echo $this->_tpl_vars['GoodsOne']['name']; ?>
</a></dt>
				<dd>
                    <?php $_from = $this->_tpl_vars['GoodsOne']['attr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
                        <?php echo $this->_tpl_vars['key']; ?>
:
                        <?php $_from = $this->_tpl_vars['value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
                            <?php echo $this->_tpl_vars['value']; ?>

                        <?php endforeach; endif; unset($_from); ?>
						;
                    <?php endforeach; endif; unset($_from); ?>
				</dd>
                <?php if ($this->_tpl_vars['CommendOne'][0]): ?>
					<dd>评分：
                        <?php if ($this->_tpl_vars['CommendOne'][0]->star == 5): ?><span class="star">★★★★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['CommendOne'][0]->star == 4): ?><span class="star">★★★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['CommendOne'][0]->star == 3): ?><span class="star">★★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['CommendOne'][0]->star == 2): ?><span class="star">★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['CommendOne'][0]->star == 1): ?><span class="star">★</span><?php endif; ?>
					</dd>
					<dd><?php echo $this->_tpl_vars['CommendOne'][0]->content; ?>
</dd>
					<dd>
                        <?php if ($this->_tpl_vars['CommendOne'][0]->re_content): ?>
							<span class="red">商家回复：<?php echo $this->_tpl_vars['CommendOne'][0]->re_content; ?>
</span>
                        <?php endif; ?>
					</dd>
					<dd><a href="?a=member&m=order_details&id=<?php echo $_GET['order_id']; ?>
">[返回订单]</a></dd>
                <?php else: ?>
					<dd>评分：
						<label for="star5"><input type="radio" id="star5" name="star" value="5" checked="checked" /> <span class="star">★★★★★</span></label>
						<label for="star4"><input type="radio" name="star" id="star4" value="4" /> <span class="star">★★★★</span></label>
						<label for="star3"><input type="radio" name="star" id="star3" value="3" /> <span class="star">★★★</span></label>
						<label for="star2"><input type="radio" name="star" id="star2" value="2" /> <span class="star">★★</span></label>
						<label for="star1"><input type="radio" name="star" id="star1" value="1" /> <span class="star">★</span></label>
					</dd>
					<dd><textarea name="content"></textarea></dd>
					<dd><input type="submit" name="send" value="发表评价" /> <a href="?a=member&m=order_details&id=<?php echo $_GET['order_id']; ?>
">[返回订单]</a></dd>
                <?php endif; ?>
			</dl>
		</div>
	</div>
</form>



<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>