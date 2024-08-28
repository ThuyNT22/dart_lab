import 'package:session3/session3.dart' as session3;
import 'dart:io';

void bubbleSortAscending(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    bool swapped = false;
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) break;
  }
}

int binarySearch(List<int> arr, int target) {
  int left = 0;
  int right = arr.length - 1;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;

    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1;
}

void main(List<String> arguments) {
  print('Enter a list of integers (space-separated):');
  String? input = stdin.readLineSync();

  if (input != null) {
    List<int> numbers = input.split(' ').map(int.parse).toList();
    bubbleSortAscending(numbers);
    print('Sorted list: $numbers');

    print('Enter the value to search for:');
    String? targetInput = stdin.readLineSync();

    if (targetInput != null) {
      int target = int.parse(targetInput);
      int index = binarySearch(numbers, target);
      if (index != -1) {
        print('Value $target found at index $index.');
      } else {
        print('Value $target not found in the list.');
      }
    } else {
      print('No input provided for the search value.');
    }
  } else {
    print('No input provided for the list.');
  }
}
