Map<String, dynamic> scores = {
  'John': 50,
  'Naoki': 100,
};

void main(List<String> args) {
  print('方法1: 直接キーを指定して検索');
  // 方法1: 直接キーを指定して検索
  final searchName = 'John';
  if (scores.containsKey(searchName)) {
    print('$searchName の点数: ${scores[searchName]}');
  }

  print('方法2: forEachを使用して検索');
  // 方法2: forEachを使用して検索
  scores.forEach((key, value) {
    if (key == searchName) {
      print('$key の点数: $value');
    }
  });

  print('方法3: entriesを使用して検索（より明示的な方法）');
  // 方法3: entriesを使用して検索（より明示的な方法）
  for (var entry in scores.entries) {
    if (entry.key == searchName) {
      print('${entry.key} の点数: ${entry.value}');
    }
  }
}
