<?php
//专用用于调用的Action
class CallAction extends Action {

	public function __construct() {
		parent::__construct();
	}
	
	//初始页面
	public function index() {
		$this->_redirect->succ('./');
	}
	
	//上传产品图片upfile
	public function upFile() {
		$this->_tpl->display(SMARTY_ADMIN.'public/upfile.tpl');
	}
	
	//处理上传图片
	public function upLoad() {
		if (isset($_POST['send'])) { 
			$_fileupload = new FileUpload('pic',$_POST['MAX_FILE_SIZE']);
			$_path = $_fileupload->getPath();
			$_img = new Image($_path);
			$_img->thumb(300,300);	
			$_img->out();
			$_fileupload->alertOpenerClose('图片上传成功！','.'.$_path);
		} else {
			exit('警告：文件过大或者其他未知错误导致浏览器崩溃！');
		}
	}
	
	//cke编辑器专用上传
	public function ckeUp() {
		if (isset($_GET['type'])) {
			//查看了源代码，他的名称是：upload
			$_fileupload = new FileUpload('upload',$_POST['MAX_FILE_SIZE']);
			$_ckefn = $_GET['CKEditorFuncNum'];
			$_path = $_fileupload->getPath();
			$_img = new Image($_path);
			$_img->ckeImg(650,0);
			$_img->out();
			echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($_ckefn,\".$_path\",'图片上传成功！');</script>";
			exit();
		} else {
			Tool::alertBack('警告：由于非法操作导致上传失败！');
		}
	}
	
	//验证码
	public function validateCode() {
		$_vc = new ValidateCode();
		$_vc->doimg();
		$_SESSION['code'] = $_vc->getCode();
	}
}
?>