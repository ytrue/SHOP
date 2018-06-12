<?php /* Smarty version 2.6.26, created on 2017-12-20 21:04:53
         compiled from default/public/details.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><?php echo $this->_tpl_vars['FrontGoods'][0]->name; ?>
 -- 在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/details.css" />
	<script type="text/javascript" src="view/default/js/browserdetect.js"></script>
	<script type="text/javascript" src="view/default/js/attr.js"></script>
	<script type="text/javascript" src="view/default/js/channel.js"></script>
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
	&gt; <?php echo $this->_tpl_vars['FrontGoods'][0]->name; ?>

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
<span class="gray">(1000)</span></a></li>
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
	<form method="post" action="?a=cart&m=addProduct">
		<input type="hidden" id="attrid" name="attrid" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->attr; ?>
" />
		<input type="hidden" id="attrtype" name="attrtype" value="<?php echo $this->_tpl_vars['attrType']; ?>
" />
		<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->id; ?>
" />
		<input type="hidden" name="nav" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->nav; ?>
" />
		<input type="hidden" name="name" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->name; ?>
" />
		<input type="hidden" name="price_sale" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->price_sale; ?>
" />
		<input type="hidden" name="sn" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->sn; ?>
" />
		<input type="hidden" name="weight" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->weight; ?>
" />
		<input type="hidden" name="thumbnail2" value="<?php echo $this->_tpl_vars['FrontGoods'][0]->thumbnail2; ?>
" />
		<h2><?php echo $this->_tpl_vars['FrontGoods'][0]->name; ?>
</h2>
		<dl class="pic">
			<dt><a href="###"><img src="<?php echo $this->_tpl_vars['FrontGoods'][0]->thumbnail; ?>
" alt="<?php echo $this->_tpl_vars['FrontGoods'][0]->name; ?>
" title="<?php echo $this->_tpl_vars['FrontGoods'][0]->name; ?>
" /></a></dt>
			<script>var thumbnail = '<?php echo $this->_tpl_vars['domain']; ?>
<?php echo $this->_tpl_vars['FrontGoods'][0]->thumbnail; ?>
';</script>
            <?php echo '
				<dd>分享至：<a href="javascript:void((function(s,d,e){try{}catch(e){}var f=\'http://service.weibo.com/share/share.php?\',u=d.location.href,p=[\'url=\',e(u),\'&title=\',e(d.title),\'&pic=\',e(thumbnail),\'&appkey=\'].join(\'\');function a(){if(!window.open([f,p].join(\'\'),\'mb\',[\'toolbar=0,status=0,resizable=1,width=620,height=450,left=\',(s.width-620)/2,\',top=\',(s.height-450)/2].join(\'\')))u.href=[f,p].join(\'\');};if(/Firefox/.test(navigator.userAgent)){setTimeout(a,0)}else{a()}})(screen,document,encodeURIComponent));">新浪微博</a>
					| <a href="javascript:void(0)" onclick="postToWb();" class="tmblog">腾讯微博</a>
					<script type="text/javascript">
                        function postToWb(){
                            var _t = encodeURI(document.title);
                            var _url = encodeURIComponent(document.location);
                            var _appkey = encodeURI("appkey");//你从腾讯获得的appkey
                            var _pic = encodeURI(thumbnail);//（列如：var _pic=\'图片url1|图片url2’）
                            var _site = \'\';//你的网站地址
                            var _u =\'http://v.t.qq.com/share/share.php?title=\'+_t+\'&url=\'+_url+\'&appkey=\'+_appkey+\'&site=\'+_site+\'&pic=\'+_pic;window.open( _u,\'转播到腾讯微博\', \'width=700, height=680, top=0, left=0,toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no\' );
                        }
					</script>
					| <a href="javascript:void((function(s,d,e){if(/renren\\.com/.test(d.location))return;var f=\'http://share.renren.com/share/buttonshare?link=\',u=d.location,l=d.title,p=[e(u),\'&title=\',e(l)].join(\'\');function a(){if(!window.open([f,p].join(\'\'),\'xnshare\',[\'toolbar=0,status=0,resizable=1,width=626,height=436,left=\',(s.width-626)/2,\',top=\',(s.height-436)/2].join(\'\')))u.href=[f,p].join(\'\');};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else a();})(screen,document,encodeURIComponent));" title="分享到人人">人人网</a>
					| <a href="javascript:d=document;t=d.selection?(d.selection.type!=\'None\'?d.selection.createRange().text:\'\'):(d.getSelection?d.getSelection():\'\');void(kaixin=window.open(\'http://www.kaixin001.com/~repaste/repaste.php?&amp;rurl=\'+escape(d.location.href)+\'&amp;rtitle=\'+escape(d.title)+\'&amp;rcontent=\'+escape(d.title),\'kaixin\'));kaixin.focus();">开心网</a></dd>
            '; ?>

		</dl>
		<dl id="text" class="text">
			<dd>售　　价：<span class="sale">￥<?php echo $this->_tpl_vars['FrontGoods'][0]->price_sale; ?>
</span><span class="market">￥<?php echo $this->_tpl_vars['FrontGoods'][0]->price_market; ?>
</span></dd>
			<dd>商品编号：<?php echo $this->_tpl_vars['FrontGoods'][0]->sn; ?>
</dd>
			<dd>所属品牌：<?php echo $this->_tpl_vars['FrontGoods'][0]->brandname; ?>
</dd>
			<dd>销 售 量：<span class="sale_num"> <?php echo $this->_tpl_vars['FrontGoods'][0]->sales; ?>
</span> <?php echo $this->_tpl_vars['FrontGoods'][0]->unit; ?>
</dd>
			<dd>重　　量：<?php echo $this->_tpl_vars['FrontGoods'][0]->weight; ?>
 kg <?php if ($this->_tpl_vars['FrontGoods'][0]->is_freight == 1): ?><span class="gray">(免运费)</span><?php endif; ?></dd>
			<dd>数　　量：<input type="text" value="1" class="num" name="num" /> <?php echo $this->_tpl_vars['FrontGoods'][0]->unit; ?>
 <span class="gray">(目前库存：<?php echo $this->_tpl_vars['FrontGoods'][0]->inventory; ?>
<?php echo $this->_tpl_vars['FrontGoods'][0]->unit; ?>
)</span></dd>
			<dd class="buy_button">
                <?php if ($this->_tpl_vars['FrontGoods'][0]->is_up == 1): ?>
					<input type="submit" name="send" class="submit" value="" />
                <?php else: ?>
					<strong class="is_up">此商品已下架</strong>
                <?php endif; ?>
				<a href="?a=member&m=addCollect&id=<?php echo $this->_tpl_vars['FrontGoods'][0]->id; ?>
" target="_blank"><img border="0" src="view/default/images/collect.gif" alt="收藏" title="收藏" /></a></dd>
		</dl>
	</form>
	<div class="content">
		<ul>
			<li id="button1" onclick="channel(1)" class="first">商品详情</li>
			<li id="button2" onclick="channel(2)">评价列表</li>
			<li id="button3" onclick="channel(3)">成交记录</li>
			<li id="button4" onclick="channel(4)">售后服务</li>
		</ul>
		<div class="c1" id="c1" style="display:block;">
            <?php echo $this->_tpl_vars['FrontGoods'][0]->content; ?>

		</div>
		<div class="c2" id="c2" style="display:none;">
            <?php $_from = $this->_tpl_vars['commend']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
				<div class="commend_left">
					<p><?php echo $this->_tpl_vars['value']->user; ?>
</p>
					<p class="star">
                        <?php if ($this->_tpl_vars['value']->star == 5): ?><span class="star">★★★★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['value']->star == 4): ?><span class="star">★★★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['value']->star == 3): ?><span class="star">★★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['value']->star == 2): ?><span class="star">★★</span><?php endif; ?>
                        <?php if ($this->_tpl_vars['value']->star == 1): ?><span class="star">★</span><?php endif; ?>
					</p>
				</div>
				<div class="commend_right">
					<p><em><?php echo $this->_tpl_vars['value']->date; ?>
</em><?php echo $this->_tpl_vars['value']->content; ?>
</p>
					<p class="attr"><?php echo $this->_tpl_vars['value']->attr; ?>
 </p>
					<p>
                        <?php if ($this->_tpl_vars['value']->re_content): ?>
							<span class="red">商家回复：<?php echo $this->_tpl_vars['value']->re_content; ?>
</span>
                        <?php endif; ?>
					</p>
				</div>
            <?php endforeach; endif; unset($_from); ?>
			<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>
		</div>
		<div class="c3" id="c3" style="display:none;">
			<table border="0" cellspacing="0" width="100%" class="record">
				<tr><th>购买者</th><th>商品名称</th><th>购买价格</th><th>购买数量</th><th>成交时间</th></tr>
                <?php $_from = $this->_tpl_vars['record']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
					<tr><td><?php echo $this->_tpl_vars['value']->user; ?>
</td><td style="text-align:left;padding:0 0 0 25px;line-height:180%;"><?php echo $this->_tpl_vars['value']->name; ?>
<br /><span style="color:#666;"><?php echo $this->_tpl_vars['value']->attr; ?>
</span></td><td><?php echo $this->_tpl_vars['value']->price; ?>
</td><td><?php echo $this->_tpl_vars['value']->num; ?>
</td><td><?php echo $this->_tpl_vars['value']->date; ?>
</td></tr>
                <?php endforeach; endif; unset($_from); ?>
			</table>
			<div id="page"><?php echo $this->_tpl_vars['page']; ?>
</div>
		</div>
		<div class="c4" id="c4" style="display:none;">
            <?php echo $this->_tpl_vars['FrontGoods'][0]->service; ?>

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