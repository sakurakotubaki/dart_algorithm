// スタックの実装
class MyStack<T> {
  final List<T> _data = [];

  // データを追加
  void push(T value) {
    _data.add(value);
  }

  // データを取り出す
  T pop() {
    if (_data.isEmpty) {
      throw StateError('Stack is empty');
    }
    return _data.removeLast();
  }

  // スタックが空かどうかを確認
  bool get isEmpty => _data.isEmpty;

  // スタックの現在のサイズを取得
  int get length => _data.length;

  // スタックの内容を文字列として返す
  @override
  String toString() {
    return _data.toString();
  }
}

// キューの実装
class MyQueue<T> {
  final List<T> _data = [];

  // データを追加（エンキュー）
  void enqueue(T value) {
    _data.add(value);
  }

  // データを取り出す（デキュー）
  T dequeue() {
    if (_data.isEmpty) {
      throw StateError('Queue is empty');
    }
    return _data.removeAt(0);
  }

  // キューが空かどうかを確認
  bool get isEmpty => _data.isEmpty;

  // キューの現在のサイズを取得
  int get length => _data.length;

  // キューの内容を文字列として返す
  @override
  String toString() {
    return _data.toString();
  }
}

void main() {
  // スタックの使用例
  print('=== Stack Demo ===');
  final myStack = MyStack<String>();

  myStack.push('a');
  print(myStack);
  myStack.push('b');
  print(myStack);
  myStack.push('c');
  print(myStack);

  final val1 = myStack.pop();
  print(val1);
  final val2 = myStack.pop();
  print(val2);
  final val3 = myStack.pop();
  print(val3);

  print('$val1 $val2 $val3');

  // キューの使用例
  print('\n=== Queue Demo ===');
  final myQueue = MyQueue<String>();

  myQueue.enqueue('a');
  print(myQueue);
  myQueue.enqueue('b');
  print(myQueue);
  myQueue.enqueue('c');
  print(myQueue);

  final qVal1 = myQueue.dequeue();
  print(qVal1);
  final qVal2 = myQueue.dequeue();
  print(qVal2);
  final qVal3 = myQueue.dequeue();
  print(qVal3);

  print('$qVal1 $qVal2 $qVal3');
}
