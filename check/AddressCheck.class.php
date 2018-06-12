<?php
class AddressCheck extends Check{
    public function addCheck(Model &$_model, Array $_param){
        if (self::isNullString($_POST['name'])) {
            $this->_message[] = '收货人不得为空！';
            $this->_flag = false;
        }
        if (self::isNullString($_POST['address'])) {
            $this->_message[] = '收货地址不得为空！';
            $this->_flag = false;
        }
        if (self::isNullString($_POST['code'])) {
            $this->_message[] = '邮政编码不得为空！';
            $this->_flag = false;
        }
        if (self::isNullString($_POST['tel'])) {
            $this->_message[] = '电话号码不得为空！';
            $this->_flag = false;
        }
        return $this->_flag;
    }

    public function updateCheck(Model &$_model) {
        return $this->_flag;
    }
}
?>