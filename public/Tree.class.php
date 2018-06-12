<?php
//二级树型结构
class Tree {
	//用于存放实例化的对象
	static private $_instance = null;
	//公共静态方法获取实例化的对象
	static public function getInstance() {
		if (!(self::$_instance instanceof self)) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	//私有克隆
	private function __clone() {}
	//私有构造
	private function __construct() {}
	
	//得到二级树型结构
	public function getTree(Array $_all, $_id) {
		//得到所有的数据必须遵循一下格式：
		//索引字段必须是id，如果不是可以使用别名 key as id,key id
		//主类和子类的区分用的字段：sid，如果不是可以用别名：skey as sid,skey sid
		//类别名称必须使用name，如果不是，那么使用kind as name ,kind name
		foreach ($_all as $_key=>$_value) {
			$_value->sid == 0 ? $_mainNav[] = $_value : $_childNav[] = $_value;
			if ($_value->id == $_id) {
				$_resultNav[0] = $_value;
				$_resultNav[0]->sait[$_resultNav[0]->id] = $_resultNav[0]->name;
			}
			if ($_value->sid == $_id) {
				$_resultNav[0]->child[] = $_value;
			}
		}
		if ($_resultNav[0]->sid != 0) {
			foreach ($_mainNav as $_key=>$_value) {
				if ($_resultNav[0]->sid == $_value->id) {
					$_child = $_resultNav;
					$_resultNav[0] = $_value;
					$_resultNav[0]->sait[$_resultNav[0]->id] = $_resultNav[0]->name;
					$_resultNav[0]->sait[$_child[0]->id] = $_child[0]->name;
				}
			}
			foreach ($_childNav as $_key=>$_value) {
				if ($_resultNav[0]->id == $_value->sid) {
					$_resultNav[0]->child[] = $_value;
				}
			}
		}
		return $_resultNav;
	}
}
?>