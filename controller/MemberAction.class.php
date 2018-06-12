<?php
//会员控制器
class MemberAction extends Action {
	private $_nav = null;
	private $_user = null;
    private $_address = null;
    private $_order=null;
    private $_commend=null;
	public function __construct() {
		parent::__construct();
		$this->_nav = new NavModel();
        $this->_user = new UserModel();
        $this->_address = new AddressModel();
        $this->_order=new OrderModel();
        $this->_commend = new CommendModel();
        $this->_goods = new GoodsModel();
        $this->_collect = new CollectModel();
	}

    public function index() {
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->display(SMARTY_FRONT.'public/member.tpl');
    }
////////////////////////////////////////////////////////
    public function address() {
         if (isset($_POST['send'])) $this->_address->add() ? $this->_redirect->succ('?a=member&m=address') : $this->_redirect->error('新增收货人失败！');
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('AllAddress', $this->_address->findAll());
        $this->_tpl->display(SMARTY_FRONT.'public/member_address.tpl');
    }

	public function delete(){
        if (isset($_GET['id'])) $this->_address->delete() ? $this->_redirect->succ(Tool::getPrevPage()) : $this->_redirect->error('收获地址删除失败！');
    }

    public function update(){
        if (isset($_POST['send'])) $this->_address->update() ? $this->_redirect->succ('?a=member&m=address') : $this->_redirect->error('收货地址修改失败！');
        if (isset($_GET['id'])) {
            $this->_tpl->assign('OneAddress', $this->_address->findOne());
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->display(SMARTY_FRONT . 'public/member_update.tpl');
        }
    }

   public function selected(){
          if ( isset($_GET['id'])) $this->_address->selected() ? $this->_redirect->succ('?a=member&m=address') : $this->_redirect->error('首选修改失败！');
   }


    public function order() {
        parent::page(10, $this->_order);
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('AllOrder', $this->_order->findUserAll());
        $this->_tpl->display(SMARTY_FRONT.'public/member_order.tpl');
    }

    public function order_details() {
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
        $this->_tpl->assign('prev', Tool::getPrevPage());
        $this->_tpl->display(SMARTY_FRONT.'public/member_order_details.tpl');
    }
   //支付宝付款
    public function alipay(){
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
        $this->_tpl->display(SMARTY_FRONT.'public/member_alipay.tpl');
    }
    public function alipay2() {
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
        $this->_tpl->display(SMARTY_FRONT.'public/member_alipay2.tpl');
    }

    public function alipay3() {
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('OneOrder', $this->_order->findUserDetails());
        $this->_tpl->display(SMARTY_FRONT.'public/member_alipay3.tpl');
    }

    public function commend() {
        if (isset($_POST['send'])) $this->_commend->add() ? $this->_redirect->succ(Tool::getPrevPage()) : $this->_redirect->error('发表评价失败！');
        $this->_order->isCommendOrder();
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('CommendOne', $this->_commend->findOne());
        $this->_tpl->assign('GoodsOne', $this->_order->findCommendOrder());
        $this->_tpl->display(SMARTY_FRONT.'public/member_commend.tpl');
    }

    //////////////////////////////////////////////

    public function reg() {
        if (isset($_POST['send'])) $this->_user->frontReg() ? $this->_redirect->succ('?a=member&m=login', '注册成功，请登录！') : $this->_redirect->error('注册失败！');
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->display(SMARTY_FRONT.'public/reg.tpl');
    }
	
	public function login() {
		if (isset($_POST['send'])) $this->_user->frontLogin() ? $this->_redirect->succ('./') : $this->_redirect->error('登录失败！');
		$this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
		$this->_tpl->display(SMARTY_FRONT.'public/login.tpl');
	}


    public function collect() {
        parent::page(20, $this->_goods);
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('collectGoods', $this->_goods->collectGoods());
        $this->_tpl->display(SMARTY_FRONT.'public/member_collect.tpl');
    }


    public function addCollect() {
        if (isset($_COOKIE['user'])) {
            $this->_collect->add() ? $this->_redirect->succ('?a=member&m=collect') : $this->_redirect->error('收藏失败！');
        } else {
            $this->_redirect->error('请登录后再操作！<a href="?a=member&m=login">[登录]</a>');
        }
    }

    public function delCollect() {
        $this->_collect->delete() ? $this->_redirect->succ('?a=member&m=collect') : $this->_redirect->error('取消收藏失败！');
    }


    public function cancel(){
        $this->_order->cancel() ? $this->_redirect->succ(Tool::getPrevPage()) : $this->_redirect->error('订单取消失败，请重试！');
    }

	public function logout() {
	 	$this->_user->frontLogout() ? $this->_redirect->succ('./') : $this->_redirect->error('退出失败！');
	}
    public function refund() {
        $this->_order->refund() ? $this->_redirect->succ(Tool::getPrevPage()) : $this->_redirect->error('申请退款，请重试！');
    }
    public function mycommend() {
        parent::page(20, $this->_commend);
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
         $this->_tpl->assign('MyCommend', $this->_commend->findMyCommend());
        $this->_tpl->display(SMARTY_FRONT.'public/member_mycommend.tpl');
    }
}
?>