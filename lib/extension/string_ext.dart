extension StringExt on String {
  String take(int count) {
    if (count <= 0) return "";
    if (length <= count) return this;
    return substring(0, count);
  }

  String takeLast(int count) {
    if (count <= 0) return "";
    final size = length;
    if (size <= count) return this;
    return substring(size - count);
  }
}
