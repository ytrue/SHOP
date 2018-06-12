<?php
class Factory {
	static private $_obj = null;
	
	static public function setAction() {
		$_a = self::getA();
		if (Validate::inArray($_a, array('manage', 'nav', 'level'))) {
			if (!isset($_SESSION['admin'])) {
				Redirect::getInstance()->succ('?a=admin&m=login');	
			}
		}
		if (!file_exists(ROOT_PATH.'/controller/'.$_a.'Action.class.php')) $_a = 'Index';
		eval('self::$_obj = new '.ucfirst($_a).'Action();');
		return self::$_obj;
	}
	
	static public function setModel() {
		$_a = self::getA();
		if (file_exists(ROOT_PATH.'/model/'.$_a.'Model.class.php')) eval('self::$_obj = new '.ucfirst($_a).'Model();');
		return self::$_obj;
	}
	
	static public function getA() {
		if (isset($_GET['a']) && !empty($_GET['a'])) {
			return $_GET['a'];
		}
		return 'Index';
	}
	
}
?>