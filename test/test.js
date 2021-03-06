// Generated by CoffeeScript 1.10.0
var UtlTest;

window.tests = {
  numFormat: [1000, 500, 1234567890, -123456789],
  rand: [[1, 10], [1, 100], [5, 30], [-5, 5]],
  adrBar: ['/=====', 'yeah', 'test.js'],
  dateStr: [[null], [new Date(0)], [new Date(1000000000000), '/']],
  datetimeStr: [[null], [new Date(0), '/'], [new Date(1000000000000), '', '', '']],
  normalize: [[0.3], [6.2], [Math.sin(Math.PI), -Math.PI, Math.PI], [-Math.random(), Math.random() / 2, 0.5 + Math.random() / 2], [3489, 0, 100]],
  zerofill: [[1, 5], [100, 4], [100, 10]],
  time: [void 0, new Date(), new Date(1000000000000)],
  militime: [['undefined', void 0], ['new Date()', new Date()], ['new Date(1000000000000)', new Date(1000000000000)], ['new Date()', new Date(), true], ['new Date()', new Date(), false]],
  difftime: [[new Date()], [new Date(1000000000000)], [new Date(1000000000000), new Date(Utl.militime() - 10)], [new Date(Utl.militime() - 10), void 0, 60], [new Date(Utl.militime() - 10), void 0, 60, '直前'], [new Date(Utl.militime() - 10), void 0, void 0, void 0, ' ago', 's', 'm', 'h', 'd', 'mo', 'yr'], [new Date(Utl.militime() - (1000 * (60 + 10))), void 0, void 0, void 0, ' ago', 's', 'm', 'h', 'd', 'mo', 'yr'], [new Date(Utl.militime() - (1000 * (60 * 60 + 10))), void 0, void 0, void 0, ' ago', 's', 'm', 'h', 'd', 'mo', 'yr'], [new Date(Utl.militime() - (1000 * (60 * 60 * 24 + 10))), void 0, void 0, void 0, ' ago', 's', 'm', 'h', 'd', 'mo', 'yr'], [new Date(Utl.militime() - (1000 * (60 * 60 * 24 * 30 + 10))), void 0, void 0, void 0, ' ago', 's', 'm', 'h', 'd', 'mo', 'yr'], [new Date(Utl.militime() - (1000 * (60 * 60 * 24 * 30 * 12 + 10))), void 0, void 0, void 0, ' ago', 's', 'm', 'h', 'd', 'mo', 'yr']],
  inArray: [[1, [1, 2, 3, 4, 5]], ['a', [1, 2, 3, 4, 5, 'a']], ['b', [1, 2, 3, 4, 5, 'a']], [1, []], [null, [0, 1, 2, 3]]],
  clone: [[1, 2, 3, 4, 5]],
  shuffle: [[1, 2, 3, 4, 5], ['a', 'b', 'c', 'd', 'e'], [1, 1, 1, 2, 3]],
  arrayFill: [[3, true], [5, false]],
  array2dFill: [[3, 4, 1], [5, 10, false], [3, null, 0]],
  count: [
    [
      '{a:"a", b:"b"}', {
        a: "a",
        b: "b"
      }
    ], [
      '{a:"a", b:"b", c:"c"}', {
        a: "a",
        b: "b",
        c: "c"
      }
    ], ['{}', {}]
  ],
  uuid4: [null]
};

