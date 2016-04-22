function getCounts(word) {
  return word.split('').reduce((acc, letter) => {
    const lower = letter.toLowerCase()
    acc[lower] = (acc[lower] || 0) + 1
    return acc
  }, {})
}

function deepEqual(counts1, counts2) {
  const keys1 = Object.keys(counts1)
  const keys2 = Object.keys(counts2)
  if (keys1.length !== keys2.length) return false

  return keys1.filter(letter => {
    return counts1[letter] !== counts2[letter]
  }).length === 0
}

module.exports = function anagram(word) {
  return {
    matches(candidates) {
      if (!Array.isArray(candidates)) candidates = [].slice.call(arguments)

      const srcCounts = getCounts(word)
      return candidates.filter(candidate => {
        const countsSame = deepEqual(srcCounts, getCounts(candidate))
        const wordsSame = candidate.toLowerCase() === word.toLowerCase()
        return !wordsSame && countsSame
      });
    }
  }
}
