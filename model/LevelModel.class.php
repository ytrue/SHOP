<?php
//等级实体类
class LevelModel extends Model {
	public function __construct() {
		parent::__construct();
		$this->_fields = array('id','level_name');
		$this->_tables = array(DB_FREFIX.'level');
	}
	
	public function findAll() {
		return parent::select(array('id','level_name'));
	}
}
?>