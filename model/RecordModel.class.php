<?php
//记录实体类
class RecordModel extends Model {
	public function __construct() {
		parent::__construct();
		$this->_fields = array('id','name','user','attr','num','date','price','goods_id');
		$this->_tables = array(DB_FREFIX.'record');
		//$this->_check = new BrandCheck();
		list(
				$this->_R['id'],
				$this->_R['goodsid']
		) = $this->getRequest()->getParam(array(
				isset($_GET['id']) ? $_GET['id'] : null,
				isset($_GET['goodsid']) ? $_GET['goodsid'] : null
		));
	}
	

	
	public function findDetailsRecord() {
		return parent::select(array('id','name','user','attr','date','price','num'), 
												array('where'=>array("goods_id='{$this->_R['goodsid']}'"),'limit'=>$this->_limit,'order'=>'date DESC'));
	}
	

	public function total() {
		return parent::total(array('where'=>array("goods_id='{$this->_R['goodsid']}'")));
	}

}
?>