
function range(len) {
  return Array.apply(null, Array(len)).map(function (_, i) {
    return i;
  });
}

exports.compute = function (strand1, strand2) {
  var min = Math.min(strand1.length, strand2.length);
  return range(min).reduce(function (distance, i) {
    if (strand1.charAt(i) !== strand2.charAt(i))
      distance += 1
    return distance
  }, 0)
}