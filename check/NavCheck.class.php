<?php
//导航验证类
class NavCheck extends Check {
	
	public function addCheck(Model &$_model, $_param) {
		if (self::isNullString($_POST['name'])) {
			$this->_message[] = '导航名称不得为空！';
			$this->_flag = false;
		}
		if (self::checkStrLength($_POST['name'], 2, 'min')) {
			$this->_message[] = '导航名称不得小于2位！';
			$this->_flag = false;
		}
		if (self::checkStrLength($_POST['name'], 4, 'max')) {
			$this->_message[] = '导航名称不得大于4位！';
			$this->_flag = false;
		}
		if (self::checkStrLength($_POST['info'], 200, 'max')) {
			$this->_message[] = '导航简介不得大于200位！';
			$this->_flag = false;
		}
		if ($_model->isOne($_param)) {
			$this->_message[] = '导航名称被占用！';
			$this->_flag = false;
		}
		return $this->_flag;
	}
	
	public function updateCheck(Model &$_model) {
		if (self::checkStrLength($_POST['info'], 200, 'max')) {
			$this->_message[] = '导航简介不得大于200位！';
			$this->_flag = false;
		}
		return $this->_flag;
	}
	
	public function ajax(Model &$_model, Array $_param) {
		echo $_model->isOne($_param) ? 1 : 2;
	}
}
?>