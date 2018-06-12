<?php
//商品实体类
class GoodsModel extends Model {
    public function __construct() {
        parent::__construct();
        $this->_fields = array('sales','id','nav','brand','name','attr','sn','price_sale','price_market','price_cost','keyword','unit','weight','thumbnail','content','is_up','is_freight','inventory','warn_inventory','service','date');
        $this->_tables = array(DB_FREFIX.'goods');
        $this->_check = new GoodsCheck();
        list(
            $this->_R['id'],
            $this->_R['navid'],
            $this->_R['goodsid'],
            $this->_R['sn'],
            $this->_R['act'],
            $this->_R['price'],
            $this->_R['brand'],
            $this->_R['attr']
            ) = $this->getRequest()->getParam(array(
            isset($_GET['id']) ? $_GET['id'] : null,
            isset($_GET['navid']) ? $_GET['navid'] : null,
            isset($_GET['goodsid']) ? $_GET['goodsid'] : null,
            isset($_POST['sn']) ? $_POST['sn'] : null,
            isset($_GET['act']) ? $_GET['act'] : null,
            isset($_GET['price']) ? $_GET['price'] : null,
            isset($_GET['brand']) ? $_GET['brand'] : null,
            isset($_GET['attr']) ? $_GET['attr'] : null
        ));
    }

    public function findAll() {
        $this->_tables = array(DB_FREFIX.'goods a', DB_FREFIX.'nav b');
        $_allGoods = parent::select(array('a.id','a.name','a.sn','a.brand','a.price_sale','a.is_up','a.inventory','b.name as nav_name'),
            array('where'=>array('a.nav=b.id'),'limit'=>$this->_limit, 'order'=>'a.date DESC'));
        $this->_tables = array(DB_FREFIX.'brand');
        $_allBrand = Tool::setFormItem(parent::select(array('id','name')), 'id', 'name');
        foreach ($_allGoods as $_key=>$_value) {
            if ($_value->brand == 0) {
                $_value->brand = '其他品牌';
            } else {
                $_value->brand = $_allBrand[$_value->brand];
            }
        }
        return $_allGoods;
    }

