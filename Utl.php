<?php

Class Utl
{
	/*************************************************************************
	 *	改行を\nに統一
	 *	
	 *	[in]
	 *	string	改行を統一したい文字列
	 *	
	 *	[out]
	 *	string	改行が統一された文字列
	 *************************************************************************/
	public static function normalizeLine($buf){
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
	public static function getTinyurl($url){
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
	public static function getPermutationPattern($array, $r){
		$all = array();
		
		$getPatternFunc = function($m) use($array, $r, &$getPatternFunc, &$all){
			if(count($m) == $r){
				$all[implode("\t", $m)] = true;
			}
			else{
				for($i = 0; $i < count($array); $i++){
					if(in_array($i, $m)) continue;
					$temp = $m;
					$temp[] = $i;
					$getPatternFunc($temp);
				}
			}
		};
		
		$getPatternFunc(array());
		
		$results = array();
		foreach($all as $key => $val){
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
	public static function getCombinationPattern($array, $r){
		$all = array();
		
		$getPatternFunc = function($m) use($array, $r, &$getPatternFunc, &$all){
			if(count($m) == $r){
				sort($m);
				$all[implode("\t", $m)] = true;
			}
			else{
				for($i = 0; $i < count($array); $i++){
					if(in_array($i, $m)) continue;
					$temp = $m;
					$temp[] = $i;
					$getPatternFunc($temp);
				}
			}
		};
		
		$getPatternFunc(array());
		
		$results = array();
		foreach($all as $key => $val){
			$results[] = explode("\t", $key);
		}
		
		return $results;
	}
	
	/*************************************************************************
	 *	特定ディレクトリ内のファイルの一覧を取得
	 *	. と .. は無視する
	 *	
	 *	[in]
	 *	dir			ディレクトリ名
	 *	isDirOnly	trueならディレクトリのみを取る。falseならファイルのみを取る
	 *	
	 *	[out]
	 *	mixed	コンビネーションの全パターン
	 *************************************************************************/
	public static function getListInDir($dir, $isDirOnly = false){
		if($handle = opendir($dir)){
			$files = array();
			while(false !== ($entry = readdir($handle))){
				if(($entry != '.' && $entry != '..') && (is_dir($entry) xor !$isDirOnly)){
					$files[] = $entry;
				}
			}
			
			return $files;
		}
		
		return false;
  }

  public static function average(array $input)
  {

  	return count($input) > 0 ? array_sum($input) / count($input) : null;
  }

	public static function variance(array $input)
	{
		if (count($input) <= 0) {
			return null;
		}

		$v = 0;
		$cnt = count($input);
		$avg = self::average($input);
		foreach ($input as $in) {
			$v += ($in - $avg)**2;
		}

		return $v / $cnt;
	}

	public static function standard_deviation(array $input)
	{
		if (count($input) <= 0) {
			return null;
		}
		return sqrt(self::variance($input));
	}
}

