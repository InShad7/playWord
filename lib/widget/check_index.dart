
List<int> elements = [];
indexcheck(int i, int row) {
  elements.add(i);
  if (elements[0] % row == 0 ||
      elements[0] % row == row - 1 ||
      elements[0] < row ||
      elements[0] > (row * (row - 1))) {
    elements.length == 1 ? print('true') : contin(elements, row);
  } else {
    print(false);
    elements = [];
  }
}


contin(List element, int row) {
  bool flag = true;
  for (int j = 0; j < elements.length - 1; j++) {
    if (element[j] % row == element[j + 1] % row) {
      flag = false;
      continue;
    } else if (element[j] - element[j + 1] == 1 ||
        element[j] - element[j + 1] == -1 && flag == true) {
      continue;
    } else {
      elements = [];
      return 0;
    }
  }
  return 0;
}
