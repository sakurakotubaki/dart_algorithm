# Factory Pattern in Dart

Factory パターンは、オブジェクトの生成ロジックをカプセル化し、柔軟なオブジェクト生成を可能にするデザインパターンです。

## 実装例1: テーマファクトリー

アプリケーションのテーマを動的に生成する例:

```dart
abstract class Theme {
  Color get primaryColor;
  Color get secondaryColor;
}

class LightTheme implements Theme {
  @override
  Color get primaryColor => Colors.blue;
  
  @override
  Color get secondaryColor => Colors.white;
}

class DarkTheme implements Theme {
  @override
  Color get primaryColor => Colors.black;
  
  @override
  Color get secondaryColor => Colors.grey;
}

class ThemeFactory {
  static Theme createTheme(String type) {
    switch (type) {
      case 'light':
        return LightTheme();
      case 'dark':
        return DarkTheme();
      default:
        throw ArgumentError('Unknown theme type');
    }
  }
}
```

## 実装例2: ドキュメントジェネレーター

異なる形式のドキュメントを生成する例:

```dart
abstract class Document {
  String generate();
}

class PDFDocument implements Document {
  @override
  String generate() => 'Generating PDF document...';
}

class WordDocument implements Document {
  @override
  String generate() => 'Generating Word document...';
}

class DocumentFactory {
  static Document createDocument(String format) {
    switch (format.toLowerCase()) {
      case 'pdf':
        return PDFDocument();
      case 'word':
        return WordDocument();
      default:
        throw ArgumentError('Unsupported format');
    }
  }
}
```

## 実装例3: データベースコネクター

異なるデータベース接続を管理する例:

```dart
abstract class DatabaseConnection {
  void connect();
  void query(String sql);
}

class MySQLConnection implements DatabaseConnection {
  @override
  void connect() => print('Connecting to MySQL...');
  
  @override
  void query(String sql) => print('Executing MySQL query: $sql');
}

class PostgreSQLConnection implements DatabaseConnection {
  @override
  void connect() => print('Connecting to PostgreSQL...');
  
  @override
  void query(String sql) => print('Executing PostgreSQL query: $sql');
}

class DatabaseFactory {
  static DatabaseConnection createConnection(String type) {
    switch (type.toLowerCase()) {
      case 'mysql':
        return MySQLConnection();
      case 'postgresql':
        return PostgreSQLConnection();
      default:
        throw ArgumentError('Unsupported database type');
    }
  }
}
```

## 実装例4: プラットフォーム固有の機能

プラットフォームに応じて異なる実装を提供する例:

```dart
abstract class PlatformService {
  void showNotification(String message);
}

class AndroidService implements PlatformService {
  @override
  void showNotification(String message) {
    print('Android style notification: $message');
  }
}

class IOSService implements PlatformService {
  @override
  void showNotification(String message) {
    print('iOS style notification: $message');
  }
}

class PlatformServiceFactory {
  static PlatformService createService() {
    if (Platform.isAndroid) {
      return AndroidService();
    } else if (Platform.isIOS) {
      return IOSService();
    }
    throw UnsupportedError('Unsupported platform');
  }
}
```

## Factory パターンの利点

1. **カプセル化**: オブジェクトの生成ロジックを隠蔽
2. **柔軟性**: 新しい種類のオブジェクトを追加しやすい
3. **依存性の低減**: クライアントコードは具体的な実装に依存しない
4. **一貫性**: オブジェクト生成の一貫した方法を提供

## 一般的な使用シーン

1. プラットフォーム固有の実装の切り替え
2. 設定に基づく動的なオブジェクト生成
3. リソース管理（データベース接続、ファイル操作など）
4. テスト環境とプロダクション環境の切り替え
5. プラグインシステムの実装
6. UIコンポーネントの動的生成

## API通信以外の実装例

1. ファイルシステム操作（異なるストレージタイプの処理）
2. グラフィックス処理（異なる画像フォーマットの処理）
3. 認証システム（異なる認証方式の実装）
4. ロギングシステム（異なるログ出力先の管理）
5. キャッシュシステム（メモリ/ディスクキャッシュの切り替え）
6. 暗号化システム（異なる暗号化アルゴリズムの実装）
