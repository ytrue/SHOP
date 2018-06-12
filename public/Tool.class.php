<?php
//工具类，封装函数和算法等。
class Tool {
	
	//获取客户端ip
	static public function getIP() {
		return $_SERVER["REMOTE_ADDR"];
	}
	
	//获取目前的时间
	static public function getDate() {
		return date('Y-m-d H:i:s');
	}
    //已时间来生成订单号
    static public function getOrderNum() {
        return date('YmdHis'.mt_rand(1,99999));
    }
	//表单提交字符转义
	static public function setFormString($_string) {
		if (!get_magic_quotes_gpc()) {
			if (Validate::isArray($_string)) {
				foreach ($_string as $_key=>$_value) {
					$_string[$_key] = self::setFormString($_value);	//不支持就用代替addslashes();
				}
			} else {
				return addslashes($_string); //mysql_real_escape_string($_string, $_link);
			}
		}
		return $_string;
	}
	
	//html过滤
	static public function setHtmlString($_data) {
		$_string = '';
		if (Validate::isArray($_data)) {
			if (Validate::isNullArray($_data)) return $_data;
			foreach ($_data as $_key=>$_value) {
				$_string[$_key] = self::setHtmlString($_value);  //递归
			}
		} elseif (is_object($_data)) {
			foreach ($_data as $_key=>$_value) {
				@$_string->$_key = self::setHtmlString($_value);  //递归
			}
		} else {
			$_string = htmlspecialchars($_data);
		}
		return $_string;
	}
	
	//表单选项转换
	static public function setFormItem($_data, $_key, $_value) {
		$_items = array();
		if (Validate::isArray($_data)) {
			foreach ($_data as $_v) {
				$_items[$_v->$_key] = $_v->$_value;
			}
		}
		return $_items;
	}
	
	//过滤
	static public function setRequest() {
		if (isset($_GET)) $_GET = Tool::setFormString($_GET);
		if (isset($_POST)) $_POST = Tool::setFormString($_POST);
	}
    //获取地址
    static function getUrl() {
        $_url = $_SERVER["REQUEST_URI"];
        $_par = parse_url($_url);
        if (isset($_par['query'])) {
            parse_str($_par['query'],$_query);
//            unset($_query['price']);
//            unset($_query['brand']);
            $_url = $_par['path'].'?'.http_build_query($_query);
        }
        return $_url;
    }

    //获取域名，如果有目录就是域名+目录
    static function getDoMain() {
        $_url = 'http://'.$_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"];
        if (strpos($_url, 'index.php')) {
            $_url = substr($_url, 0, strpos($_url, 'index.php'));
        } else {
            $_url = substr($_url, 0, strpos($_url, '?'));
        }
        return $_url;
    }

	//得到上一页
	static public function getPrevPage() {
		return empty($_SERVER["HTTP_REFERER"]) ? '###' : $_SERVER["HTTP_REFERER"];
	}
}
?>