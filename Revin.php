<?php

Class Revin{
	// ‰üs‚ð“ˆê
	public static function NormalizeLine($buf){
		$buf = str_replace("\r\n", "\n", $buf);
		$buf = str_replace("\r", "\n", $buf);
		
		return $buf
	}
}



?>