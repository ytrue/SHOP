<?php
class DetailsAction extends Action {
    private $_nav = null;
    private $_goods= null;
    private $_attr=null;
   // private $_commend= null;

    public function __construct() {
        parent::__construct();
        $this->_nav = new NavModel();
        $this->_attr = new AttrModel();
        $this->_goods = new GoodsModel();
        $this->_commend = new CommendModel();
        $this->_record = new RecordModel();
    }

    //实现初始页面
    public function index() {
        parent::page(20, $this->_commend);
        parent::page(20, $this->_record);
        $this->_tpl->assign('FrontNav', $this->_nav->findFrontNav());
        $this->_tpl->assign('FrontTenNav', $this->_nav->findFrontTenNav());
        $this->_tpl->assign('FrontGoods', $this->_goods->findDetailsGoods());
        $this->_tpl->assign('attrType', $this->_attr->getAttrType());
        $this->_tpl->assign('domian',Tool::getDoMain());

        $this->_tpl->assign('commend', $this->_commend->findDetailsCommend());
        $this->_tpl->assign('record', $this->_record->findDetailsRecord());

        $this->_tpl->assign('NavSort', $this->_goods->navSort());

        $this->_tpl->assign('FrontRecord', $this->_goods->getRecord());

        $this->_tpl->display(SMARTY_FRONT.'public/details.tpl');
    }

}

?>