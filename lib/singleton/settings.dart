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

/// メイン関数
void main() {
  final settings = Settings();
  print(settings.apiKey); // 1x00apikey
  print(settings.secretKey); // 1x00secretKey
}
