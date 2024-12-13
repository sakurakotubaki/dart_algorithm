// ネストされたif文の例

String nestedIf(int num) {
  if (num >= 0) {
    if (num < 10) {
      return '0 <= num < 10🍊';
    } else {
      return '10 <= num👻';
    }
  } else {
    return 'num < 0';
  }
}

// 早期returnで終わらせる例
String earlyReturn(int num) {
  if (num < 0) return 'num < 0🍊';
  if (num < 10) return '0 <= num < 10👻';
  return '10 <= num🍎';
}

void main() {
  print(nestedIf(15)); // 0 <= num < 10
  print(earlyReturn(0)); // 0 <= num < 10
}
