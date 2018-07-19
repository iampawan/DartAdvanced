//time complexity for the linear search is O(n)
String linearSearch(List<int> list, int x) {
  for (int i = 0; i < list.length; i++) {
    if (x == list[i]) {
      return "Found x at Index $i";
    }
  }

  return "Not found";
}

//time complexity for the Binary search is O(logN)

String binarySearch(List<int> list, int x) {
  int min = 0;
  int max = list.length - 1;

  while (min <= max) {
    int mid = ((min + max) / 2).floor();
    if (x == list[mid]) {
      return "Found x at Index $mid";
    } else if (x < list[mid]) {
      max = mid - 1;
    } else {
      min = mid + 1;
    }
  }

  return "Not found";
}
