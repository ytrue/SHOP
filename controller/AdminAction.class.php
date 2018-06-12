<?php
//后台控制器
class AdminAction extends Action {
	private $_manage = null;
	
	public function __construct() {
		parent::__construct();
        $this->_manage = new ManageModel();
        $this->_goods = new GoodsModel();
        $this->_order = new OrderModel();
	}
	
	//后台初始页面
	public function index() {
		if (isset($_SESSION['admin'])) {
			$this->_tpl->assign('admin', $_SESSION['admin']);
			$this->_tpl->display(SMARTY_ADMIN.'public/admin.tpl');
		} else {
			$this->_redirect->succ('?a=admin&m=login');	
		}
	}

    //起始页
    public function main() {
        $this->_tpl->assign('DownGoodsCount', $this->_goods->downGoodsCount());
        $this->_tpl->assign('AllGoodsCount', $this->_goods->allGoodsCount());
        $this->_tpl->assign('InventoryGoodsCount', $this->_goods->inventoryGoodsCount());
        $this->_tpl->assign('Order4Count', $this->_order->order4Count());
        $this->_tpl->assign('Order2Count', $this->_order->order2Count());
        $this->_tpl->assign('Order3Count', $this->_order->order3Count());
        $this->_tpl->assign('Order1Count', $this->_order->order1Count());
        $this->_tpl->display(SMARTY_ADMIN.'public/main.tpl');
    }
	
	//后台登录
	public function login() {
		if (isset($_POST['send'])) {
			if ($this->_manage->login()) {
				$_login = $this->_manage->findLogin();
				$_SESSION['admin']['user'] = $_login[0]->user;
				$_SESSION['admin']['level'] = $_login[0]->level_name;
				$this->_manage->countLogin();
				$this->_redirect->succ('?a=admin', '后台登录成功！');
			}
		}
		$this->_tpl->display(SMARTY_ADMIN.'public/login.tpl');
	}
	
	//后台退出
	public function logout() {
		if (isset($_SESSION['admin'])) session_destroy();
		$this->_redirect->succ('?a=admin&m=login');	
	}
	
	//ajaxlogin
	public function ajaxLogin() {
		$this->_manage->ajaxLogin();
	}
	
	//ajaxcode
	public function ajaxCode() {
		$this->_manage->ajaxCode();
	}
}
?>