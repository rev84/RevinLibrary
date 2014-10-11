var Revin = function(){
	// 数値にコンマをつける
	this.Separate = function(num){
		return String(num).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
	};
	// 乱数を生成
	this.GetRandomInt	= function(min, max){
		Math.round();
		return Math.floor(Math.random() * (max - min + 1)) + min;
	};
};
