# Dart Lint Rules Documentation

このプロジェクトで使用しているDartのリントルールに関する公式ドキュメントへのリンク集です。

## 基本情報

- [Dart Linter Rules](https://dart.dev/tools/linter-rules) - すべてのリントルールの一覧
- [Effective Dart](https://dart.dev/effective-dart) - Dartの効果的な書き方ガイド

## リントセット

- [package:lints](https://pub.dev/packages/lints) - 推奨リントセットのパッケージ
  - [Core Lints](https://dart.dev/go/core-lints) - 最も重要な基本的なリント
  - [Recommended Lints](https://dart.dev/tools/linter-rules#recommended) - 推奨リントセット（このプロジェクトで使用）

## 設定方法

- [Customizing static analysis](https://dart.dev/guides/language/analysis-options) - analysis_options.yamlの設定方法

## プロジェクトで有効化されている主なルール

### スタイルルール
- `camel_case_types` - 型名はキャメルケースを使用
- `camel_case_extensions` - 拡張名はキャメルケースを使用
- `library_names` - ライブラリ名の命名規則

### エラーレベル
- `todo: info` - TODOコメントは情報レベル
- `deprecated_member_use: warning` - 非推奨のメンバー使用は警告レベル
- `dead_code: warning` - デッドコードは警告レベル
