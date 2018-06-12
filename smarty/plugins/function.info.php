<?php
function smarty_function_info($_arr) {
	$_a = '';
	if ($_arr['show']) {
		$_a =  "您的年龄是：{$_arr['age']}岁，身高：{$_arr['height']}，血型：{$_arr['blood']}";
	}
	return $_a;
}
?>