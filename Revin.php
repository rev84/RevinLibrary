<?php

Class Revin{
	// 改行を統一
	public static function NormalizeLine($buf){
		$buf = str_replace("\r\n", "\n", $buf);
		$buf = str_replace("\r", "\n", $buf);
		
		return $buf
	}
}



?>