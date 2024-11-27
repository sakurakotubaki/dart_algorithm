import 'dart:collection';
import 'package:intl/intl.dart';

// この実装の特徴：

// データ構造：

// HashMapを使用して日付とメモを管理
// キー：日付文字列（'yyyy-MM-dd'形式）
// 値：その日のメモのリスト

// 主な機能：

// 現在時刻でメモを追加（タイムスタンプ付き）
// 特定の日付のメモを取得
// 11月のカレンダー表示（メモがある日付に*表示）
// 全メモの一覧表示

// カレンダー表示：

// 曜日を考慮した配置
// メモがある日付の視覚的な表示
// 整形された出力

// メモの管理：

// 日付ごとに複数のメモを保存可能
// タイムスタンプ付きで保存
// 日付順にソートして表示

class CalendarMemo {
  final Map<String, List<String>> memoMap = HashMap<String, List<String>>();

  void addMemoNow(String text) {
    final now = DateTime.now();
    final dateKey = DateFormat('yyyy-MM-dd').format(now);
    final timeStamp = DateFormat('HH:mm:ss').format(now);
    final memoText = '[$timeStamp] $text';

    if (!memoMap.containsKey(dateKey)) {
      memoMap[dateKey] = [];
    }

    memoMap[dateKey]!.add(memoText);
    print('メモを保存しました: $dateKey - $memoText');
  }

  List<String> getMemosByDate(DateTime date) {
    final dateKey = DateFormat('yyyy-MM-dd').format(date);
    return memoMap[dateKey] ?? [];
  }

  void displayNovemberCalendar() {
    print('\n=== 2024年11月 ===');
    print('日 月 火 水 木 金 土');

    StringBuffer line = StringBuffer();
    final firstDay = DateTime(2024, 11, 1);
    final firstWeekday = firstDay.weekday % 7;

    // 最初の空白を出力
    for (var i = 0; i < firstWeekday; i++) {
      line.write('   ');
    }

    // 日付とメモの表示
    for (var day = 1; day <= 30; day++) {
      final date = DateTime(2024, 11, day);
      final dateKey = DateFormat('yyyy-MM-dd').format(date);
      final hasMemo = memoMap.containsKey(dateKey);

      // メモがある日付は*を付ける
      final dayStr = day.toString().padLeft(2);
      line.write(hasMemo ? '$dayStr* ' : '$dayStr  ');

      // 土曜日で改行
      if ((firstWeekday + day) % 7 == 0) {
        print(line.toString());
        line.clear();
      }
    }

    // 最後の行が残っている場合は出力
    if (line.length > 0) {
      print(line.toString());
    }

    print('\n* メモあり\n');
  }

  void displayAllMemos() {
    print('\n=== メモ一覧 ===');

    final sortedDates = memoMap.keys.toList()..sort();
    for (final dateKey in sortedDates) {
      print('\n$dateKey:');
      for (final memo in memoMap[dateKey]!) {
        print('  $memo');
      }
    }
  }
}

void main() async {
  // asyncを追加
  final calendar = CalendarMemo();

  // テスト用のメモを追加
  calendar.addMemoNow('朝のミーティング');

  // 1秒待機してから次のメモを追加
  await Future.delayed(Duration(seconds: 1));
  calendar.addMemoNow('メール確認');

  // カレンダーとメモを表示
  calendar.displayNovemberCalendar();
  calendar.displayAllMemos();
}
