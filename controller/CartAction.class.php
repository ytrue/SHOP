<?php
//购物车控制器
class CartAction extends Action {
	private $_nav = null;
	private $_cart = null;
    private $_order = null;
    private $_address = null;
    private $_goods=null;
    private $_delivery=null;

	public function __construct() {
		parent::__construct();
        if (!isset($_COOKIE['user'])) $this->_redirect->succ('?a=member&m=login', '购物前必须登录操作！');
		$this->_cart = new Cart();
		$this->_nav = new NavModel();
		$this->_order=new OrderModel() ;
        $this->_address = new AddressModel();
        $this->_goods = new GoodsModel();
        $this->_delivery = new DeliveryModel();
	}
	
	//显示购物车
	public function index() {
		$this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
       // print_r($this->_cart->getProduct());
        $this->_tpl->assign('FrontCart', $this->_cart->getProduct());
		$this->_tpl->display(SMARTY_FRONT.'public/cart.tpl');

	}
    //显示结算
    public function flow() {
        if ($this->_goods->isFlow()) {
            $this->_tpl->assign('FrontDelivery', $this->_delivery->findAllFlow());
            $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
            $this->_tpl->assign('FrontCart', $this->_cart->getProduct());
            $this->_tpl->assign('FrontAddress', $this->_address->findOne());
            $this->_tpl->display(SMARTY_FRONT.'public/flow.tpl');
        }
     }

    //提交订单
    public function order() {
        if (isset($_POST['send'])) {
            if ($this->_order->isCart()) {
                $_id = $this->_order->getNextId();
                if ($this->_order->order()) {
                    $this->_goods->setInventory();
                    $this->_cart->clearProduct();
                    if ($_POST['pay'] == '支付宝') {
                        $this->_redirect->succ('?a=member&m=alipay&id='.$_id);
                    } elseif ($_POST['pay'] == '银行转账/汇款') {
                        $this->_redirect->succ('?a=member&m=alipay2&id='.$_id);
                    } elseif ($_POST['pay'] == '货到付款') {
                        $this->_redirect->succ('?a=member&m=alipay3&id='.$_id);
                    }
                }
            }
        }
    }

    //给购物车添加一个商品
    public function addProduct() {
        if ($this->_cart->addProduct()) $this->_redirect->succ('?a=cart');
    }

    //删除一个商品
    public function delProduct() {
        if ($this->_cart->delProduct()) $this->_redirect->succ('?a=cart');
    }

//清空购物车
    public function clearProduct() {
        if ($this->_cart->clearProduct()) $this->_redirect->succ('?a=cart');
    }

    //改变商品数量
    public function changeNum() {
        echo $this->_cart->changeNum() ? 1 : 2;
    }




}

?>