UtlTest = (function() {
  function UtlTest() {}

  UtlTest.rand = function(before) {
    var after, i, j, max, min;
    min = before[0], max = before[1];
    after = [];
    for (i = j = 0; j < 10; i = ++j) {
      after.push(Utl.rand(min, max));
    }
    return ['min = ' + min + '<br>max = ' + max, after.join(', ')];
  };

  UtlTest.adrBar = function(before) {
    return [before, '<button onclick="Utl.adrBar(\'' + before + '\')">変更</button>' + '<button onclick="Utl.adrBar(\'/RevinLibrary/test/\')">戻す</button>'];
  };

  UtlTest.normalize = function(before) {
    var max, min, num;
    num = before[0], min = before[1], max = before[2];
    return ['num = ' + num + '<br>min = ' + min + '<br>max = ' + max, Utl.normalize(num, min, max)];
  };

  UtlTest.zerofill = function(before) {
    var digit, num;
    num = before[0], digit = before[1];
    return ['num = ' + num + '<br>digit = ' + digit, Utl.zerofill(num, digit)];
  };

  UtlTest.repeat = function(before) {
    var str, times;
    str = before[0], times = before[1];
    return ['str = ' + str + '<br>times = ' + times, Utl.repeat(str, times)];
  };

  UtlTest.time = function(before) {
    var beforeStr;
    beforeStr = before != null ? 'new Date(' + Math.floor(Utl.militime(before, true)) + ')' : 'undefined';
    return ['date = ' + beforeStr, Utl.time(before)];
  };

  UtlTest.militime = function(before) {
    var date, dateStr, getAsFloat;
    dateStr = before[0], date = before[1], getAsFloat = before[2];
    return ['date = ' + dateStr + '<br>' + 'getAsFloat = ' + getAsFloat, Utl.militime(date, getAsFloat)];
  };

  UtlTest.dateStr = function(before) {
    var beforeStr, dateSep, ref;
    ref = before, before = ref[0], dateSep = ref[1];
    beforeStr = before != null ? 'new Date(' + Utl.militime(before) + ')' : 'undefined';
    return ['date = ' + beforeStr + '<br>' + 'dateSep = ' + dateSep, Utl.dateStr(before, dateSep)];
  };

  UtlTest.datetimeStr = function(before) {
    var beforeStr, betweenSep, dateSep, ref, timeSep;
    ref = before, before = ref[0], dateSep = ref[1], timeSep = ref[2], betweenSep = ref[3];
    beforeStr = before != null ? 'new Date(' + Utl.militime(before) + ')' : 'undefined';
    return ['date = ' + beforeStr + '<br>' + 'dateSep = ' + dateSep + '<br>timeSep = ' + timeSep + '<br>betweenSep = ' + betweenSep, Utl.datetimeStr(before, dateSep, timeSep, betweenSep)];
  };

  UtlTest.difftime = function(before) {
    var agoStr, baseDate, baseDateStr, beforeStr, dayStr, hourStr, minStr, monStr, nowSec, nowStr, secStr, targetDate, targetDateStr, yearStr;
    targetDate = before[0], baseDate = before[1], nowSec = before[2], nowStr = before[3], agoStr = before[4], secStr = before[5], minStr = before[6], hourStr = before[7], dayStr = before[8], monStr = before[9], yearStr = before[10];
    targetDateStr = targetDate != null ? 'new Date(' + Utl.militime(targetDate) + ')' : 'undefined';
    baseDateStr = baseDate != null ? 'new Date(' + Utl.militime(baseDate) + ')' : 'undefined';
    beforeStr = ("targetDate = " + targetDateStr + "\nbaseDate   = " + baseDateStr + "\nnowSec     = " + nowSec + "\nnowStr     = " + nowStr + "\nagoStr     = " + agoStr + "\nsecStr     = " + secStr + "\nminStr     = " + minStr + "\nhourStr    = " + hourStr + "\ndayStr     = " + dayStr + "\nmonStr     = " + monStr + "\nyearStr    = " + yearStr).replace(/ /g, '&nbsp;').replace(/\n/g, '<br>');
    return [beforeStr, Utl.difftime(targetDate, baseDate, nowSec, nowStr, agoStr, secStr, minStr, hourStr, dayStr, monStr, yearStr)];
  };

  UtlTest.inArray = function(ary) {
    var array, needle;
    needle = ary[0], array = ary[1];
    return ['needle = ' + needle + '<br>array = ' + '[' + array.toString() + ']', Utl.inArray(needle, array) ? 'true' : 'false'];
  };

  UtlTest.clone = function(before) {
    return ['[' + before.toString() + ']', '[' + Utl.clone(before).toString() + ']'];
  };

  UtlTest.shuffle = function(before) {
    return ['[' + before.toString() + ']', '[' + Utl.shuffle(before).toString() + ']'];
  };

  UtlTest.arrayFill = function(before) {
    var length, value;
    length = before[0], value = before[1];
    return ['length = ' + length + '<br>value = ' + value, '[' + Utl.arrayFill(length, value).toString() + ']'];
  };

  UtlTest.array2dFill = function(before) {
    var j, len, res, resView, v, value, x, y;
    x = before[0], y = before[1], value = before[2];
    res = Utl.array2dFill(x, y, value);
    resView = "[<br>\n";
    for (j = 0, len = res.length; j < len; j++) {
      v = res[j];
      resView += '&nbsp;&nbsp;&nbsp;[' + v.toString() + "]<br>\n";
    }
    resView += "]\n";
    return ['x = ' + x + '<br>y = ' + y + '<br>value = ' + value, resView];
  };

  UtlTest.count = function(before) {
    var beforeStr, ref;
    ref = before, beforeStr = ref[0], before = ref[1];
    return [beforeStr, Utl.count(before)];
  };

  UtlTest.uuid4 = function(before) {
    var after, i, j;
    after = [];
    for (i = j = 0; j < 10; i = ++j) {
      after.push(Utl.uuid4());
    }
    return ['', after.join('<br>')];
  };

  return UtlTest;

})();

$().ready(function() {
  var after, before, c, caseDiv, cases, funcFullName, funcName, j, len, ref, ref1, results;
  ref = window.tests;
  results = [];
  for (funcName in ref) {
    cases = ref[funcName];
    funcFullName = 'Utl.' + funcName;
    caseDiv = $('<div>').attr('id', funcFullName).append($('<h1>').attr('name', funcFullName).html(funcFullName));
    $('#index ul').append($('<li>').html('<a href="#' + funcFullName + '">' + funcFullName + '</a>'));
    for (j = 0, len = cases.length; j < len; j++) {
      c = cases[j];
      if (UtlTest[funcName] != null) {
        ref1 = UtlTest[funcName](c), before = ref1[0], after = ref1[1];
      } else {
        before = c;
        after = Utl[funcName](before);
      }
      caseDiv.append($('<div>').addClass('case').append($('<div>').addClass('before').html(before)).append($('<div>').addClass('after').html(after)));
    }
    results.push($('#tests').append(caseDiv));
  }
  return results;
});
