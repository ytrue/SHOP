<?php
//控制器基类
class Action {
	protected $_tpl = null;
	protected $_model = null;
	protected $_redirect = null;
	
	protected function __construct() {
		$this->_tpl = TPL::getInstance();
		$this->_model = Factory::setModel();
		$this->_redirect = Redirect::getInstance($this->_tpl);
	}

    protected function page($_pagesize = PAGE_SIZE, $_model = null) {
        $this->_model = Validate::isNullString($_model) ? $this->_model : $_model;
        $_page = new Page($this->_model->total(),$_pagesize);
        $this->_model->setLimit($_page->getLimit());
        $this->_tpl->assign('page',$_page->showpage());
        $this->_tpl->assign('num',($_page->getPage()-1)*$_pagesize);
    }
	
	public function run() {
		$_m = isset($_GET['m']) ? $_GET['m'] : 'index';
		method_exists($this, $_m) ? eval('$this->'.$_m.'();') : $this->index();
	}
}
?>