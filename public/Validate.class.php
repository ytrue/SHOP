<?php
//验证类
class Validate {
	
	//判断是否是数组
	static public function isArray($_array) {
		return is_array($_array) ? true : false;
	}
	
	//判断数组是否有元素
	static public function isNullArray($_array) {
		return count($_array) == 0 ? true : false;
	}
	
	//判断数组是否存在此元素
	static public function inArray($_data, $_array) {
		return in_array($_data, $_array) ? true : false;
	}
	
	//判断字符串是否为空
	static public function isNullString($_string) {
		return empty($_string) ? true : false;
	}
	
	//判断字符串长度是否合法
	static public function checkStrLength($_string, $_length, $_flag, $_charset = 'utf-8') {
		if ($_flag == 'min') {
			if (mb_strlen(trim($_string), $_charset) < $_length) return true;
			return false;
		} elseif ($_flag == 'max') {
			if (mb_strlen(trim($_string), $_charset) > $_length) return true;
			return false;
		} elseif ($_flag == 'equals') {
			if (mb_strlen(trim($_string), $_charset) != $_length) return true;
			return false;
		}
	}

    //判断字符串是否为数字
    static public function isNumeric($_string) {
        return is_numeric($_string) ? true : false;
    }
	//判断数据是否一致
	static public function checkStrEquals($_string, $_otherstring) {
		if (trim($_string) == trim($_otherstring)) return true;
		return false;
	}
	
}
?>