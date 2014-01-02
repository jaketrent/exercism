var words = function (sentence) {

  function _normalize(word) {
    function _rmNonAlpha() {
      return word.replace(/\W+/, '');
    }

    return _rmNonAlpha().toLowerCase();
  }

  function _isBlank(word) {
    return word.length === 0;
  }

  function _exists(word) {
    return typeof word !== 'undefined' && word !== null;
  }

  var wordMap = {};
  var words = sentence.split(' ');

  for (var indx in  words) {
    var word = _normalize(words[indx]);
    if (!_isBlank(word)) {
      wordMap[word] = _exists(wordMap[word]) ? wordMap[word] + 1 : 1
    }
  }

  return wordMap;
};

module.exports = words;