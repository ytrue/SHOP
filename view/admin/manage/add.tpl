<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线商城后台管理</title>
<link rel="stylesheet" type="text/css" href="view/admin/style/basic.css" />
<link rel="stylesheet" type="text/css" href="view/admin/style/manage.css" />
<script type="text/javascript" src="view/admin/js/ajax.js"></script>
<script type="text/javascript" src="view/admin/js/manage.js"></script>
</head>
<body>

<h2><a href="?a=manage">返回管理员列表</a>系统 -- 添加管理员</h2>


<form method="post" name="add" action="?a=manage&m=add">
	<input type="hidden" name="flag" id="flag" />
	<dl class="form">
		<dd>用 户 名：<input type="text" name="user" id="user" onblur="checkUser();" class="text" /> ( * 2-20位之间 )</dd>
		<dd>密　　码：<input type="password" name="pass" class="text" /> ( * 大于6位 )</dd>
		<dd>确认密码：<input type="password" name="notpass" class="text" /> ( * 同密码一致 )</dd>
		<dd>等　　级：<select name="level">
								<option value="0">--请选择一个等级权限--</option>
								{html_options options=$AllLevel}
							</select> ( * 必须选定一个权限 )</dd>
		<dd><input type="submit" name="send" onclick="return addManage();" value="新增管理员" class="submit" /></dd>
	</dl>
</form>


</body>
</html>