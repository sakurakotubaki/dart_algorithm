class Node {
  final String key;
  final String value;

  Node(this.key, this.value);

  @override
  String toString() => '$key:$value';
}

class MyHashTable {
  final int size = 100;
  late List<Node?> data;

  MyHashTable() {
    data = List.filled(size, null);
  }

  // 簡単なハッシュ関数
  int _hashFunction(String text) {
    int hashNum = 0;
    for (int i = 0; i < text.length; i++) {
      hashNum += text.codeUnitAt(i);
    }
    return hashNum;
  }

  void set(String key, String value) {
    final hashKey = _hashFunction(key) % size;
    data[hashKey] = Node(key, value);
    print("'$key' は配列の $hashKey 番目に格納されました");
  }

  Node? get(String key) {
    final hashKey = _hashFunction(key) % size;
    return data[hashKey];
  }

  void delete(String key) {
    final hashKey = _hashFunction(key) % size;
    if (data[hashKey] != null) {
      data[hashKey] = null;
      print("'$key' を削除しました");
    }
  }

  @override
  String toString() {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < size; i++) {
      if (data[i] != null) {
        result.writeln('$i:${data[i]}');
      }
    }
    return result.toString();
  }
}

void main() {
  print('=== ハッシュテーブルのテスト ===');
  final myMap = MyHashTable();

  // データの追加
  final testData = {
    'Honda': 'honda@example.com',
    '39': '39@example.com',
    '42': '42@example.com',
    'tanaka': 'tanaka@example.com',
    'yamada': 'yamada@example.com'
  };

  testData.forEach((key, value) {
    myMap.set(key, value);
  });

  print('\n=== 全データの表示 ===');
  print(myMap);

  print('\n=== データの取得テスト ===');
  ['Honda', '39', '42'].forEach((key) {
    final result = myMap.get(key);
    if (result != null) {
      print('$keyのメールアドレス: ${result.value}');
    }
  });
}
