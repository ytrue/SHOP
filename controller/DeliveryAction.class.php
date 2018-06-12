<?php
//物流控制器
class DeliveryAction extends Action {
	public function __construct() {
		parent::__construct();
	}
	
	public function index() {
 	parent::page();
 	$this->_tpl->assign('AllDelivery', $this->_model->findAll());
		$this->_tpl->display(SMARTY_ADMIN.'delivery/show.tpl');
	}
	
	public function add() {
		if (isset($_POST['send'])) $this->_model->add() ? $this->_redirect->succ('?a=delivery', '快递新增成功！') : $this->_redirect->error('快递新增失败！');
		$this->_tpl->display(SMARTY_ADMIN.'delivery/add.tpl');
	}
	
	public function update() {
 	if (isset($_POST['send'])) $this->_model->update() ? $this->_redirect->succ(Tool::getPrevPage(), '快递修改成功！') : $this->_redirect->error('快递修改失败！');
 	if (isset($_GET['id'])) {
 			$this->_tpl->assign('OneDelivery', $this->_model->findOne());
 		$this->_tpl->display(SMARTY_ADMIN.'Delivery/update.tpl');
 		}
	}
	
	public function delete() {
	 	if (isset($_GET['id'])) $this->_model->delete() ? $this->_redirect->succ(Tool::getPrevPage(), '快递删除成功！') : $this->_redirect->error('快递删除失败！');
	}

	public function isName() {
		$this->_model->isName();
	}
}
?>