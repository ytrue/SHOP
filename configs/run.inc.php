<?php
session_start();
//错误级别
error_reporting(E_ALL&~E_STRICT);
//创建一个实际路径
define('ROOT_PATH',substr(dirname(__FILE__),0,-8));
//设置编码
header('Content-Type:text/html;charset=utf-8');
//设置时区
date_default_timezone_set('Asia/Shanghai');
//引入系统配置文件
require ROOT_PATH.'/configs/profile.inc.php';
//引入Smarty
require ROOT_PATH.'/smarty/Smarty.class.php';

//自动加载类
function __autoload($_className) {
	if (substr($_className, -6) == 'Action') {
		require ROOT_PATH.'/controller/'.$_className.'.class.php';
	} elseif (substr($_className, -5) == 'Model') {
		require ROOT_PATH.'/model/'.$_className.'.class.php';
	} elseif (substr($_className, -5) == 'Check') {
		require ROOT_PATH.'/check/'.$_className.'.class.php';
	} else {
		require ROOT_PATH.'/public/'.$_className.'.class.php';
	}
}
//单入口
Factory::setAction()->run();
?>