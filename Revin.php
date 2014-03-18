<?php

Class Revin{
	// 改行を統一
	public static function NormalizeLine($buf){
		$buf = str_replace("\r\n", "\n", $buf);
		$buf = str_replace("\r", "\n", $buf);
		
		return $buf;
	}


	// tinyurlで短縮URLを取得
	public static function GetTinyurl($url){
		return file_get_contents('http://tinyurl.com/api-create.php?url='.$url);
	}
}
?>