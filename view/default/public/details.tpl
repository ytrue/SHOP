<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>{$FrontGoods[0]->name} -- 在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/details.css" />
	<script type="text/javascript" src="view/default/js/browserdetect.js"></script>
	<script type="text/javascript" src="view/default/js/attr.js"></script>
	<script type="text/javascript" src="view/default/js/channel.js"></script>
</head>
<body>
{include file='default/public/header.tpl'}
<div id="sait">
	当前位置：<a href="./">首页</a>
    {foreach from=$FrontNav[0]->sait key=key item=value}
		&gt; <a href="?a=list&navid={$key}">{$value}</a>
    {/foreach}
	&gt; {$FrontGoods[0]->name}
</div>

<div id="sidebar">
	<h2>{$FrontNav[0]->name}</h2>
	<ul style="margin:0 0 10px 0">
        {foreach from=$FrontNav[0]->child key=key item=value}
			<li><a href="?a=list&navid={$value->id}">{$value->name}<span class="gray">(1000)</span></a></li>
        {/foreach}
	</ul>
	<h2>当月热销</h2>
	<div style="margin:0 0 10px 0">
        {foreach from=$NavSort key=key item=value}
            {if $key < 5}
				<dl style="border:none;">
					<dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img src="{$value->thumbnail2}" style="width:100px;height:100px;" alt="{$value->name}" title="{$value->name}" /></a></dt>
					<dd class="price">￥{$value->price_sale}</dd>
					<dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">{$value->name}</a></dd>
				</dl>
            {/if}
        {/foreach}
	</div>
	<h2>浏览记录</h2>
	<div style="margin:0 0 10px 0">
        {foreach from=$FrontRecord key=key item=value}
            {if $key < 5}
				<dl style="border:none;">
					<dt><a href="?a=details&navid={$value.nav}&goodsid={$value.id}" target="_blank"><img src="{$value.thumbnail2}" style="width:100px;height:100px;" alt="连衣裙" title="连衣裙" /></a></dt>
					<dd class="price">￥{$value.price}</dd>
					<dd class="title"><a href="?a=details&navid={$value.nav}&goodsid={$value.id}" target="_blank">{$value.name}</a></dd>
				</dl>
            {/if}
        {/foreach}
		<p><a href="?a=list&m=delRecord">清空记录</a></p>
	</div>
</div>

