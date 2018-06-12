<?php /* Smarty version 2.6.26, created on 2017-12-12 17:39:26
         compiled from admin/goods/update.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'admin/goods/update.tpl', 25, false),array('function', 'html_radios', 'admin/goods/update.tpl', 44, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城后台管理</title>
	<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/admin/style/goods.css" />
	<script type="text/javascript" src="view/admin/js/ajax.js"></script>
	<script type="text/javascript" src="view/admin/js/goods_update.js"></script>
	<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
</head>
<body>

<h2><a href="?a=goods">返回商品列表</a>商品 -- 修改商品</h2>

<form method="post" name="update" action="?a=goods&m=update&id=<?php echo $this->_tpl_vars['OneGoods'][0]->id; ?>
">
	<input type="hidden" name="flag" id="flag" />
	<input type="hidden" name="brandid" id="brandid" value="<?php echo $this->_tpl_vars['OneGoods'][0]->brand; ?>
" />
	<input type="hidden" name="attrid" id="attrid" value="<?php echo $this->_tpl_vars['OneGoods'][0]->attr; ?>
" />
	<dl class="form">
		<dd>商品类型：<select name="nav" id="nav">
				<option value="-1" selected="selected">--请选择一个商品的类型--</option>
                <?php $_from = $this->_tpl_vars['addNav']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
					<optgroup label="<?php echo $this->_tpl_vars['value']->name; ?>
">
                        <?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['value']->child,'selected' => $this->_tpl_vars['OneGoods'][0]->nav), $this);?>

					</optgroup>
                <?php endforeach; endif; unset($_from); ?>
			</select> <span class="red">[必选]</span>
		</dd>
		<dd>商品品牌：<select name="brand" id="brand">
				<option value="-1">--请选择一个商品的品牌--</option>
			</select> <span class="red">[必选]</span>
		</dd>
		<dd>商品名称：<input type="text" name="name" value="<?php echo $this->_tpl_vars['OneGoods'][0]->name; ?>
" class="text" /> <span class="red">[必填]</span> ( * 2-100字符之间 )</dd>
		<dd>商品编号：<input type="text" name="sn" value="<?php echo $this->_tpl_vars['OneGoods'][0]->sn; ?>
" id="sn" onblur="checkSn();" class="text" /> <span class="red">[必填]</span> ( * 2-50字符之间，唯一 )</dd>
		<dd>销 售 价：<input type="text" name="price_sale" value="<?php echo $this->_tpl_vars['OneGoods'][0]->price_sale; ?>
" class="text small" /> 市 场 价：<input type="text" name="price_market" value="<?php echo $this->_tpl_vars['OneGoods'][0]->price_market; ?>
"  class="text small" /> 成 本 价：<input type="text" name="price_cost" value="<?php echo $this->_tpl_vars['OneGoods'][0]->price_cost; ?>
"  class="text small" /> ( * 成本价不在前台显示 )</dd>
		<dd>关 键 字：<input type="text" name="keyword" value="<?php echo $this->_tpl_vars['OneGoods'][0]->keyword; ?>
" class="text" /> ( * 例：纯棉|换季|白色；每个关键字用'|'隔开)</dd>
		<dd>计量单位：<input type="text" name="unit" value="<?php echo $this->_tpl_vars['OneGoods'][0]->unit; ?>
" class="text small" /> 重　　量：<input type="text" name="weight" value="<?php echo $this->_tpl_vars['OneGoods'][0]->weight; ?>
" class="text small" /> ( * 计量单位：个,kg,件；重量：默认kg)</dd>
		<dd>上传图片：<input type="text" name="thumbnail" value="<?php echo $this->_tpl_vars['OneGoods'][0]->thumbnail; ?>
" class="text" readonly="readonly" />
			<input type="button" value="上传产品图" onclick="centerWindow('?a=call&m=upfile&type=content','upfile','400','150')" />
			<img name="pic" style="display:block;" src="<?php echo $this->_tpl_vars['OneGoods'][0]->thumbnail; ?>
" /> ( * 保存图片完整性，最佳尺寸为：300 * 300  必须是jpg,gif,png，并且200k内)
		</dd>
		<dd><textarea id="TextArea1" name="content" class="ckeditor"><?php echo $this->_tpl_vars['OneGoods'][0]->content; ?>
</textarea></dd>
		<dd>是否上架：<?php echo smarty_function_html_radios(array('options' => $this->_tpl_vars['bool'],'selected' => $this->_tpl_vars['OneGoods'][0]->is_up,'name' => 'is_up'), $this);?>
　　免 运 费：<?php echo smarty_function_html_radios(array('options' => $this->_tpl_vars['bool'],'selected' => $this->_tpl_vars['OneGoods'][0]->is_freight,'name' => 'is_freight'), $this);?>
</dd>
		<dd>售后服务：<?php echo smarty_function_html_radios(array('name' => 'service','options' => $this->_tpl_vars['addService'],'checked' => $this->_tpl_vars['OneGoods'][0]->service), $this);?>
</dd>
		<dd>库　　存：<input type="text" name="inventory" value="<?php echo $this->_tpl_vars['OneGoods'][0]->inventory; ?>
" class="text small" /> 库存告急：<input type="text" name="warn_inventory" value="<?php echo $this->_tpl_vars['OneGoods'][0]->warn_inventory; ?>
" class="text small" /> ( * 库存达到指定数量就会在后台提醒 )</dd>
		<dd><input type="submit" name="send" value="修改商品" onclick="return updateGoods();" /> <input type="reset" value="重置" /></dd>
	</dl>
</form>


</body>
</html>