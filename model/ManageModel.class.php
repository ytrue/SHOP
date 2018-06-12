<?php
//管理员实体类
class ManageModel extends Model {
	public function __construct() {
		parent::__construct();
		$this->_fields = array('id','user','pass','level', 'last_ip','last_time','reg_time');
		$this->_tables = array(DB_FREFIX.'manage');
		$this->_check = new ManageCheck();
		list(
				$this->_R['id'], 
				$this->_R['user'], 
				$this->_R['pass'], 
				$this->_R['code']
		) = $this->getRequest()->getParam(array(
				isset($_GET['id']) ? $_GET['id'] : null,
				isset($_POST['user']) ? $_POST['user'] : null,
				isset($_POST['pass']) ? $_POST['pass'] : null,
				isset($_POST['code']) ? $_POST['code'] : null
		));
	}
	
	public function findAll() {
		$this->_tables = array(DB_FREFIX.'manage a', DB_FREFIX.'level b');
		return parent::select(array('a.id','a.user','a.level', 'a.last_ip','a.last_time', 'b.level_name'),
											array('where'=>array('a.level=b.id'),'limit'=>$this->_limit, 'order'=>'a.reg_time DESC'));
	}
	
	public function findOne() {
		$_where = array("id='{$this->_R['id']}'");
		if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
		return parent::select(array('id','user','level'),
											array('where'=>$_where, 'limit'=>'1'));
	}
	
	public function findLogin() {
		$this->_tables = array(DB_FREFIX.'manage a', DB_FREFIX.'level b');
		return parent::select(array('a.user', 'b.level_name'),
											array('where'=>array('a.level=b.id', "user='{$this->_R['user']}'"), 'limit'=>'1'));
	}
	
	public function countLogin() {
		$_where = array("user='{$this->_R['user']}'");
		$_updateData['last_ip'] = Tool::getIP();
		$_updateData['last_time'] = Tool::getDate();
		parent::update($_where, $_updateData);
	}
	
	public function total() {
		return parent::total();
	}
	
	public function add() {
		$_where = array("user='{$this->_R['user']}'");
		if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
		$_addData = $this->getRequest()->filter($this->_fields);
		$_addData['pass'] = sha1($_addData['pass']);
		$_addData['last_ip'] = Tool::getIP();
		$_addData['reg_time'] = Tool::getDate();
		return parent::add($_addData);
	}
	
	public function update() {
		$_where = array("id='{$this->_R['id']}'");
		if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
		if (!$this->_check->updateCheck($this)) $this->_check->error();
		$_updateData = $this->getRequest()->filter($this->_fields);
		$_updateData['pass'] = sha1($_updateData['pass']);
		return parent::update($_where, $_updateData);
	}
	
	public function delete() {
		$_where = array("id='{$this->_R['id']}'");
		return parent::delete($_where);
	}
	
	public function isUser() {
		$_where = array("user='{$this->_R['user']}'");
		$this->_check->ajax($this, $_where);
	}
	
	public function login() {
		$_where = array("user='{$this->_R['user']}'", "pass='".sha1($this->_R['pass'])."'");
		if (!$this->_check->loginCheck($this, $_where)) {
			$this->_check->error();
		} else {
			return true;
		}
	}
	
	public function ajaxLogin() {
		$_where = array("user='{$this->_R['user']}'", "pass='".sha1($this->_R['pass'])."'");
		$this->_check->ajaxLogin($this, $_where);
	}
	
	public function ajaxCode() {
		$this->_check->ajaxcode($this, $this->_R['code']);
	}
}
?>