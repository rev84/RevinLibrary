window.tests =
  numFormat : [1000, 500, 1234567890, -123456789]
  rand : [[1,10], [1, 100], [5, 30], [-5, 5]]
  adrBar : ['/=====', 'yeah', 'test.js']
  getDateStr:[
    ['null', null]
    ['new Date(0)', new Date(0)]
    ['new Date(1000000)', new Date(1000000), '/']
  ]
  getDatetimeStr:[
    ['null', null]
    ['new Date(0)', new Date(0), '/']
    ['new Date(1000000)', new Date(1000000), '', '', '']
  ]
  normalize:[
    [0.3]
    [6.2]
    [Math.sin(Math.PI), -Math.PI, Math.PI]
    [-Math.random(), Math.random()/2, 0.5+Math.random()/2]
    [3489, 0, 100]
  ]
  zerofill:[
    [1, 5]
    [100, 4]
    [100, 10]
  ]
  time:[
    null
  ]
  militime:[
    null
  ]
  inArray : [
    [1, [1,2,3,4,5]]
    ['a', [1,2,3,4,5,'a']]
    ['b', [1,2,3,4,5,'a']]
    [1, []]
    [null, [0,1,2,3]]
  ]
  clone : [
    [1,2,3,4,5]
  ]
  shuffle : [
    [1, 2, 3, 4, 5]
    ['a', 'b', 'c', 'd', 'e']
    [1,1,1,2,3]
  ]
  arrayFill:[
    [3, true]
    [5, false]
  ]
  array2dFill:[
    [3,4,1]
    [5,10,false]
    [3,null,0]
  ]
  count:[
    ['{a:"a", b:"b"}', {a:"a", b:"b"}]
    ['{a:"a", b:"b", c:"c"}', {a:"a", b:"b", c:"c"}]
    ['{}', {}]
  ]
  uuid:[null]

class UtlTest
  @rand:(before)->
    [min, max] = before
    after = []
    for i in [0...10]
      after.push(Utl.rand min, max)
    ['min = '+min+'<br>max = '+max, after.join(', ')]
  @adrBar:(before)->
    [before, '<button onclick="Utl.adrBar(\''+before+'\')">変更</button>'+'<button onclick="Utl.adrBar(\'/RevinLibrary/test/\')">戻す</button>']
  @normalize:(before)->
    [num, min, max] = before
    ['num = '+num+'<br>min = '+min+'<br>max = '+max, Utl.normalize(num, min, max)]
  @zerofill:(before)->
    [num, digit] = before
    ['num = '+num+'<br>digit = '+digit, Utl.zerofill(num, digit)]
  @repeat:(before)->
    [str, times] = before
    ['str = '+str+'<br>times = '+times, Utl.repeat(str, times)]

  @getDateStr:(before)->
    [beforeStr, before, dateSep] = before
    [beforeStr, Utl.getDateStr(before, dateSep)]
  @getDatetimeStr:(before)->
    [beforeStr, before, dateSep, timeSep, betweenSep] = before
    ['date = '+beforeStr+'<br>'+'dateSep = '+dateSep+'<br>timeSep = '+timeSep+'<br>betweenSep = '+betweenSep, Utl.getDatetimeStr(before, dateSep, timeSep, betweenSep)]

  @inArray:(ary)->
    [needle, array] = ary
    ['needle = '+needle+'<br>array = '+'['+array.toString()+']', if Utl.inArray(needle, array) then 'true' else 'false']
  @clone:(before)->
    ['['+before.toString()+']', '['+Utl.clone(before).toString()+']']
  @shuffle:(before)->
    ['['+before.toString()+']', '['+Utl.shuffle(before).toString()+']']
  @arrayFill:(before)->
    [length, value] = before
    ['length = '+length+'<br>value = '+value, '['+Utl.arrayFill(length, value).toString()+']']
  @array2dFill:(before)->
    [x, y, value] = before
    res = Utl.array2dFill(x, y, value)
    resView = "[<br>\n"
    resView += '&nbsp;&nbsp;&nbsp;['+v.toString()+"]<br>\n" for v in res
    resView += "]\n"
    ['x = '+x+'<br>y = '+y+'<br>value = '+value, resView]
  @count:(before)->
    [beforeStr, before] = before
    [beforeStr, Utl.count before]
  @uuid:(before)->
    after = []
    for i in [0...10]
      after.push Utl.uuid()
    ['', after.join('<br>')]


$().ready ->
  for funcName, cases of window.tests
    funcFullName = 'Utl.'+funcName
    caseDiv = $('<div>').attr('id', funcFullName).append(
      $('<h1>').attr('name', funcFullName).html(funcFullName)
    )
    $('#index ul').append(
      $('<li>').html '<a href="#'+funcFullName+'">'+funcFullName+'</a>'
    )
    for c in cases
      if UtlTest[funcName]?
        [before, after] = UtlTest[funcName](c)
      else
        before = c
        after  = Utl[funcName](before)

      caseDiv.append(
        $('<div>').addClass('case').append(
          $('<div>').addClass('before').html(before)
        ).append(
          $('<div>').addClass('after').html(after)
        )
      )
    $('#tests').append caseDiv