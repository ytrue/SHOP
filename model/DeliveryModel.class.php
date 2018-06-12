<?php
//物流实体类
class DeliveryModel extends Model {
	public function __construct() {
		parent::__construct();
		$this->_fields = array('id','name','url','info','date','price_in','price_out','price_add');
		$this->_tables = array(DB_FREFIX.'delivery');
		$this->_check = new DeliveryCheck();
		list(
				$this->_R['id'],
				$this->_R['name']
		) = $this->getRequest()->getParam(array(
				isset($_GET['id']) ? $_GET['id'] : null,
				isset($_POST['name']) ? $_POST['name'] : null
		));
	}
	
	
	public function findAll() {
		return parent::select(array('id','name','url','info','price_in','price_out','price_add'),
												array('limit'=>$this->_limit,'order'=>'date DESC'));
	}
	
	public function total() {
		return parent::total();
	}
    public function findAllFlow() {
        return parent::select(array('id','name','url','info','price_in','price_out','price_add'));
    }
	public function findOne() {
		$_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
		return parent::select(array('id','name','url','info','price_in','price_out','price_add'),
											array('where'=>$_where, 'limit'=>'1'));
	}

   public function findUpdateOrder(){
       return parent::select(array('id','name','url' ));
   }



	
	public function add() {
		$_where = array("name='{$this->_R['name']}'");
 		if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
		$_addData = $this->getRequest()->filter($this->_fields);
		$_addData['date'] = Tool::getDate();
		return parent::add($_addData);
	}
	
	public function delete() {
		$_where = array("id='{$this->_R['id']}'");
		return parent::delete($_where);
	}
	
	public function update() {
		$_where = array("id='{$this->_R['id']}'");
		if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
		if (!$this->_check->updateCheck($this)) $this->_check->error();
		$_updateData = $this->getRequest()->filter($this->_fields);
		return parent::update($_where, $_updateData);
	}
	
	public function isName() {
		$_where = array("name='{$this->_R['name']}'");
		$this->_check->ajax($this, $_where);
	}
}
?>