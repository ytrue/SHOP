<?php /* Smarty version 2.6.26, created on 2017-12-13 20:56:12
         compiled from admin/attr/show.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线商城后台管理</title>
    <link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
    <link rel="stylesheet" type="text/css" href="view/admin/style/attr.css" />
</head>
<body>

<h2><a href="?a=attr&m=add">添加自定义属性</a>商品 -- 自定义属性列表</h2>

<div id="list">
    <table>
        <tr><th>属性名称</th><th>属性项目</th><th>关联类型</th><th>操作</th></tr>
        <?php $_from = $this->_tpl_vars['AllAttr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
            <tr><td><?php echo $this->_tpl_vars['value']->name; ?>
</td><td><?php echo $this->_tpl_vars['value']->item; ?>
</td><td><?php echo $this->_tpl_vars['value']->nav; ?>
</td><td><a href="?a=attr&m=update&id=<?php echo $this->_tpl_vars['value']->id; ?>
"><img src="view/admin/images/edit.gif" alt="编辑" title="编辑" /></a> <a href="?a=attr&m=delete&id=<?php echo $this->_tpl_vars['value']->id; ?>
" onclick="return confirm('你真的要删除这个属性吗？') ? true : false"><img src="view/admin/images/drop.gif" alt="删除" title="删除" /></a></td></tr>
            <?php endforeach; else: ?>
            <tr><td colspan="4">没有任何属性</td></tr>
        <?php endif; unset($_from); ?>
    </table>
</div>
<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>

</body>
</html>