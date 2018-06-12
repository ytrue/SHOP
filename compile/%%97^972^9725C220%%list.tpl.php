<?php /* Smarty version 2.6.26, created on 2017-12-20 21:16:45
         compiled from default/public/list.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/list.css" />
</head>
<body>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div id="sait">
	当前位置：<a href="./">首页</a>
    <?php $_from = $this->_tpl_vars['FrontNav'][0]->sait; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
		&gt; <a href="?a=list&navid=<?php echo $this->_tpl_vars['key']; ?>
"><?php echo $this->_tpl_vars['value']; ?>
</a>
    <?php endforeach; endif; unset($_from); ?>
</div>

<div id="sidebar">
	<h2><?php echo $this->_tpl_vars['FrontNav'][0]->name; ?>
</h2>
	<ul style="margin:0 0 10px 0">
        <?php $_from = $this->_tpl_vars['FrontNav'][0]->child; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
			<li><a href="?a=list&navid=<?php echo $this->_tpl_vars['value']->id; ?>
"><?php echo $this->_tpl_vars['value']->name; ?>
<span class="gray"></span></a></li>
        <?php endforeach; endif; unset($_from); ?>
	</ul>
	<h2>当月热销</h2>
	<div style="margin:0 0 10px 0">
        <?php $_from = $this->_tpl_vars['NavSort']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
            <?php if ($this->_tpl_vars['key'] < 5): ?>
				<dl style="border:none;">
					<dt><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank"><img src="<?php echo $this->_tpl_vars['value']->thumbnail2; ?>
" style="width:100px;height:100px;" alt="<?php echo $this->_tpl_vars['value']->name; ?>
" title="<?php echo $this->_tpl_vars['value']->name; ?>
" /></a></dt>
					<dd class="price">￥<?php echo $this->_tpl_vars['value']->price_sale; ?>
</dd>
					<dd class="title"><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank"><?php echo $this->_tpl_vars['value']->name; ?>
</a></dd>
				</dl>
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>
	</div>
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
" style="width:100px;height:100px;" alt="连衣裙" title="连衣裙" /></a></dt>
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
	<h2>商品筛选</h2>
	<div class="filter">
				<p>品牌：<?php if ($_GET['brand']): ?><a href="<?php echo $this->_tpl_vars['url']; ?>
&brand=">全部</a><?php else: ?><span>全部</span><?php endif; ?>
            <?php $_from = $this->_tpl_vars['FrontBrand']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
                <?php if ($_GET['brand'] == $this->_tpl_vars['key']): ?>
					<span><?php echo $this->_tpl_vars['value']; ?>
</span>
                <?php else: ?>
					<a href="<?php echo $this->_tpl_vars['url']; ?>
&brand=<?php echo $this->_tpl_vars['key']; ?>
"><?php echo $this->_tpl_vars['value']; ?>
</a>
                <?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>
		</p>
                <?php $_from = $this->_tpl_vars['FrontAttr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
			<p>
                <?php echo $this->_tpl_vars['key']; ?>
：<?php if ($_GET['attr']): ?><a href="<?php echo $this->_tpl_vars['url']; ?>
&attr=">全部</a><?php else: ?><span>全部</span><?php endif; ?>
                <?php $_from = $this->_tpl_vars['value']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                    <?php $this->assign('attr', ($this->_tpl_vars['key']).":".($this->_tpl_vars['v'])); ?>
                    <?php if ($_GET['attr'] == $this->_tpl_vars['attr']): ?>
						<span><?php echo $this->_tpl_vars['v']; ?>
</span>
                    <?php else: ?>
						<a href="<?php echo $this->_tpl_vars['url']; ?>
&attr=<?php echo $this->_tpl_vars['key']; ?>
:<?php echo $this->_tpl_vars['v']; ?>
"><?php echo $this->_tpl_vars['v']; ?>
</a>
                    <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?>
			</p>
        <?php endforeach; endif; unset($_from); ?>
		 <!-- 价格区间-->
		<?php if ($this->_tpl_vars['FrontPrice'][0]->price): ?>
		<p>价格：<?php if ($_GET['price']): ?><a href="<?php echo $this->_tpl_vars['url']; ?>
&price=">全部</a><?php else: ?><span>全部</span><?php endif; ?>
            <?php endif; ?>
            <?php $_from = $this->_tpl_vars['FrontPrice'][0]->price; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
                <?php if ($_GET['price'] == $this->_tpl_vars['key']): ?>
					<span><?php echo $this->_tpl_vars['value']; ?>
</span>
                <?php else: ?>
					<a href="<?php echo $this->_tpl_vars['url']; ?>
&price=<?php echo $this->_tpl_vars['key']; ?>
"><?php echo $this->_tpl_vars['value']; ?>
</a>
                <?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>
		</p>
	</div>
	<h2>商品列表</h2>
	<div class="pro">
        <?php $_from = $this->_tpl_vars['ListGoods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
			<dl>
				<dt><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank"><img src="<?php echo $this->_tpl_vars['value']->thumbnail2; ?>
" alt="连衣裙" title="连衣裙" /></a></dt>
				<dd class="price"><strong>￥<?php echo $this->_tpl_vars['value']->price_sale; ?>
</strong> <del>￥<?php echo $this->_tpl_vars['value']->price_market; ?>
</del></dd>
				<dd class="title"><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank"><?php echo $this->_tpl_vars['value']->name; ?>
</a></dd>
				<dd class="commend"><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
#commend" target="_blank">已有<?php echo $this->_tpl_vars['value']->commendnum; ?>
人评价</a> <span class="green">(销售<strong><?php echo $this->_tpl_vars['value']->sales; ?>
</strong><?php echo $this->_tpl_vars['value']->unit; ?>
)</span></dd>
				<dd class="buy"><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank">购买</a> | <a href="?a=member&m=addCollect&id=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank">收藏</a> | <a href="?a=compare&m=setCompare&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->id; ?>
" target="_blank">比较</a></dd>
			</dl>
        <?php endforeach; endif; unset($_from); ?>
		<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>
	</div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>