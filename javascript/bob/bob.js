
var Bob = (function () {

  function Bob() {}

  Bob.prototype.hey = function (msg) {
    if (msg.trim() === '') {
      return 'Fine. Be that way!';
    } else if (msg.match(/[a-zA-Z]+/) && msg.toUpperCase() === msg) {
      return 'Woah, chill out!';
    } else if (msg[msg.length - 1] === '?') {
      return 'Sure.';
    } else {
      return 'Whatever.';
    }
  };

  return Bob;

})();

module.exports = Bob;