    public function findOne() {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        return parent::select(array('id','name','sn','attr','price_sale','price_market','price_cost','keyword','unit','weight','thumbnail','content','is_up','is_freight','inventory','warn_inventory','nav','brand','service'),
            array('where'=>$_where, 'limit'=>'1'));
    }
///////////////////////////////前台
    public function findDetailsGoods() {
        $_oneGoods = parent::select(array('id','nav','brand','name','thumbnail','thumbnail2','sn','attr','price_sale','price_market','unit','weight','content','is_up','is_freight','inventory','service','sales'),
            array('where'=>array("id='{$this->_R['goodsid']}'")));
        $_oneGoods[0]->content = htmlspecialchars_decode($_oneGoods[0]->content);
        $this->_tables = array(DB_FREFIX.'brand');
        $_allBrand = Tool::setFormItem(parent::select(array('id','name')), 'id', 'name');
        if ($_oneGoods[0]->brand == 0) {
            $_oneGoods[0]->brandname = '其他品牌';
        } else {
            $_oneGoods[0]->brandname = $_allBrand[$_oneGoods[0]->brand];
        }
        $this->_tables = array(DB_FREFIX.'service');
        $_where = array("id='{$_oneGoods[0]->service}'");
        $_service = parent::select(array('content'),
            array('where'=>$_where, 'limit'=>'1'));
        $_oneGoods[0]->service = htmlspecialchars_decode($_service[0]->content);
        $this->_tables = array(DB_FREFIX.'goods');


        if (isset($_COOKIE['record'][$_oneGoods[0]->id])) {
            setcookie('record['.$_oneGoods[0]->id.']', '', time() - 60 * 60 * 24 * 7);
        }

        setcookie('record['.$_oneGoods[0]->id.']', serialize(array(
            'id'=>$_oneGoods[0]->id,
            'nav'=>$_oneGoods[0]->nav,
            'name'=>$_oneGoods[0]->name,
            'thumbnail2'=>$_oneGoods[0]->thumbnail2,
            'price'=>$_oneGoods[0]->price_sale
        )), time() + 60 * 60 * 24 * 7);


        if (isset($_COOKIE['record'])) {
            if (count($_COOKIE['record']) > 5) {
                $_keys = array_keys($_COOKIE['record']);
                setcookie('record['.$_keys[0].']', '', time() - 60 * 60 * 24 * 7);
            }
        }

        return $_oneGoods;
    }
    public function setCompare() {
        if (isset($_COOKIE['compare'])) {
            if ($this->_R['navid'] == current($_COOKIE['compare'])) {
                if (count($_COOKIE['compare']) < 3) {
                    setcookie('compare['.$this->_R['goodsid'].']', $this->_R['navid'], time() + 60 * 60 * 24 * 7);
                }
            } else {
                $this->_check->setMessage('不同的类别商品无法进行添加对比！');
                $this->_check->error();
            }
        } else {
            setcookie('compare['.$this->_R['goodsid'].']', $this->_R['navid'], time() + 60 * 60 * 24 * 7);
        }

    }
    public function getCompare() {
        if (isset($_COOKIE['compare'])) {
            $_compareArr = array_keys($_COOKIE['compare']);
            $_compareStr = implode($_compareArr, ',');

            $this->_tables = array(DB_FREFIX.'goods a');
            $_compareGoods = parent::select(array('id','nav','name','(SELECT name FROM mall_brand c WHERE c.id=a.brand) AS brand','sn','attr','weight','price_sale','price_market','thumbnail2','unit','sales','(SELECT COUNT(*) FROM mall_commend b WHERE flag=0 AND b.goods_id=a.id) AS count'),
                array('where'=>array("id in ($_compareStr)")));

            $this->_tables = array(DB_FREFIX.'goods');

            foreach ($_compareArr as $_key=>$_value) {
                foreach ($_compareGoods as $_key2=>$_value2) {
                    if ($_value == $_value2->id) {
                        $_compareArr[$_key] = $_compareGoods[$_key2];
                    }
                }
            }

            return $_compareArr;
        }
    }

    public function delCompare() {
        if (isset($_COOKIE['compare'])) {
            setcookie('compare['.$this->_R['goodsid'].']', '', time() - 60 * 60 * 24 * 7);
        }
    }

    public function clearCompare() {
        if (isset($_COOKIE['compare'])) {
            foreach ($_COOKIE['compare'] as $_key=>$_value) {
                setcookie('compare['.$_key.']', '', time() - 60 * 60 * 24 * 7);
            }
        }
    }

    public function getRecord() {
        $_recordArr = array();
        if (isset($_COOKIE['record'])) {
            foreach ($_COOKIE['record'] as $_key=>$_value) {
                $_recordArr[$_key] = unserialize(stripslashes($_value));
            }
        }
        return array_reverse($_recordArr);
    }

    public function delRecord() {
        if (isset($_COOKIE['record'])) {
            foreach ($_COOKIE['record'] as $_key=>$_value) {
                setcookie('record['.$_key.']', '', time() - 60 * 60 * 24 * 7);
            }
        }
        return true;
    }

    public function isFlow() {
        $_goods = array();
        if (isset($_COOKIE['cart'])) {
            foreach ($_COOKIE['cart'] as $_key=>$_value) {
                $_temp = unserialize(stripslashes($_value));
                $_goods[$_key] = null;
                @$_goods[$_key]->name = $_temp['name'];
                $_goods[$_key]->num = $_temp['num'];
            }
        }
        $_flag = false;
        foreach ($_goods as $_key=>$_value) {
            $_where = array("id='{$_key}' AND inventory<{$_value->num}");
            if (!!$_obj = parent::select(array('id, inventory'), array('where'=>$_where, 'limit'=>'1'))) {
                $this->_check->setMessage('您购买的“'.$_value->name.'”，超过了库存；您的购买量为：'.$_value->num.'，库存量为：'.$_obj[0]->inventory);
                $_flag = true;
            }
        }
        if ($_flag) {
            $this->_check->error();
        } else {
            return true;
        }
    }

