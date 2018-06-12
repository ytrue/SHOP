<?php /* Smarty version 2.6.26, created on 2017-12-10 18:49:06
         compiled from default/public/header.tpl */ ?>
<div id="header">
	<h1><a href="./">瓢城Web俱乐部</a></h1>
	<div class="top">
        <?php if ($_COOKIE['user']): ?>
			您好，<?php echo $_COOKIE['user']; ?>
，欢迎再次光临，<a href="?a=member">个人中心</a> | <a href="?a=cart">购物车</a> | <a href="?a=member&m=logout">退出</a>
        <?php else: ?>
			<a href="?a=member&m=login"><img src="view/default/images/bnt_log.gif" alt="登录" /></a>
			<a href="?a=member&m=reg"><img src="view/default/images/bnt_reg.gif" alt="注册" /></a>
        <?php endif; ?>
	</div>
</div>
<div id="nav">
	<ul>
        <?php if ($_GET['navid']): ?>
			<li><a href="./">首页</a></li>
        <?php else: ?>
			<li><a href="./" class="strong">首页</a></li>
        <?php endif; ?>
        <?php $_from = $this->_tpl_vars['FrontTenNav']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
            <?php if ($this->_tpl_vars['value']->id == $this->_tpl_vars['FrontNav'][0]->id): ?>
				<li><a href="?a=list&navid=<?php echo $this->_tpl_vars['value']->id; ?>
" class="strong"><?php echo $this->_tpl_vars['value']->name; ?>
</a></li>
            <?php else: ?>
				<li><a href="?a=list&navid=<?php echo $this->_tpl_vars['value']->id; ?>
"><?php echo $this->_tpl_vars['value']->name; ?>
</a></li>
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>
	</ul>
</div>

<div id="search">

</div>