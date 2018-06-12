<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城系统</title>
<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/default/style/member.css" />
</head>
<body>
{include file='default/public/header.tpl'}
<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 个人中心
</div>

{include file='default/public/member_sidebar.tpl'}
<div id="main">
	<h2>我的评价</h2>
	<div class="mycommend">
			{foreach from=$MyCommend key=key item=value}
			<div class="mycommend">
				<p><img src="{$value->thumbnail2}" /></p>
				<p><a href="?a=details&navid={$value->nav}&goodsid={$value->goods_id}" target="_blank">{$value->name}</a></p>
				<p class="attr">{$value->attr}</p>
				<p><em>{$value->date}</em>{$value->content}</p>
				<p>
						{if $value->star == 5}<span class="star">★★★★★</span>{/if}
						{if $value->star == 4}<span class="star">★★★★</span>{/if}
						{if $value->star == 3}<span class="star">★★★</span>{/if}
						{if $value->star == 2}<span class="star">★★</span>{/if}
						{if $value->star == 1}<span class="star">★</span>{/if}
				</p>
				<p>
					{if $value->re_content}
						<span class="red">商家回复：{$value->re_content}</span>
					{/if}
				</p>
			</div>
			{/foreach}	
	</div>
	<div id="page">{$page}</div>
</div>



{include file='default/public/footer.tpl'}
</body>
</html>