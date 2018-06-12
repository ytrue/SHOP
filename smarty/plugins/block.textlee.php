<?php
function smarty_block_textlee($_arr, $_content) {
		if ($_arr['bold']) {
			$_content = "<span style='color:{$_arr['color']};font-size:{$_arr['fontsize']};font-weight:bold;'>$_content</span>";
		} else {
			$_content = "<span style='color:{$_arr['color']};font-size:{$_arr['fontsize']};'>$_content</span>";
		}
		return $_content;	
}
?>