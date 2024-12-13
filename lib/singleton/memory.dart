/// メモリ管理を行うシングルトンクラス
/// 遅延初期化とキャッシュ制御を用いてメモリ消費を最適化します
class MemoryEfficientCache {
  // プライベートコンストラクタ
  MemoryEfficientCache._();

  // 遅延初期化されるシングルトンインスタンス
  static MemoryEfficientCache? _instance;

  // キャッシュデータを保持するマップ
  final Map<String, _CacheItem> _cache = {};

  // キャッシュの最大サイズ
  static const int _maxCacheSize = 100;

  // キャッシュアイテムの有効期限（ミリ秒）
  static const int _cacheExpiryMs = 5 * 60 * 1000; // 5分

  /// シングルトンインスタンスを取得
  /// 必要になった時点で初めてインスタンスが作成される（遅延初期化）
  static MemoryEfficientCache get instance {
    return _instance ??= MemoryEfficientCache._();
  }

  /// キャッシュにデータを追加
  void set(String key, dynamic value) {
    _cleanExpiredCache(); // 期限切れのキャッシュを削除

    // キャッシュが最大サイズに達している場合、最も古いアイテムを削除
    if (_cache.length >= _maxCacheSize) {
      final oldestKey = _cache.entries
          .reduce((a, b) => a.value.timestamp.isBefore(b.value.timestamp) ? a : b)
          .key;
      _cache.remove(oldestKey);
    }

    _cache[key] = _CacheItem(value);
  }

  /// キャッシュからデータを取得
  dynamic get(String key) {
    final item = _cache[key];
    if (item == null) return null;

    // 期限切れの場合はnullを返す
    if (item.isExpired) {
      _cache.remove(key);
      return null;
    }

    return item.value;
  }

  /// 期限切れのキャッシュを削除
  void _cleanExpiredCache() {
    _cache.removeWhere((_, item) => item.isExpired);
  }

  /// 現在のキャッシュサイズを取得
  int get size => _cache.length;

  /// キャッシュをクリア
  void clear() {
    _cache.clear();
  }
}

/// キャッシュアイテムを表すプライベートクラス
class _CacheItem {
  final dynamic value;
  final DateTime timestamp;

  _CacheItem(this.value) : timestamp = DateTime.now();

  bool get isExpired =>
      DateTime.now().difference(timestamp).inMilliseconds >
      MemoryEfficientCache._cacheExpiryMs;
}

void main() {
  final cache = MemoryEfficientCache.instance;

  // キャッシュの使用例
  cache.set('user1', {'name': 'John', 'age': 30});
  cache.set('user2', {'name': 'Alice', 'age': 25});

  // キャッシュからデータを取得
  print(cache.get('user1')); // {name: John, age: 30}
  print(cache.get('user2')); // {name: Alice, age: 25}

  // キャッシュサイズを確認
  print('Cache size: ${cache.size}'); // Cache size: 2

  // 存在しないキーへのアクセス
  print(cache.get('user3')); // null

  // キャッシュをクリア
  cache.clear();
  print('Cache size after clear: ${cache.size}'); // Cache size after clear: 0
}
