<?php /* Smarty version 2.6.26, created on 2017-12-18 20:24:15
         compiled from admin/commend/update.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_radios', 'admin/commend/update.tpl', 18, false),)), $this); ?>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/commend.css" />
</head>
<body>

<h2><a href="?a=commend">返回评价列表</a>商品 -- 修改评价</h2>

<form method="post" name="update" action="?a=commend&m=update&id=<?php echo $this->_tpl_vars['OneCommend'][0]->id; ?>
">
	<dl class="form">
		<dd>商品名称：<a href="?a=details&navid=<?php echo $_GET['nav']; ?>
&goodsid=<?php echo $this->_tpl_vars['OneCommend'][0]->goods_id; ?>
" target="_blank"><?php echo $_GET['name']; ?>
</a></dd>
		<dd>购买属性：<?php echo $this->_tpl_vars['OneCommend'][0]->attr; ?>
</dd>
		<dd>评价用户：<?php echo $this->_tpl_vars['OneCommend'][0]->user; ?>
</dd>
		<dd>评价星级：<span class="star"><?php echo smarty_function_html_radios(array('name' => 'star','options' => $this->_tpl_vars['star'],'checked' => $this->_tpl_vars['star_checked']), $this);?>
</span>
		</dd>
		<dd><span class="middle">评价内容：</span><textarea name="content"><?php echo $this->_tpl_vars['OneCommend'][0]->content; ?>
</textarea> <span class="middle"></span></dd>
		<dd><span class="middle">回复内容：</span><textarea name="re_content"><?php echo $this->_tpl_vars['OneCommend'][0]->re_content; ?>
</textarea> <span class="middle"></span></dd>
		<dd>是否显示：<input type="radio" name="flag" <?php if ($this->_tpl_vars['OneCommend'][0]->flag == 0): ?>checked="checked"<?php endif; ?> value="0" /> 是 <input type="radio" name="flag" <?php if ($this->_tpl_vars['OneCommend'][0]->flag == 1): ?>checked="checked"<?php endif; ?> value="1" /> 否</dd>
		<dd><input type="submit" name="send" value="回复及修改评价" class="submit" /></dd>
	</dl>
</form>

</body>
</html>