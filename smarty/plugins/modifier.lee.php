<?php
function smarty_modifier_lee($_str,$_length,$_encoding)
{
	if (mb_strlen($_str) > $_length) {
    	return mb_substr($_str,0,$_length,$_encoding).'...';
	} else {
		return mb_substr($_str,0,$_length,$_encoding);
	}
}
?>