extension StringExtension on String {
  String get capitalizeFirst {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
