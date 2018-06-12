<?php
//TPL继承smarty
class TPL extends Smarty {
	//用于存放实例化的对象
	static private $_instance;
	
	//公共静态方法获取实例化的对象
	static public function getInstance() {
		if (!(self::$_instance instanceof self)) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	
	//私有克隆
	private function __clone() {}
	
	//私有构造
	private function __construct() {
		$this->setConfigs();
	}
	
	//重写Smarty配置
	private function setConfigs() {
		$this->template_dir = SMARTY_TEMPLATE_DIR;
		$this->compile_dir = SMARTY_COMPILE_DIR;
		$this->config_dir = SMARTY_CONFIG_DIR;
		$this->cache_dir = SMARTY_CACHE_DIR;
		$this->caching = SMARTY_CACHING;
		$this->cache_lifetime = SMARTY_CACHE_LIFETIME;
		$this->left_delimiter = SMARTY_LEFT_DELIMITER;
		$this->right_delimiter = SMARTY_RIGHT_DELIMITER;
	}
}
?>