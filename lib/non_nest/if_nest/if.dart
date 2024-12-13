void main() {
  // ネストしたfor文
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      print('i: $i, j: $j');
    }
  }

  // ネストを避けたfor文
  for (var k = 0; k < 9; k++) {
    var i = k ~/ 3;
    var j = k % 3;
    print('i: $i, j: $j');
  }
}
