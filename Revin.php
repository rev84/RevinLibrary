<?php

Class Revin{
	/*************************************************************************
	 *	改行を\nに統一
	 *	
	 *	[in]
	 *	string	改行を統一したい文字列
	 *	
	 *	[out]
	 *	string	改行が統一された文字列
	 *************************************************************************/
	public static function NormalizeLine($buf){
		$buf = str_replace("\r\n", "\n", $buf);
		$buf = str_replace("\r", "\n", $buf);
		
		return $buf;
	}

	/*************************************************************************
	 *	Tinyurlで短縮されたURLを取得
	 *	
	 *	[in]
	 *	string	URL
	 *	
	 *	[out]
	 *	string	短縮されたURL
	 *************************************************************************/
	public static function GetTinyurl($url){
		return file_get_contents('http://tinyurl.com/api-create.php?url='.$url);
	}
	
	/*************************************************************************
	 *	var_dumpの内容をファイルに書き出し
	 *	
	 *	[in]
	 *	mixed	var_dumpしたい変数
	 *	string	保存したいファイルのパス（デフォルト：var_dump.txt）
	 *	
	 *	[out]
	 *	boolean	true
	 *************************************************************************/
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
	
	/*************************************************************************
	 *	与えられた配列のパーミテーションを全パターン返す
	 *	組み合わせ数が多いと死ぬ
	 *	
	 *	[in]
	 *	array	組み合わせを列挙したい配列
	 *	int		選ぶ数
	 *	
	 *	[out]
	 *	array	パーミテーションの全パターン
	 *************************************************************************/
	public static function GetPermutationPattern($array, $r){
		$getPatternFunc = function($array, $r, $all, $m) use(&$getPatternFunc){
			if(count($m) == $r){
				$all[implode("\t", $m)] = true;
				return $all;
			}
			else{
				for($i = 0; $i < count($array); $i++){
					echo implode("\t", $m)."\n";
					if(in_array($i, $m)) continue;
					$temp = $m;
					$temp[] = $i;
					$all = $getPatternFunc($array, $r, $all, $temp);
				}
			}
			
			return $all;
		};
		
		$allPattern = $getPatternFunc($array, $r, array(), array());
		
		$results = array();
		foreach($allPattern as $key => $val){
			$results[] = explode("\t", $key);
		}
		
		return $results;
	}

	/*************************************************************************
	 *	与えられた配列のコンビネーションを全パターン返す
	 *	組み合わせ数が多いと死ぬ
	 *	
	 *	[in]
	 *	array	組み合わせを列挙したい配列
	 *	int		選ぶ数
	 *	
	 *	[out]
	 *	mixed	コンビネーションの全パターン
	 *************************************************************************/
	public static function GetCombinationPattern($array, $r){
		$getPatternFunc = function($array, $r, $all, $m) use(&$getPatternFunc){
			if(count($m) == $r){
				sort($m);
				$all[implode("\t", $m)] = true;
				return $all;
			}
			else{
				for($i = 0; $i < count($array); $i++){
					echo implode("\t", $m)."\n";
					if(in_array($i, $m)) continue;
					$temp = $m;
					$temp[] = $i;
					$all = $getPatternFunc($array, $r, $all, $temp);
				}
			}
			
			return $all;
		};
		
		$allPattern = $getPatternFunc($array, $r, array(), array());
		
		$results = array();
		foreach($allPattern as $key => $val){
			$results[] = explode("\t", $key);
		}
		
		return $results;
	}
}
?>