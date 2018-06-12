<?php
define('SMARTY_FRONT', 'default/');//皮肤
define('SMARTY_ADMIN', 'admin/');//后台皮肤
define('SMARTY_TEMPLATE_DIR', ROOT_PATH.'/view/');//模板目录
define('SMARTY_COMPILE_DIR', ROOT_PATH.'/compile/');//编译目录
define('SMARTY_CONFIG_DIR', ROOT_PATH.'/configs/');//配置变量目录
define('SMARTY_CACHE_DIR', ROOT_PATH.'/cache/');//缓存目录
define('SMARTY_CACHING', 0);//是否开启缓存，网站开发调试阶段，我们应该关闭缓存
define('SMARTY_CACHE_LIFETIME', 60*60*24);//缓存的声明周期
define('SMARTY_LEFT_DELIMITER', '{');//左定界符
define('SMARTY_RIGHT_DELIMITER', '}');//右定界符

//设置数据库连接参数
define('DB_DNS', 'mysql:host=localhost;dbname=shop');//数据库的dns
define('DB_USER', 'root');//用户名
define('DB_PASS', 'root');//密码
define('DB_CHARSET', 'UTF8');//字符集
define('DB_FREFIX', 'mall_');//表前缀

//系统参数设置
define('PAGE_SIZE', 10);//分页数量
define('UPDIR','uploads/');//上传图片目录
define('MARK',ROOT_PATH.'/view/admin/images/yc.png');//水印
?>