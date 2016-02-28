window.tests =
  Utl :
    numFormat : [1000, 500, 1234567890, -123456789]
    rand : [[1,10], [1, 100], [5, 30], [-5, 5]]
    adrBar : ['/=====', 'yeah', 'test.js']
    getDateStr:[
      ['null', null]
      ['new Date(0)', new Date(0)]
    ]
    getDatetimeStr:[
      ['null', null]
      ['new Date(0)', new Date(0)]
    ]
    zerofill:[
      [1, 5]
      [100, 4]
      [100, 10]
    ]
    time:[
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

class UtlTest
  @rand:(before)->
    [min, max] = before
    after = []
    for i in [0...10]
      after.push(Utl.rand min, max)
    ['min:'+min+', max:'+max, after.join(', ')]
  @adrBar:(before)->
    [before, '<button onclick="Utl.adrBar(\''+before+'\')">変更</button>'+'<button onclick="Utl.adrBar(\'RevinLibrary/test/\')">戻す</button>']
  @zerofill:(before)->
    [num, digit] = before
    ['num:'+num+', digit:'+digit, Utl.zerofill(num, digit)]
  @repeat:(before)->
    [str, times] = before
    ['str:'+str+', times:'+times, Utl.repeat(str, times)]

  @getDateStr:(before)->
    [beforeStr, before] = before
    [beforeStr, Utl.getDateStr before]
  @getDatetimeStr:(before)->
    [beforeStr, before] = before
    [beforeStr, Utl.getDatetimeStr before]

  @inArray:(ary)->
    [needle, array] = ary
    ['needle: '+needle+', array:'+'['+array.toString()+']', if Utl.inArray(needle, array) then 'true' else 'false']
  @clone:(before)->
    ['['+before.toString()+']', '['+Utl.clone(before).toString()+']']
  @shuffle:(before)->
    ['['+before.toString()+']', '['+Utl.shuffle(before).toString()+']']

$().ready ->
  for className, funcs of window.tests
    for funcName, cases of funcs
      funcFullName = className+'.'+funcName
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
            $('<span>').addClass('before').html(before)
          ).append(
            $('<div>').addClass('after').html(after)
          )
        )
      $('#tests').append caseDiv