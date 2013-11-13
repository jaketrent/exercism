class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    matches = []
    words.each do |w|
      matches.push w if is_anagram? @word, w
    end

    matches
  end

  def is_anagram?(word1, word2)
    is_anagram = true

    if _words_same_length?(word1, word2) and !_words_match?(word1, word2)
      letters1 = word1.downcase.split('')
      letters2 = word2.downcase.split('')
      letters1.each do |w|
        if letters2.count(w) > 0
          _remove_letter letters2, w
        else
          is_anagram = false
        end
      end
    else
      is_anagram = false
    end

    is_anagram
  end

  private

  def _words_match?(word1, word2)
    word1.downcase == word2.downcase
  end

  def _remove_letter(letters, letter)
    letters.slice! letters.index(letter), 1
  end

  def _words_same_length?(word1, word2)
    word1.size == word2.size
  end

end