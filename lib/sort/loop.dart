void main(List<String> args) {
  final list = [1, 2, 3];

  print('for');

  // 方法1: for文でインデックスを使用
  for (var i = 0; i < list.length; i++) {
    print('index: $i, value: ${list[i]}');
  }

  print('while');

  // 方法2: while文でインデックスを使用（提供されたコードの修正版）
  var idx = 0;
  final N = list.length;
  while (idx < N && list[idx] <= 4) {
    print('index: $idx, value: ${list[idx]}');
    idx += 1; // インクリメント演算子 ++ も使用可能
  }

  print('index');

  // 方法3: Pythonのrange()に近い書き方
  for (var i in List.generate(list.length, (i) => i)) {
    print('index: $i, value: ${list[i]}');
  }
}

// ソート処理ではループ処理中に順番を変える処理があるため、イテレーターを
// 使用したループの場合はどの要素に対して処理しているのかわかりずらくなる。
// indexを使用したループを採用した方が理解しやすい。