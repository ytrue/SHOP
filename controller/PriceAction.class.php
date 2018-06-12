<?php
//价格区间控制器
class PriceAction extends Action {
    public function __construct() {
        parent::__construct();
    }

    public function index() {
        parent::page();
        $this->_tpl->assign('AllPrice', $this->_model->findAll());
        $this->_tpl->display(SMARTY_ADMIN.'price/show.tpl');
    }

    public function add() {
        if (isset($_POST['send'])) $this->_model->add() ? $this->_redirect->succ('?a=price', '价格区间新增成功！') : $this->_redirect->error('价格区间新增失败！');
        $this->_tpl->display(SMARTY_ADMIN.'price/add.tpl');
    }

    public function update() {
        if (isset($_POST['send'])) $this->_model->update() ? $this->_redirect->succ(Tool::getPrevPage(), '价格区间修改成功！') : $this->_redirect->error('价格区间修改失败！');
        if (isset($_GET['id'])) {
            $this->_tpl->assign('OnePrice', $this->_model->findOne());
            $this->_tpl->display(SMARTY_ADMIN.'price/update.tpl');
        }

    }

    public function delete() {
      if (isset($_GET['id'])) $this->_model->delete() ? $this->_redirect->succ(Tool::getPrevPage(), '价格区间删除成功！') : $this->_redirect->error('价格区间删除失败！');
    }

}
?>