    public function findListGoods() {
        $_priceSQL = '';
        $_brandSQL = '';
        $_attrSQL = '';
        if ($this->_R['price']) {
            $_left = substr($this->_R['price'], 0, strpos($this->_R['price'], ','));
            $_right = substr($this->_R['price'], strpos($this->_R['price'], ',') + 1);
            $_priceSQL = "AND price_sale BETWEEN $_left AND $_right";
        }
        if ($this->_R['brand']) {
            $_brand = $this->_R['brand'] == 'other' ? 0 : $this->_R['brand'];
            $_brandSQL = "AND brand='$_brand'";
        }
        if ($this->_R['attr']) {
            $_attr = explode(':', $this->_R['attr']);
            $_attrSQL = "AND attr LIKE '%$_attr[0]%$_attr[1]%'";
        }
        $_allGoods = parent::select(array('id','nav','name','price_sale','price_market','thumbnail','thumbnail2','commendnum','sales','unit'),
            array('limit'=>$this->_limit,'where'=>array("nav in ({$this->getNavId()}) AND is_up=1  $_priceSQL $_brandSQL $_attrSQL "),'order'=>'date DESC'));
        foreach ($_allGoods as $_value) {
            if (Validate::isNullString($_value->thumbnail2)) {
                $_img = new Image($_value->thumbnail);
                $_img->thumb(220,220);
                $_img->out('220x220');
                $_value->thumbnail2 = $_img->getPath();
                parent::update(array("id='$_value->id'"), array('thumbnail2'=>$_img->getPath()));
            }
        }



        return $_allGoods;
    }

///////////////////////////////////////////////////////
    public function total() {
        if (Validate::isNullString($this->_R['navid'])) {
            return parent::total();
        } else {
            return parent::total(array('where'=>array('nav in ('.$this->getNavId().')')));
        }
    }

    private function getNavId() {
        $this->_tables = array(DB_FREFIX.'nav');
        $_idArr = parent::select(array('id'), array('where'=>array("sid='{$this->_R['navid']}'")));
        $_id = '';
        if (Validate::isNullArray($_idArr)) {
            $_id = $this->_R['navid'];
        } else {
            foreach ($_idArr as $_value) {
                $_id .= $_value->id.',';
            }
            $_id = substr($_id, 0, -1);
        }
        $this->_tables = array(DB_FREFIX.'goods');
        return $_id;
    }
//////////////////////////////
    public function number(){





    }

//////////////////////////////
    public function navSort() {
        $_getNavId = $this->getNavId();
        $_sortGoods = parent::select(array('id','nav','name','price_sale','thumbnail2'),
            array('limit'=>'0,5','where'=>array("nav in ($_getNavId) AND is_up=1"),'order'=>'sales DESC'));
        return $_sortGoods;
    }



    public function setInventory() {
        $_goods = array();
        foreach ($_COOKIE['cart'] as $_key=>$_value) {
            $_temp = unserialize(stripslashes($_value));
            $_goods[$_key] = null;
            $_goods[$_key]->num = $_temp['num'];
        }
        foreach ($_goods as $_key=>$_value) {
            $_where = array("id='{$_key}'");
            parent::update($_where, array('inventory'=>array('inventory-'.$_value->num), 'sales'=>array('sales+'.$_value->num)));
        }
    }




    public function add() {
        $_where = array("sn='{$this->_R['sn']}'");
        if (!$this->_check->addCheck($this, $_where)) $this->_check->error();
        $_addData = $this->getRequest()->filter($this->_fields);
        $_addData['date'] = Tool::getDate();
        $_attr = '';
        foreach ($_addData['attr'] as $_key=>$_value) {
            $_attr .= $_key.':';
            foreach ($_value as $_v) {
                $_attr .= $_v.'|';
            }
            $_attr = substr($_attr, 0, -1).';';
        }
        $_attr = substr($_attr, 0, -1);
        $_addData['attr'] = $_attr;
        return parent::add($_addData);
    }


