<?php /* Smarty version 2.6.26, created on 2017-12-17 21:01:29
         compiled from admin/commend/show.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'truncate', 'admin/commend/show.tpl', 17, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/commend.css" />
</head>
<body>

<h2>商品 -- 评价列表</h2>

<div id="list">
	<table>
		<tr><th>商品名称</th><th>评价内容</th><th>回复内容</th><th>评价星级</th><th>评价者</th><th>操作</th></tr>
		<?php $_from = $this->_tpl_vars['AllCommend']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
		<tr><td><a href="?a=details&navid=<?php echo $this->_tpl_vars['value']->nav; ?>
&goodsid=<?php echo $this->_tpl_vars['value']->goods_id; ?>
" target="_blank"><?php echo ((is_array($_tmp=$this->_tpl_vars['value']->name)) ? $this->_run_mod_handler('truncate', true, $_tmp, 18) : smarty_modifier_truncate($_tmp, 18)); ?>
</a></td><td><?php echo ((is_array($_tmp=$this->_tpl_vars['value']->content)) ? $this->_run_mod_handler('truncate', true, $_tmp, 18) : smarty_modifier_truncate($_tmp, 18)); ?>
</td><td><?php if ($this->_tpl_vars['value']->re_content): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['value']->re_content)) ? $this->_run_mod_handler('truncate', true, $_tmp, 18) : smarty_modifier_truncate($_tmp, 18)); ?>
<?php else: ?><span class="red">尚未回复</span><?php endif; ?></td>
		<td>
						<?php if ($this->_tpl_vars['value']->star == 5): ?><span class="star">★★★★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 4): ?><span class="star">★★★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 3): ?><span class="star">★★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 2): ?><span class="star">★★</span><?php endif; ?>
						<?php if ($this->_tpl_vars['value']->star == 1): ?><span class="star">★</span><?php endif; ?>
		</td><td><?php echo $this->_tpl_vars['value']->user; ?>
</td>
		<td><a href="?a=commend&m=update&id=<?php echo $this->_tpl_vars['value']->id; ?>
&name=<?php echo $this->_tpl_vars['value']->name; ?>
&nav=<?php echo $this->_tpl_vars['value']->nav; ?>
"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=commend&m=delete&id=<?php echo $this->_tpl_vars['value']->id; ?>
" onclick="return confirm('删除掉评价之后，用户可以重新评价\r\n如果你想要屏蔽评价，请在修改里设置\r\n你真的要删除这个评价吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
		<?php endforeach; else: ?>
		<tr><td colspan="6">没有任何评价</td></tr>
		<?php endif; unset($_from); ?>
	</table>
</div>
<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>

</body>
</html>