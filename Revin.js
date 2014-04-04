var Revin = function(){
  // 数値にコンマをつける
  this.Separate = function(num){
    return String(num).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  };
};