    public function update() {
        $_where = array("id='{$this->_R['id']}'");
        if (!$this->_check->oneCheck($this, $_where)) $this->_check->error();
        if (!$this->_check->updateCheck($this, array("id<>'{$this->_R['id']}'","sn='{$this->_R['sn']}'"))) $this->_check->error();
        $_updateData = $this->getRequest()->filter($this->_fields);
        $_updateData['thumbnail2'] = '';
        $_attr = '';
        foreach ($_updateData['attr'] as $_key=>$_value) {
            $_attr .= $_key.':';
            foreach ($_value as $_v) {
                $_attr .= $_v.'|';
            }
            $_attr = substr($_attr, 0, -1).';';
        }
        $_attr = substr($_attr, 0, -1);
        $_updateData['attr'] = $_attr;
        return parent::update($_where, $_updateData);
    }

    public function delete() {
        $_where = array("id='{$this->_R['id']}'");
        return parent::delete($_where);
    }

    public function isSn() {
        $_where = array("sn='{$this->_R['sn']}'");
        $this->_check->ajax($this, $_where);
    }

    public function isUpdateSn() {
        $_where = array("id<>'{$this->_R['id']}'","sn='{$this->_R['sn']}'");
        $this->_check->ajax($this, $_where);
    }

    public function isUp() {
        if (!Validate::isNullString($this->_R['id']) && !Validate::isNullString($this->_R['act'])) {
            if ($this->_R['act'] == 'up') {
                return parent::update(array("id='{$this->_R['id']}'"), array('is_up'=>'1'));
            } elseif ($this->_R['act'] == 'down') {
                return parent::update(array("id='{$this->_R['id']}'"), array('is_up'=>'0'));
            }
        }
    }







    public function collectGoods() {
        $this->_tables = array(DB_FREFIX.'collect');
        $_collectId = parent::select(array('goods_id'),
            array('where'=>array("user='{$_COOKIE['user']}'"),'order'=>'date DESC'));
        $_collectStr = '';

        foreach ($_collectId as $_key=>$_value) {
            $_collectStr .= $_value->goods_id.',';
        }

        $_collectStr = substr($_collectStr, 0, -1);

        if (strlen($_collectStr) == 0) {
            $this->_tables = array(DB_FREFIX.'goods');
            return null;
        }

        $this->_tables = array(DB_FREFIX.'goods a');
        $_collectGoods = parent::select(array('id','nav','name','price_sale','price_market','thumbnail','thumbnail2','unit','sales','(SELECT COUNT(*) FROM mall_commend b WHERE flag=0 AND b.goods_id=a.id) AS count'),
            array('limit'=>$this->_limit,'where'=>array("id in ($_collectStr)")));


        $this->_tables = array(DB_FREFIX.'goods');

        return $_collectGoods;
    }

    public function salesGoods() {
        $this->_tables = array(DB_FREFIX.'goods a');
        $_salesGoods = parent::select(array('commendnum','id','nav','name','price_sale','thumbnail2','price_market','sales','(SELECT COUNT(*) FROM mall_commend b WHERE flag=0 AND b.goods_id=a.id) AS count'),
            array('limit'=>'0,5','where'=>array("is_up=1"),'order'=>'sales DESC'));
        $this->_tables = array(DB_FREFIX.'goods');
        return $_salesGoods;
    }


    public function inventoryGoodsCount() {
        $_inventoryGoodsCount = parent::select(array('COUNT(*) AS count'),
            array('where'=>array("inventory<=warn_inventory")));
        return $_inventoryGoodsCount[0]->count;
    }


    public function downGoodsCount() {
        $_downGoodsCount = parent::select(array('COUNT(*) AS count'),
            array('where'=>array("is_up=0")));
        return $_downGoodsCount[0]->count;
    }

    public function allGoodsCount() {
        $_allGoodsCount = parent::select(array('COUNT(*) AS count'));
        return $_allGoodsCount[0]->count;
    }
    ///////////
//   private function getNavId() {
//   $_idArr = parent::select(array('id'), array('where'=>array("sid='{$this->_R['navid']}'")));
//        $_id = array();
//        if (Validate::isNullArray($_idArr)) {
//            $_id[] = $this->_R['navid'];
//        } else {
//            foreach ($_idArr as $_value) {
//                $_id[] = $_value->id;
//            }
//        }
//        return $_id;
//    }



}
?>