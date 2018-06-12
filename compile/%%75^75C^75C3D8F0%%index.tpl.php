<?php /* Smarty version 2.6.26, created on 2017-12-20 21:18:09
         compiled from default/public/index.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线商城系统</title>
    <link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
    <link rel="stylesheet" type="text/css" href="view/default/style/index.css" />
</head>
<body>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div id="main">
    <div class="adver"><img src="view/default/images/adver.jpg" alt="" /></div>
    <h2>推荐商品</h2>
    <div class="pro">
        <?php $_from = $this->_tpl_vars['SalesGoods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
            <?php if ($this->_tpl_vars['key'] < 3): ?>
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
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>
    </div>
    <h2>精品商品</h2>
    <div class="pro">
        <?php $_from = $this->_tpl_vars['SalesGoods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
            <?php if ($this->_tpl_vars['key'] < 3): ?>
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
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>
    </div>
    <h2>商家品牌</h2>
    <div class="pro" style="height:55px;line-height:55px;text-indent:25px;color:#56A5EE">
        大红豆 南国服饰 天上服饰 地上服饰
    </div>
</div>
<div id="sidebar">
    <h2>商城公告</h2>
    <ul style="margin:0 0 10px 0">
        <li><a href="###">本站已经可以使用支付宝支付...</a></li>
        <li><a href="###">服饰供货代理商正在招商中...</a></li>
        <li><a href="###">正在积极整理下一套网商程序...</a></li>
        <li><a href="###">本商城已经授权3C产品认证...</a></li>
        <li><a href="###">商城已经可以使用货到付款...</a></li>
    </ul>
    <h2>销售排行</h2>
    <div style="margin:0 0 10px 0">
        <?php $_from = $this->_tpl_vars['SalesGoods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
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
</div>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>