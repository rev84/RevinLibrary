class Utl
  ############################################
  # 
  # 数値にカンマを入れる
  # @param Number num
  # @return String 
  # 
  ############################################
  @numFormat:(num)->
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
  @adrBar:(url)->
    window.history.replaceState '','',''+url


  ############################################
  # 
  # 現在秒を取得
  # @return int
  # 
  ############################################
  @time:->
    Math.floor(+new Date()/1000)


  ############################################
  # 
  # 現在日を YYYY/MM/DD で取得
  # @param Date date
  # @return String
  # 
  ############################################
  @getDateStr:(date = null)->
    date = new Date() if date is null
    ''+@zerofill(date.getFullYear(), 4)+'/'+@zerofill(date.getMonth()+1, 2)+'/'+@zerofill(date.getDate(), 2)


  ############################################
  # 
  # 現在日時を YYYY/MM/DD HH:ii:ssで取得
  # @param Date date
  # @return String
  # 
  ############################################
  @getDatetimeStr:(date = null)->
    date = new Date() if date is null
    @getDateStr(date)+' '+
    @zerofill(date.getHours(), 2)+':'+@zerofill(date.getMinutes(), 2)+':'+@zerofill(date.getSeconds(), 2)


  ############################################
  # 
  # 数値をゼロ埋めする
  # @param int num
  # @param int digit 桁数
  # @return int
  # 
  ############################################
  @zerofill:(num, digit)->
    (''+@repeat('0', digit)+num).slice -digit


  ############################################
  # 
  # str を times 回繰り返した文字列を返す
  # @param String str
  # @param int times
  # @return String
  # 
  ############################################
  @repeat:(str, times)->
    Array(1+times).join str


  ############################################
  # 
  # 配列をシャッフル
  # @param Array ary シャッフルする配列
  # @return Array
  # 
  ############################################
  @shuffle:(ary)->
    n = ary.length
    while n
      n--
      i = @rand 0, n
      [ary[i], ary[n]] = [ary[n], ary[i]]
    ary

  ############################################
  # 
  # 配列 ary に needle が存在するかを調べる
  # @param mixed needle 値
  # @param Array ary
  # @return boolean 存在する場合はtrue, そうでないなら false
  # 
  ############################################
  @inArray:(needle, ary)->
    for v in ary
      return true if v is needle
    false

  ############################################
  # 
  # 配列のコピーを返す
  # @param Array ary
  # @return Array
  # 
  ############################################
  @clone:(ary)->
    res = []
    for v, k in ary
      res[k] = v
    res