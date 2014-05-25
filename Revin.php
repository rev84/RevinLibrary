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
	
	// var_dumpの内容をファイルに書きだす
	public static function var_dump_file($var, $filename = './var_dump.txt'){
		if(file_exists($filename)){
			unlink($filename);
		}
		ob_start();
		var_dump($var);
		$out = ob_get_contents();
		ob_end_clean();
		file_put_contents($filename, $out, FILE_APPEND);

		return true;
	}
}
?>