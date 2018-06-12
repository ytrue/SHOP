<?php
//收藏验证类
class CollectCheck extends Check {
	
	public function addCheck(Model &$_model, Array $_param) {
		if ($_model->isOne($_param)) {
			$this->_message[] = '您已经收藏过此商品！';
			$this->_flag = false;
		}
		return $this->_flag;
	}

}
?>