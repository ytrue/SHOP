<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线商城系统</title>
	<link rel="stylesheet" type="text/css" href="view/default/style/basic.css" />
	<link rel="stylesheet" type="text/css" href="view/default/style/reg.css" />
	<script type="text/javascript" src="view/default/js/ajax.js"></script>
	<script type="text/javascript" src="view/default/js/reg.js"></script>
</head>
<body>
{include file='default/public/header.tpl'}
<div id="sait">
	当前位置：<a href="./">首页</a> &gt; 注册会员
</div>


<div id="reg">
	<form action="" name="reg" method="post">
		<input type="hidden" name="flag" id="flag" />
		<dl>
			<dd>用 户 名：<input type="text" name="user" id="user" onblur="checkUser();"  class="text" /></dd>
			<dd>密　　码：<input type="password" name="pass" class="text" /></dd>
			<dd>确认密码：<input type="password" name="notpass" class="text" /></dd>
			<dd><input type="submit" name="send" onclick="return regUser();" value="注册" class="submit" /></dd>
		</dl>
	</form>
</div>
{include file='default/public/footer.tpl'}
</body>
</html>