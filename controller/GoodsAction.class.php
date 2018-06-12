<?php
//商品控制器
class GoodsAction extends Action {
	private $_nav = null;
	private $_brand = null;
    private $_attr = null;
	private $_service=null;
	public function __construct() {
		parent::__construct();
		$this->_nav = new NavModel();
		$this->_brand = new BrandModel();
        $this->_attr = new AttrModel();
        $this->_service = new ServiceModel();
	}
	
	public function index() {
		parent::page();
		$this->_tpl->assign('AllGoods', $this->_model->findAll());
		$this->_tpl->display(SMARTY_ADMIN.'goods/show.tpl');
	}
	
	public function add() {
		if (isset($_POST['send'])) $this->_model->add() ? $this->_redirect->succ('?a=goods', '商品新增成功！') : $this->_redirect->error('商品新增失败！');
		$this->_tpl->assign('addNav', $this->_nav->findAddGoodsNav());
        $this->_tpl->assign('addService', $this->_service->findAddGoodsService());
        $this->_tpl->assign('addServiceSelected', $this->_service->findAddGoodsServiceSelected());
		$this->_tpl->display(SMARTY_ADMIN.'goods/add.tpl');
	}
	
	public function update() {
        if (isset($_POST['send'])) $this->_model->update() ? $this->_redirect->succ(Tool::getPrevPage(), '商品修改成功！') : $this->_redirect->error('商品修改失败！');
        if (isset($_GET['id'])) {
            $this->_tpl->assign('addNav', $this->_nav->findAddGoodsNav());
            $this->_tpl->assign('bool', array(1=>'是',2=>'否'));
            $this->_tpl->assign('OneGoods', $this->_model->findOne());
            $this->_tpl->assign('addService', $this->_service->findAddGoodsService());
            $this->_tpl->display(SMARTY_ADMIN.'goods/update.tpl');
        }
	}
	
	public function delete() {
		if (isset($_GET['id'])) $this->_model->delete() ? $this->_redirect->succ(Tool::getPrevPage(), '商品删除成功！') : $this->_redirect->error('商品删除失败！');
	}

	public function getBrand() {
		echo $this->_brand->findGoodsBrand();
	}

    public function getAttr() {
        echo $this->_attr->findGoodsAttr();
    }


    public function isSn() {
		$this->_model->isSn();
	}
	
	public function isUpdateSn() {
		$this->_model->isUpdateSn();
	}
	
	public function isUp() {
		if ($this->_model->isUp()) $this->_redirect->succ(Tool::getPrevPage());
	}
	
}
?>