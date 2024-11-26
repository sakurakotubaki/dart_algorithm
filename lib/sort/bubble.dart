void main() {
  List<int> myList = [6, 3, 10, 4, 2, 9, 9, 5, 1, 7];
  print('Original list: $myList');

  simpleBubbleSort(myList);
  print('Sorted list: $myList');
}

// より短いバージョン（Pythonの例により近い）
void simpleBubbleSort(List<int> list) {
  final n = list.length;
  for (var j = 0; j < n - 1; j++) {
    if (list[j] > list[j + 1]) {
      final temp = list[j];
      list[j] = list[j + 1];
      list[j + 1] = temp;
    }
  }
}
