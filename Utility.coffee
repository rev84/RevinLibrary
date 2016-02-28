class Utility
  ############################################
  # 
  # 数値にカンマを入れる
  # @param Number num
  # @return String 
  # 
  ############################################
  @addComma:(num)->
    String(num).replace /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'

  ############################################
  # 
  # min <= n <= max の整数乱数を生成
  # @param Number min
  # @param Number max
  # @return String 
  # 
  ############################################
  @rand:(min, max)->
    Math.floor(Math.random() * (max - min + 1)) + min


  ############################################
  # 
  # アドレスバーを変更
  # @param String url
  # @return String 
  # 
  ############################################
  @addressBar:(url)->
    window.history.replaceState '','',''+url
