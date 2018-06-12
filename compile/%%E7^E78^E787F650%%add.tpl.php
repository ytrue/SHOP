<?php /* Smarty version 2.6.26, created on 2017-12-12 12:29:40
         compiled from admin/nav/add.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_checkboxes', 'admin/nav/add.tpl', 24, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/nav.css" />
<script type="text/javascript" src="view/admin/js/ajax.js"></script>
<script type="text/javascript" src="view/admin/js/nav.js"></script>
</head>
<body>

<h2><a href="?a=nav">返回导航条列表</a>商品 -- 添加导航</h2>


<form method="post" name="add" action="?a=nav&m=add">
	<input type="hidden" name="flag" id="flag" />
	<input type="hidden" name="sid" value="<?php echo $this->_tpl_vars['OneNav'][0]->id; ?>
" />
	<dl class="form">
		<?php if ($this->_tpl_vars['OneNav']): ?><dd>主类名称：<?php echo $this->_tpl_vars['OneNav'][0]->name; ?>
</dd><?php endif; ?>
		<dd>名　　称：<input type="text" name="name"  id="name" onblur="checkName();" class="text" /> ( * 2-4位之间 )</dd>
		<dd><span class="middle">简　　介：</span><textarea name="info"></textarea> <span class="middle">( * 200位以内 )</span></dd>
		<?php if ($this->_tpl_vars['OneNav']): ?>
		<dd>关联品牌：<?php echo smarty_function_html_checkboxes(array('options' => $this->_tpl_vars['AllBrand'],'name' => 'brand'), $this);?>
</dd>
		<?php endif; ?>
		<dd>价格区间:<?php echo smarty_function_html_checkboxes(array('options' => $this->_tpl_vars['AllPrice'],'name' => 'price'), $this);?>
</dd>
		<dd><input type="submit" name="send" onclick="return addNav();" value="新增导航" class="submit" /></dd>
	</dl>
</form>


</body>
</html>