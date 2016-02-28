// Generated by CoffeeScript 1.10.0
var Test;

window.tests = {
  addComma: [1000, 500, 1234567890, -123456789],
  rand: [[1, 10], [1, 100], [5, 30], [-5, 5]],
  addressBar: ['./=====', 'yeah']
};

Test = (function() {
  function Test() {}

  Test.rand = function(before) {
    var after, i, j, max, min;
    min = before[0], max = before[1];
    after = [];
    for (i = j = 0; j < 10; i = ++j) {
      after.push(Utility.rand(min, max));
    }
    return ['min:' + min + ', max:' + max, after.join(', ')];
  };

  Test.addressBar = function(before) {
    return [before, '<button onclick="Utility.addressBar(\'' + before + '\')">変更</button>' + '<button onclick="Utility.addressBar(\'./\')">戻す</button>'];
  };

  return Test;

})();

$().ready(function() {
  var after, before, c, caseDiv, cases, funcName, j, len, ref, ref1, results;
  ref = window.tests;
  results = [];
  for (funcName in ref) {
    cases = ref[funcName];
    caseDiv = $('<div>').attr('id', funcName).append($('<h1>').attr('name', funcName).html(funcName));
    $('#index ul').append($('<li>').html('<a href="#' + funcName + '">' + funcName + '</a>'));
    for (j = 0, len = cases.length; j < len; j++) {
      c = cases[j];
      if (Test[funcName] != null) {
        ref1 = Test[funcName](c), before = ref1[0], after = ref1[1];
      } else {
        before = c;
        after = Utility[funcName](before);
      }
      caseDiv.append($('<div>').addClass('case').append($('<span>').addClass('before').html(before)).append($('<div>').addClass('after').html(after)));
    }
    results.push($('#tests').append(caseDiv));
  }
  return results;
});