<div id="main">
	<form method="post" action="?a=cart&m=addProduct">
		<input type="hidden" id="attrid" name="attrid" value="{$FrontGoods[0]->attr}" />
		<input type="hidden" id="attrtype" name="attrtype" value="{$attrType}" />
		<input type="hidden" name="id" value="{$FrontGoods[0]->id}" />
		<input type="hidden" name="nav" value="{$FrontGoods[0]->nav}" />
		<input type="hidden" name="name" value="{$FrontGoods[0]->name}" />
		<input type="hidden" name="price_sale" value="{$FrontGoods[0]->price_sale}" />
		<input type="hidden" name="sn" value="{$FrontGoods[0]->sn}" />
		<input type="hidden" name="weight" value="{$FrontGoods[0]->weight}" />
		<input type="hidden" name="thumbnail2" value="{$FrontGoods[0]->thumbnail2}" />
		<h2>{$FrontGoods[0]->name}</h2>
		<dl class="pic">
			<dt><a href="###"><img src="{$FrontGoods[0]->thumbnail}" alt="{$FrontGoods[0]->name}" title="{$FrontGoods[0]->name}" /></a></dt>
			<script>var thumbnail = '{$domain}{$FrontGoods[0]->thumbnail}';</script>
            {literal}
				<dd>分享至：<a href="javascript:void((function(s,d,e){try{}catch(e){}var f='http://service.weibo.com/share/share.php?',u=d.location.href,p=['url=',e(u),'&title=',e(d.title),'&pic=',e(thumbnail),'&appkey='].join('');function a(){if(!window.open([f,p].join(''),'mb',['toolbar=0,status=0,resizable=1,width=620,height=450,left=',(s.width-620)/2,',top=',(s.height-450)/2].join('')))u.href=[f,p].join('');};if(/Firefox/.test(navigator.userAgent)){setTimeout(a,0)}else{a()}})(screen,document,encodeURIComponent));">新浪微博</a>
					| <a href="javascript:void(0)" onclick="postToWb();" class="tmblog">腾讯微博</a>
					<script type="text/javascript">
                        function postToWb(){
                            var _t = encodeURI(document.title);
                            var _url = encodeURIComponent(document.location);
                            var _appkey = encodeURI("appkey");//你从腾讯获得的appkey
                            var _pic = encodeURI(thumbnail);//（列如：var _pic='图片url1|图片url2’）
                            var _site = '';//你的网站地址
                            var _u ='http://v.t.qq.com/share/share.php?title='+_t+'&url='+_url+'&appkey='+_appkey+'&site='+_site+'&pic='+_pic;window.open( _u,'转播到腾讯微博', 'width=700, height=680, top=0, left=0,toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );
                        }
					</script>
					| <a href="javascript:void((function(s,d,e){if(/renren\.com/.test(d.location))return;var f='http://share.renren.com/share/buttonshare?link=',u=d.location,l=d.title,p=[e(u),'&title=',e(l)].join('');function a(){if(!window.open([f,p].join(''),'xnshare',['toolbar=0,status=0,resizable=1,width=626,height=436,left=',(s.width-626)/2,',top=',(s.height-436)/2].join('')))u.href=[f,p].join('');};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else a();})(screen,document,encodeURIComponent));" title="分享到人人">人人网</a>
					| <a href="javascript:d=document;t=d.selection?(d.selection.type!='None'?d.selection.createRange().text:''):(d.getSelection?d.getSelection():'');void(kaixin=window.open('http://www.kaixin001.com/~repaste/repaste.php?&amp;rurl='+escape(d.location.href)+'&amp;rtitle='+escape(d.title)+'&amp;rcontent='+escape(d.title),'kaixin'));kaixin.focus();">开心网</a></dd>
            {/literal}
		</dl>
		<dl id="text" class="text">
			<dd>售　　价：<span class="sale">￥{$FrontGoods[0]->price_sale}</span><span class="market">￥{$FrontGoods[0]->price_market}</span></dd>
			<dd>商品编号：{$FrontGoods[0]->sn}</dd>
			<dd>所属品牌：{$FrontGoods[0]->brandname}</dd>
			<dd>销 售 量：<span class="sale_num"> {$FrontGoods[0]->sales}</span> {$FrontGoods[0]->unit}</dd>
			<dd>重　　量：{$FrontGoods[0]->weight} kg {if $FrontGoods[0]->is_freight == 1}<span class="gray">(免运费)</span>{/if}</dd>
			<dd>数　　量：<input type="text" value="1" class="num" name="num" /> {$FrontGoods[0]->unit} <span class="gray">(目前库存：{$FrontGoods[0]->inventory}{$FrontGoods[0]->unit})</span></dd>
			<dd class="buy_button">
                {if $FrontGoods[0]->is_up == 1}
					<input type="submit" name="send" class="submit" value="" />
                {else}
					<strong class="is_up">此商品已下架</strong>
                {/if}
				<a href="?a=member&m=addCollect&id={$FrontGoods[0]->id}" target="_blank"><img border="0" src="view/default/images/collect.gif" alt="收藏" title="收藏" /></a></dd>
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
            {$FrontGoods[0]->content}
		</div>
		<div class="c2" id="c2" style="display:none;">
            {foreach from=$commend key=key item=value}
				<div class="commend_left">
					<p>{$value->user}</p>
					<p class="star">
                        {if $value->star == 5}<span class="star">★★★★★</span>{/if}
                        {if $value->star == 4}<span class="star">★★★★</span>{/if}
                        {if $value->star == 3}<span class="star">★★★</span>{/if}
                        {if $value->star == 2}<span class="star">★★</span>{/if}
                        {if $value->star == 1}<span class="star">★</span>{/if}
					</p>
				</div>
				<div class="commend_right">
					<p><em>{$value->date}</em>{$value->content}</p>
					<p class="attr">{$value->attr} </p>
					<p>
                        {if $value->re_content}
							<span class="red">商家回复：{$value->re_content}</span>
                        {/if}
					</p>
				</div>
            {/foreach}
			<div id="page">{$page}</div>
		</div>
		<div class="c3" id="c3" style="display:none;">
			<table border="0" cellspacing="0" width="100%" class="record">
				<tr><th>购买者</th><th>商品名称</th><th>购买价格</th><th>购买数量</th><th>成交时间</th></tr>
                {foreach from=$record key=key item=value}
					<tr><td>{$value->user}</td><td style="text-align:left;padding:0 0 0 25px;line-height:180%;">{$value->name}<br /><span style="color:#666;">{$value->attr}</span></td><td>{$value->price}</td><td>{$value->num}</td><td>{$value->date}</td></tr>
                {/foreach}
			</table>
			<div id="page">{$page}</div>
		</div>
		<div class="c4" id="c4" style="display:none;">
            {$FrontGoods[0]->service}
		</div>
	</div>
</div>

{include file='default/public/footer.tpl'}
</body>
</html>