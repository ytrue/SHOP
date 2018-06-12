<?php
//售后服务实体类
class ServiceModel extends Model {
	public function __construct() {
		parent::__construct();
		$this->_fields = array('id','name','content','first','date');
		$this->_tables = array(DB_FREFIX.'service');
		$this->_check = new ServiceCheck();
        list(
            $this->_R['id'],
            $this->_R['name'],
            $this->_R['first']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_POST['name']) ? $_POST['name'] : null,
            isset($_POST['first']) ? $_POST['first'] : null
        ));
	}
	
	public function findAll() {
		return parent::select(array('id','name','content','first'), 
												array('limit'=>$this->_limit,'order'=>'date DESC'));
	}
    public function findAddGoodsService() {
        $_allService = parent::select(array('id','name'));
        $_temp = array();
        foreach ($_allService as $_key=>$_value) {
            $_temp[$_value->id] = $_value->name;
        }
        return $_temp;
    }

    public function findAddGoodsServiceSelected() {
        $_allService = parent::select(array('id', 'first'));
        foreach ($_allService as $_key=>$_value) {
            if ($_value->first == 1) return $_value->id;
        }
    }

    public function total() {
		return parent::total();
	}
	
	public function findOne() {
		$_where = array("id='{$this->_R['id']}'");
		if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
		return parent::select(array('id','name','content','first'),
											array('where'=>$_where, 'limit'=>'1'));
	}

    public function add() {
        $_where = array("name='{$this->_R['name']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();

        if ($this->_R['first'] == 1) {
            $_where2 = array("first=1");
            $_updateData['first'] = 0;
            parent::update($_where2, $_updateData);
        }

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
        //if (!$this->_check->updateCheck($this)) $this->_check->error();
        if ($this->_R['first'] == 1) {
            $_where2 = array("first=1");
            $_updateData['first'] = 0;
            parent::update($_where2, $_updateData);
        }
        $_updateData = $this->getRequest()->filter($this->_fields);
        return parent::update($_where, $_updateData);
    }

    public function first() {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();

        $_where = array("first=1");
        $_updateData['first'] = 0;
        parent::update($_where, $_updateData);

        $_where = array("id='{$this->_R['id']}'");
        $_updateData['first'] = 1;
        return parent::update($_where, $_updateData);
    }


	public function isName() {
		$_where = array("name='{$this->_R['name']}'");
		$this->_check->ajax($this, $_where);
	}
}
?>