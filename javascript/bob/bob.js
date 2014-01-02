var Bob, EmptyResponse, Person, Response;

var __hasProp = {}.hasOwnProperty;
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

Response = (function() {
  function Response() {}

  Response.isAppropriate = function(msg) {
    throw new Error('Must implement Response.isAppropriate');
  };

  Response.give = function() {
    throw new Error('Must implement Response.give');
  };

  return Response;

})();

EmptyResponse = (function(_super) {
  __extends(EmptyResponse, _super);

  function EmptyResponse() {
    return EmptyResponse.__super__.constructor.apply(this, arguments);
  }

  EmptyResponse.isAppropriate = function(msg) {
    return msg.trim() === '';
  };

  EmptyResponse.give = function() {
    return "Fine. Be that way!";
  };

  return EmptyResponse;

})(Response);

ThreatenedResponse = (function(_super) {
  __extends(ThreatenedResponse, _super);

  function ThreatenedResponse() {
    return ThreatenedResponse.__super__.constructor.apply(this, arguments);
  }

  ThreatenedResponse.isAppropriate = function(msg) {
    return msg.match(/[a-zA-Z]+/) && msg.toUpperCase() === msg;
  };

  ThreatenedResponse.give = function() {
    return "Woah, chill out!";
  };

  return ThreatenedResponse;

})(Response);

QuestionedResponse = (function(_super) {
  __extends(QuestionedResponse, _super);

  function QuestionedResponse() {
    return QuestionedResponse.__super__.constructor.apply(this, arguments);
  }

  QuestionedResponse.isAppropriate = function(msg) {
    return msg[msg.length - 1] === '?';
  };

  QuestionedResponse.give = function() {
    return "Sure.";
  };

  return QuestionedResponse;

})(Response);

DefaultResponse = (function(_super) {
  __extends(DefaultResponse, _super);

  function DefaultResponse() {
    return DefaultResponse.__super__.constructor.apply(this, arguments);
  }

  DefaultResponse.isAppropriate = function(msg) {
    return true;
  };

  DefaultResponse.give = function() {
    return "Whatever.";
  };

  return DefaultResponse;

})(Response);

Person = (function() {
  function Person() {}

  return Person;

})();

Bob = (function(_super) {
  __extends(Bob, _super);

  function Bob() {
    Bob.__super__.constructor.apply(this, arguments);
    this.responses = [EmptyResponse, ThreatenedResponse, QuestionedResponse, DefaultResponse];
  }

  Bob.prototype.hey = function(msg) {
    for(var indx in this.responses) {
      var res = this.responses[indx];
      if (res.isAppropriate(msg))
        return res.give();
    }
  };

  return Bob;

})(Person);

module.exports = Bob;