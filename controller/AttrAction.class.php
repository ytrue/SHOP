<?php
//自定义属性控制器
class AttrAction extends Action {
	private $_nav = null;
	
	public function __construct() {
		parent::__construct();
		$this->_nav = new NavModel();
	}
	
	public function index() {
        parent::page();
        $this->_tpl->assign('AllAttr', $this->_model->findAll());
		$this->_tpl->display(SMARTY_ADMIN.'attr/show.tpl');
	}

    public function add() {
        if (isset($_POST['send'])) $this->_model->add() ? $this->_redirect->succ('?a=attr', '自定义属性新增成功！') : $this->_redirect->error('自定义属性新增失败！');
        $this->_tpl->assign('addNav', $this->_nav->findAddGoodsNav());
        $this->_tpl->display(SMARTY_ADMIN.'attr/add.tpl');
    }


    public function update() {
        if (isset($_POST['send'])) $this->_model->update() ? $this->_redirect->succ(Tool::getPrevPage(), '自定义属性修改成功！') : $this->_redirect->error('自定义属性修改失败！');
        if (isset($_GET['id'])) {
            $this->_tpl->assign('addNav', $this->_nav->findAddGoodsNav());
            $this->_tpl->assign('OneAttr', $this->_model->findOne());
            $this->_tpl->assign('way', array(0=>'单选', 1=>'多选'));
            $this->_tpl->display(SMARTY_ADMIN.'attr/update.tpl');
        }
	}
	
	public function delete() {
		if (isset($_GET['id'])) $this->_model->delete() ? $this->_redirect->succ(Tool::getPrevPage(), '自定义属性删除成功！') : $this->_redirect->error('自定义属性删除失败！');
	}
	
}
?>