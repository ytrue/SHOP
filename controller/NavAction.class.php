<?php
//导航条控制器
class NavAction extends Action {
	private $_brand = null;
	private $_price=null;
	
	public function __construct() {
		parent::__construct();
		$this->_brand = new BrandModel();
		$this->_price=new PriceModel();
	}
	
	public function index() {
		parent::page();
		if (isset($_GET['sid'])) $this->_tpl->assign('OneNav', $this->_model->findOne());
		$this->_tpl->assign('AllNav', $this->_model->findAll());
		$this->_tpl->display(SMARTY_ADMIN.'nav/show.tpl');
	}
	
	public function add() {
		if (isset($_POST['send'])) $this->_model->add() ? $this->_redirect->succ('?a=nav', '导航新增成功！') : $this->_redirect->error('导航新增失败！');
		if (isset($_GET['id'])) {
			$this->_tpl->assign('AllBrand', Tool::setFormItem($this->_brand->findNavBrand(), 'id', 'name'));
			$this->_tpl->assign('OneNav', $this->_model->findOne());
		}
        $this->_tpl->assign('AllPrice', Tool::setFormItem($this->_price->findAllNav(), 'value', 'value'));
		$this->_tpl->display(SMARTY_ADMIN.'nav/add.tpl');
	}
	
	public function update() {
		if (isset($_POST['send'])) $this->_model->update() ? $this->_redirect->succ(Tool::getPrevPage(), '导航名称修改成功！') : $this->_redirect->error('导航名称修改失败！');
		if (isset($_GET['id'])) {
            $this->_tpl->assign('AllBrand', Tool::setFormItem($this->_brand->findNavBrand(), 'id', 'name'));
            $this->_tpl->assign('AllPrice', Tool::setFormItem($this->_price->findAllNav(), 'value', 'value'));
            $this->_tpl->assign('selectedBrand', $this->_model->findUpdateBrand());
            $this->_tpl->assign('selectedPrice', $this->_model->findUpdatePrice());
            $this->_tpl->assign('OneNav', $this->_model->findOne());
            $this->_tpl->display(SMARTY_ADMIN.'nav/update.tpl');
		}
	}
	
	public function delete() {
		if (isset($_GET['id'])) $this->_model->delete() ? $this->_redirect->succ(Tool::getPrevPage(), '导航名称删除成功！') : $this->_redirect->error('导航名称删除失败！');
	}
	
	public function sort() {
		if (isset($_POST['send'])) $this->_model->sort() ? $this->_redirect->succ(Tool::getPrevPage()) : $this->_redirect->error('排序失败！');
	}
	
	public function isName() {
		$this->_model->isName();
	}
	
}
?>