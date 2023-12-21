double doubleParse(String value) {
  return double.parse(value.replaceAll(',', '.'));
}
