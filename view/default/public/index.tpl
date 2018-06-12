<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线商城系统</title>
    <link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
    <link rel="stylesheet" type="text/css" href="view/default/style/index.css" />
</head>
<body>
{include file='default/public/header.tpl'}
<div id="main">
    <div class="adver"><img src="view/default/images/adver.jpg" alt="" /></div>
    <h2>推荐商品</h2>
    <div class="pro">
        {foreach from=$SalesGoods key=key item=value}
            {if $key < 3}
                <dl>
                    <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img src="{$value->thumbnail2}" alt="连衣裙" title="连衣裙" /></a></dt>
                    <dd class="price"><strong>￥{$value->price_sale}</strong> <del>￥{$value->price_market}</del></dd>
                    <dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">{$value->name}</a></dd>
                    <dd class="commend"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}#commend" target="_blank">已有{$value->commendnum}人评价</a> <span class="green">(销售<strong>{$value->sales}</strong>{$value->unit})</span></dd>
                    <dd class="buy"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">购买</a> | <a href="?a=member&m=addCollect&id={$value->id}" target="_blank">收藏</a> | <a href="?a=compare&m=setCompare&navid={$value->nav}&goodsid={$value->id}" target="_blank">比较</a></dd>
                </dl>
            {/if}
        {/foreach}
    </div>
    <h2>精品商品</h2>
    <div class="pro">
        {foreach from=$SalesGoods key=key item=value}
            {if $key < 3}
                <dl>
                    <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img src="{$value->thumbnail2}" alt="连衣裙" title="连衣裙" /></a></dt>
                    <dd class="price"><strong>￥{$value->price_sale}</strong> <del>￥{$value->price_market}</del></dd>
                    <dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">{$value->name}</a></dd>
                    <dd class="commend"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}#commend" target="_blank">已有{$value->commendnum}人评价</a> <span class="green">(销售<strong>{$value->sales}</strong>{$value->unit})</span></dd>
                    <dd class="buy"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">购买</a> | <a href="?a=member&m=addCollect&id={$value->id}" target="_blank">收藏</a> | <a href="?a=compare&m=setCompare&navid={$value->nav}&goodsid={$value->id}" target="_blank">比较</a></dd>
                </dl>
            {/if}
        {/foreach}
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
        {foreach from=$SalesGoods key=key item=value}
            {if $key < 5}
                <dl style="border:none;">
                    <dt><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank"><img src="{$value->thumbnail2}" style="width:100px;height:100px;" alt="{$value->name}" title="{$value->name}" /></a></dt>
                    <dd class="price">￥{$value->price_sale}</dd>
                    <dd class="title"><a href="?a=details&navid={$value->nav}&goodsid={$value->id}" target="_blank">{$value->name}</a></dd>
                </dl>
            {/if}
        {/foreach}
    </div>
</div>

{include file='default/public/footer.tpl'}
</body>
</html>