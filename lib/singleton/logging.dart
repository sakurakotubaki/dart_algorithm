import 'dart:io';
import 'package:intl/intl.dart';

/// ログレベルを定義する列挙型
enum LogLevel {
  /// デバッグレベルのログを表す
  debug,

  /// 情報レベルのログを表す
  info,

  /// 警告レベルのログを表す
  warning,

  /// エラーレベルのログを表す
  error;

  @override
  String toString() => name;
}

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
  final _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  /// ログを書き込む
  void _log(LogLevel level, String message) {
    final timestamp = _dateFormat.format(DateTime.now());
    final logMessage = '[$timestamp] ${level.toString()}: $message\n';

    // ファイルに追記
    _logFile.writeAsStringSync(logMessage, mode: FileMode.append);

    // コンソールにも出力
    print(logMessage);
  }

  /// デバッグレベルのログを記録
  void debug(String message) => _log(LogLevel.debug, message);

  /// 情報レベルのログを記録
  void info(String message) => _log(LogLevel.info, message);

  /// 警告レベルのログを記録
  void warning(String message) => _log(LogLevel.warning, message);

  /// エラーレベルのログを記録
  void error(String message) => _log(LogLevel.error, message);

  /// ログファイルをクリア
  void clearLog() {
    _logFile.writeAsStringSync('');
  }
}

/// 使用例
void main() {
  final logger = Logger();

  // 各レベルのログを記録
  logger.debug('デバッグメッセージ');
  logger.info('情報メッセージ');
  logger.warning('警告メッセージ');
  logger.error('エラーメッセージ');

  // 例外をキャッチしてログに記録
  try {
    throw Exception('テストエラー');
  } catch (e) {
    logger.error('エラーが発生しました: $e');
  }
}
