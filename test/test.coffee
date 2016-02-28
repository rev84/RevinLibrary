window.tests = 
  addComma : [1000, 500, 1234567890, -123456789]
  rand : [[1,10], [1, 100], [5, 30], [-5, 5]]
  addressBar : ['./=====', 'yeah']

class Test
  @rand:(before)->
    [min, max] = before
    after = []
    for i in [0...10]
      after.push(Utility.rand min, max)
    ['min:'+min+', max:'+max, after.join(', ')]
  @addressBar:(before)->
    [before, '<button onclick="Utility.addressBar('+before+')">変更</button>'+'<button onclick="Utility.addressBar(\'./\')">戻す</button>']

$().ready ->
  for funcName, cases of window.tests
    caseDiv = $('<div>').attr('id', funcName).append(
      $('<h1>').attr('name', funcName).html(funcName)
    )
    $('#index ul').append(
      $('<li>').html '<a href="#'+funcName+'">'+funcName+'</a>'
    )
    for c in cases
      if Test[funcName]?
        [before, after] = Test[funcName](c)
      else
        before = c
        after  = Utility[funcName](before)

      caseDiv.append(
        $('<div>').addClass('case').append(
          $('<span>').addClass('before').html(before)
        ).append(
          $('<div>').addClass('after').html(after)
        )
      )
    $('#tests').append caseDiv