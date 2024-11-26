// 線形探索
// 目的の数字を見つける
void linearSearch(List<int> list, int target) {
  for (var i = 0; i < list.length; i++) {
    if (list[i] == target) {
      print('${i}番目に見つかりました');
      return;
    }
  }
  print('見つかりませんでした');
}

// enumerateを使用したバージョン
void linearSearchWithEnumerate(List<int> list, int target) {
  // asMapを使用してインデックスと値のペアを取得
  for (var entry in list.asMap().entries) {
    if (entry.value == target) {
      print('${entry.key}番目に見つかりました');
      return;
    }
  }
  print('見つかりませんでした');
}

void main() {
  final list = [1, 5, 3, 7, 2];

  print('通常のfor文を使用:');
  linearSearch(list, 3);

  print('\nasMap()を使用（Pythonのenumerateに相当）:');
  linearSearchWithEnumerate(list, 3);
}
