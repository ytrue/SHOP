<?php /* Smarty version 2.6.26, created on 2017-12-15 16:20:56
         compiled from default/public/member_order.tpl */ ?>
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

<div id="main">
	<h2>订单列表</h2>
	<table id="cart" cellspacing="1">
		<tr><th>订单号</th><th>下单时间</th><th>总金额</th><th>订单状态</th><th>操作</th></tr>
        <?php $_from = $this->_tpl_vars['AllOrder']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>

			<tr><td><a href="?a=member&m=order_details&id=<?php echo $this->_tpl_vars['value']->id; ?>
"><?php echo $this->_tpl_vars['value']->ordernum; ?>
</a></td><td><?php echo $this->_tpl_vars['value']->date; ?>
</td><td><?php echo $this->_tpl_vars['value']->price; ?>
/元</td><td>
                    <?php if ($this->_tpl_vars['value']->order_state == '已取消'): ?>
						<span class="red">已取消</span>
                    <?php else: ?>
                        <?php if ($this->_tpl_vars['value']->refund == 1): ?>
							<span style="color:#666;">申请退款中</span>
                        <?php else: ?>
                            <?php if ($this->_tpl_vars['value']->refund == 2): ?>
								<span class="green">退款成功</span>
                            <?php else: ?>
                                <?php if ($this->_tpl_vars['value']->order_delivery == '已发货'): ?>
									<span class="green">已发货，等待收货</span>
                                <?php else: ?>
                                    <?php if ($this->_tpl_vars['value']->order_delivery == '已配货'): ?>
										<span class="green">已配货，等待发货</span>
                                    <?php else: ?>
                                        <?php if ($this->_tpl_vars['value']->order_pay == '已付款'): ?>
											<span class="green">已付款，等待配货</span>
                                        <?php else: ?>
                                            <?php if ($this->_tpl_vars['value']->order_state == '已确认'): ?>
												<span class="green">已确认，等待付款</span>
                                            <?php else: ?>
												<span style="color:#666;">未确认</span>
                                            <?php endif; ?>
                                        <?php endif; ?>
                                    <?php endif; ?>
                                <?php endif; ?>
                            <?php endif; ?>
                        <?php endif; ?>
                    <?php endif; ?>
				</td><td>
                    <?php if ($this->_tpl_vars['value']->order_state == '已取消'): ?>
						-----
                    <?php else: ?>
                        <?php if ($this->_tpl_vars['value']->order_pay == '已付款' || $this->_tpl_vars['value']->order_delivery == '已配货' || $this->_tpl_vars['value']->order_delivery == '已发货'): ?>
                            <?php if ($this->_tpl_vars['value']->refund == 0): ?>
								<a href="?a=member&m=refund&id=<?php echo $this->_tpl_vars['value']->id; ?>
" onclick="return confirm('申请退款须知：\n\n1.已付款、已配货或已发货可申请退款；\n2.已付款或已配货的72 小时确认退款；\n3.已发货的请寄回物品后72 小时确认退款；\n\n您真的要申请退款吗？\n\n') ? true : false">申请退款</a>
                            <?php else: ?>
								-----
                            <?php endif; ?>
                        <?php else: ?>
							<a href="?a=member&m=alipay&id=<?php echo $this->_tpl_vars['value']->id; ?>
">在线支付</a> | <a href="?a=member&m=cancel&id=<?php echo $this->_tpl_vars['value']->id; ?>
">取消订单</a>
                        <?php endif; ?>
                    <?php endif; ?>
				</td></tr>
        <?php endforeach; endif; unset($_from); ?>
	</table>
	<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>
</div>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'default/public/footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>