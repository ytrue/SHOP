<?php /* Smarty version 2.6.26, created on 2017-12-10 17:12:49
         compiled from admin/public/succ.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<meta http-equiv="refresh" content="1;url=<?php echo $this->_tpl_vars['url']; ?>
" />
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/succ.css" />
</head>
<body>

<h2>成功 -- 提示页</h2>

<div id="list" class="succ">
	<?php $_from = $this->_tpl_vars['message']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
	<p><?php echo $this->_tpl_vars['key']+1; ?>
.<?php echo $this->_tpl_vars['value']; ?>
</p>
	<?php endforeach; endif; unset($_from); ?>
	<p><a href="<?php echo $this->_tpl_vars['url']; ?>
">[如果浏览器没有及时跳转，请点击这里]</a></p>
</div>

</body>
</html>