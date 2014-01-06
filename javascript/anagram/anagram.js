function Anagram(inputWord) {
	this.inputWord = inputWord || "";
	this.charCounts = {};
}

Anagram.countChars = function (word) {
	var
		i,
		chars = word.split(),
		charCounts = {};

	for (i = 0; i < chars.length; i++) {
		if (charCounts[chars[i]]) {
			charCounts[chars[i]]++;
		} else {
			charCounts[chars[i]] = 0;
		}
	}
};

Anagram.prototype.match = function (words) {
	var
		i,
		charCounts,
		word,
		words = words || [],
		matches = [];

	for (i = 0; i < words.length; i++) {
		word = words[i];
		if (this.inputWord.length == word.length) {
			charCounts = Anagram.countChars(word);

		}
	}

	return matches;
};

module.exports = Anagram;
