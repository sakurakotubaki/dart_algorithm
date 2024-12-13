# Singleton Pattern
アプリケーション実行中にクラスのインスタンスが１つだけ生成されることを保証するデザインパターン

## メリット
- リソース節約: メモリ使用利用が削減される
- 一貫性: アプリケーション全体で一貫した状態が維持される。（例: アプリケーションの設定や環境変数）
- グローバルアクセスポイント: アプリケーションのどこからでもアクセス可能。

## ユースケース
- 共通ユーティリティ機能の提供: アプリケーション全体で再利用可能な共通のユーティリティ機能の提供
- 設定情報の管理: アプリケーション全体で共有される設定や環境変数。
- データベース接続: データベースへの接続を一元管理。
- ロギング: アプリケーション全体からのログを一つのログファイルに書き込む。

## 実装上のポイント
- プラベートコンストラクタ: クラスの外部からのインスタンス化を防ぐ。
- 静的インスタンス: クラス内に唯一の静的インスタンスを持つ。
- ファクトリコンストラクタ: 常に同じインスタンスを返す。

## Dartの実装例
設定情報の管理のためのSingletonクラス
```dart
import 'package:dotenv/dotenv.dart';

/// 環境設定を管理するシングルトンクラス
class Settings {
  // プライベートなコンストラクタ
  Settings._internal() {
    // .envファイルを読み込む
    _env = DotEnv()..load();
    // 環境変数を取得
    apiKey = _env['apiKey'] ?? '';
    secretKey = _env['secretKey'] ?? '';
  }

  // シングルトンインスタンス
  static final Settings _instance = Settings._internal();

  /// シングルトンインスタンスを取得するファクトリコンストラクタ
  factory Settings() => _instance;

  // 環境変数
  late final DotEnv _env;
  
  /// APIキー
  late final String apiKey;
  
  /// シークレットキー
  late final String secretKey;
}

/// ロギングのためのSingletonクラス
```dart
import 'dart:io';
import 'package:intl/intl.dart';

/// アプリケーション全体のログを管理するシングルトンクラス
class Logger {
  // プライベートコンストラクタ
  Logger._internal() {
    _logFile = File('app.log');
    if (!_logFile.existsSync()) {
      _logFile.createSync();
    }
  }

  // シングルトンインスタンス
  static final Logger _instance = Logger._internal();

  /// シングルトンインスタンスを取得するファクトリコンストラクタ
  factory Logger() => _instance;

  late final File _logFile;

  /// ログを記録する
  void info(String message) {
    final timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    final logMessage = '[$timestamp] INFO: $message\n';
    _logFile.writeAsStringSync(logMessage, mode: FileMode.append);
  }
}

/// メイン関数
void main() {
  final settings = Settings();
  print(settings.apiKey); // 1x00apikey
  print(settings.secretKey); // 1x00secretKey
  
  final logger = Logger();
  logger.info('アプリケーションが起動しました');
  
  try {
    throw Exception('テストエラー');
  } catch (e) {
    logger.info('エラーが発生しました: $e');
  }
}
```