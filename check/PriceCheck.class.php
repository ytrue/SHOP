<?php
//价格区间验证类
class PriceCheck extends Check {

	public function addCheck(Model &$_model, $_param) {
		if (self::isNullString($_POST['price_left'])) {
			$this->_message[] = '左区间不得为空！';
			$this->_flag = false;
		}
		if (self::isNullString($_POST['price_right'])) {
			$this->_message[] = '右区间不得为空！';
			$this->_flag = false;
		}
		if (!self::isNumeric($_POST['price_left'])) {
			$this->_message[] = '左区间必须是数字！';
			$this->_flag = false;
		}
		if (!self::isNumeric($_POST['price_right'])) {
			$this->_message[] = '右区间必须是数字！';
			$this->_flag = false;
		}
		if ($_POST['price_left'] >= $_POST['price_right']) {
			$this->_message[] = '左区间必须小于右区间！';
			$this->_flag = false;
		}
		if ($_model->isOne($_param)) {
			$this->_message[] = '此区间已存在！';
			$this->_flag = false;
		}
		return $this->_flag;
	}
	
	public function updateCheck(Model &$_model) {
		return $this->_flag;
	}
	
	public function ajax(Model &$_model, Array $_param) {
		echo $_model->isOne($_param) ? 1 : 2;
	}
}
?>