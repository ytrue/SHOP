<?php
//上传文件类
class FileUpload {
	private $error;			//错误代码
	private $maxsize;		//表单最大值
	private $type;				//类型
	private $typeArr = array('image/jpeg','image/pjpeg','image/png','image/x-png','image/gif');		//类型合集
	private $path;				//目录路径
	private $today;			//今天目录
	private $name;			//文件名
	private $tmp;				//临时文件
	private $linkpath;		//链接路径
	private $linktotay;		//今天目录（相对）
	
	//构造方法，初始化
	public function __construct($_file,$_maxsize) {
		$this->error = $_FILES[$_file]['error'];
		$this->maxsize = $_maxsize / 1024;
		$this->type = $_FILES[$_file]['type'];
		$this->path = ROOT_PATH.'/'.UPDIR;
		$this->linktotay = date('Ymd').'/';
		$this->today = $this->path.$this->linktotay;
		$this->name = $_FILES[$_file]['name'];
		$this->tmp = $_FILES[$_file]['tmp_name'];
		$this->checkError();
		$this->checkType();
		$this->checkPath();
		$this->moveUpload();
	}
	
	//返回路径
	public function getPath() {
		$_path = $_SERVER["SCRIPT_NAME"];
		$_dir = dirname(dirname($_path));
		if ($_dir == '\\') $_dir = '/';
		$this->linkpath = $_dir.$this->linkpath;
		return $this->linkpath;
	}
	
	//移动文件
	private function moveUpload() {
		if (is_uploaded_file($this->tmp)) {
			if (!move_uploaded_file($this->tmp,$this->setNewName())) {
                exit('警告：上传失败！');
			}
		} else {
            exit('警告：临时文件不存在！');
		}
	}
	
	//设置新文件名
	private function setNewName() {
		$_nameArr = explode('.',$this->name);
		$_postfix = $_nameArr[count($_nameArr)-1];
		$_newname = date('YmdHis').mt_rand(100,1000).'.'.$_postfix;
		$this->linkpath = UPDIR.$this->linktotay.$_newname;
		return $this->today.$_newname;
	}
	
	//验证目录
	private function checkPath() {
		if (!is_dir($this->path) || !is_writeable($this->path)) {
			if (!mkdir($this->path)) {
                exit('警告：主目录创建失败！');
			}
		}
		if (!is_dir($this->today) || !is_writeable($this->today)) {
			if (!mkdir($this->today)) {
				exit('警告：子目录创建失败！');
			}
		}
	}
	
	//验证类型
	private function checkType() {
		if (!in_array($this->type,$this->typeArr)) {
            exit('警告：不合法的上传类型！');
		}
	}
	
	//验证错误
	private function checkError() {
		if (!empty($this->error)) {
			switch ($this->error) {
				case 1 :
                    exit('警告：上传值超过了约定最大值！');
					break;
				case 2 :
                    exit('警告：上传值超过了'.$this->maxsize.'KB！');
					break;
				case 3 :
                    exit('警告：只有部分文件被上传！');
					break;
				case 4 :
                    exit('警告：没有任何文件被上传！');
					break;
				default:
                    exit('警告：未知错误！');
			}
		}
	}
	
	//弹窗赋值关闭(上传专用)
	public function alertOpenerClose($_info,$_path) {
		echo <<<END
					<script type='text/javascript'>
						alert('$_info');
						var a = opener.document.add || opener.document.update;
						a.thumbnail.value='$_path';
						a.pic.style.display='block';
						a.pic.src='$_path';
						window.close();
					</script>
END;
		exit();
	}
}
?>