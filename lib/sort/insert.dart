void main(List<String> args) {
  final list = [1, 3, 4, 6, 2];
  print('Original list: $list');

  // 方法1: 特定のインデックスの要素を移動
  final fromIdx = 3;
  final toIdx = 1;
  final temp = list[fromIdx];
  list.removeAt(fromIdx);
  list.insert(toIdx, temp);
  print('After moving element from $fromIdx to $toIdx: $list');

  // 方法2: 末尾の要素を移動（提供されたコードの修正版）
  final list2 = [1, 3, 4, 6, 2];
  print('\nOriginal list2: $list2');

  final tmp = list2.removeLast(); // last()ではなくremoveLastを使用
  list2.insert(toIdx, tmp);
  print('After moving last element to index $toIdx: $list2');

  // 方法3: Pythonライクな複数の操作方法
  final list3 = [1, 3, 4, 6, 2];
  print('\nOriginal list3: $list3');

  // popとinsertの組み合わせ
  final poppedValue = list3.removeAt(fromIdx); // Pythonのpop(index)相当
  list3.insert(toIdx, poppedValue);
  print('After Python-like pop and insert: $list3');
}
