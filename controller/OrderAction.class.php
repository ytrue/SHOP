<?php
//订单控制器
class OrderAction extends Action {
    private $_delivery=null;

	public function __construct() {
		parent::__construct();
        $this->_delivery = new DeliveryModel();
	}
	
	//管理员列表
	public function index() {
		parent::page();
		$this->_tpl->assign('AllOrder', $this->_model->findAll());
		$this->_tpl->display(SMARTY_ADMIN.'order/show.tpl');
	}

	//删除

    public function delete()
    {

            if (isset($_GET['id'])) $this->_model->delete() ? $this->_redirect->succ(Tool::getPrevPage(), '订单删除成功！') : $this->_redirect->error('订单删除失败！');


    }
   //清理24小时未确认的订单
    public function clear() {
        $this->_model->clear() ? $this->_redirect->succ(Tool::getPrevPage(), '清理成功！') : $this->_redirect->error('没有找到可清理的订单！');
    }

	//修改
	public function update() {
 		if (isset($_POST['send'])) $this->_model->update() ? $this->_redirect->succ(Tool::getPrevPage(), '订单修改成功！') : $this->_redirect->error('订单修改失败,请确认订单是取消状态！');
 	if (isset($_GET['id'])) {
 		$this->_tpl->assign('OneOrder', $this->_model->findUserDetails());
        $this->_tpl->assign('AllDelivery', $this->_delivery->findUpdateOrder());
 		$this->_tpl->display(SMARTY_ADMIN.'order/update.tpl');
 		}
	}

}
?>