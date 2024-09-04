bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

int getNumberFromString(String s) {
  return int.parse(s.replaceAll(RegExp('[^0-9]'), ''));
}
