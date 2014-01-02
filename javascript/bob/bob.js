
var __hasProp = {}.hasProperty;
var __extends = function(child, parent) { 
  for (var key in parent) { 
    if (__hasProp.call(parent, key)) 
      child[key] = parent[key]; 
  } 

  function ctor() { 
    this.constructor = child; 
  } 

  ctor.prototype = parent.prototype; 
  child.prototype = new ctor(); 
  child.__super__ = parent.prototype; 

  return child; 
};

var __extends = function (child, parent) {
  for (var key in parent) {
      if (__hasProp.call(parent, key)) {
        child[key] = parent[key];
      }
  }

  function ctor() {
    this.constructor = child;
  }

  ctor.prototype = parent.prototype;
  child.prototype = new ctor();
  child.__super__ = parent.prototype;

  return child;
}

var Person = (function () {

  function Person() {}

  return Person;

})();

var Bob = (function (_super) {

  __extends(Bob, _super);

  function Bob() {
    Bob.__super__.constructor.apply(this, arguments);
  }

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

})(Person);

module.exports = Bob;