<?php /* Smarty version 2.6.26, created on 2017-12-11 20:44:06
         compiled from admin/goods/show.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'truncate', 'admin/goods/show.tpl', 17, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/goods.css" />
</head>
<body>

<h2><a href="?a=goods&m=add">添加商品</a>商品 -- 商品列表</h2>

<div id="list">
	<table>
		<tr><th>商品名称</th><th>商品编号</th><th>商品售价</th><th>商品类型</th><th>品牌</th><th>是否上架</th><th>库存</th><th>操作</th></tr>
		<?php $_from = $this->_tpl_vars['AllGoods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
		<tr><td><?php echo ((is_array($_tmp=$this->_tpl_vars['value']->name)) ? $this->_run_mod_handler('truncate', true, $_tmp, 18) : smarty_modifier_truncate($_tmp, 18)); ?>
</td><td><?php echo $this->_tpl_vars['value']->sn; ?>
</td><td><?php echo $this->_tpl_vars['value']->price_sale; ?>
/元</td><td><?php echo $this->_tpl_vars['value']->nav_name; ?>
</td><td><?php echo $this->_tpl_vars['value']->brand; ?>
</td>
		<td>
		<?php if ($this->_tpl_vars['value']->is_up == 0): ?>
		<span class="red">否</span> <a href="?a=goods&m=isUp&act=up&id=<?php echo $this->_tpl_vars['value']->id; ?>
">[上架]</a>
		<?php else: ?>
		<span class="green">是</span> <a href="?a=goods&m=isUp&act=down&id=<?php echo $this->_tpl_vars['value']->id; ?>
">[下架]</a>
		<?php endif; ?>
		</td>
		<td><?php echo $this->_tpl_vars['value']->inventory; ?>
</td><td><a href="?a=goods&m=update&id=<?php echo $this->_tpl_vars['value']->id; ?>
"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=goods&m=delete&id=<?php echo $this->_tpl_vars['value']->id; ?>
" onclick="return confirm('你真的要删除这个商品吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
		<?php endforeach; else: ?>
		<tr><td colspan="8">没有任何商品</td></tr>
		<?php endif; unset($_from); ?>
	</table>
</div>
<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>

</body>
</html>