import 'package:intl/intl.dart' as intl;

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
  bool isYesterday(DateTime other) =>
      year == other.year && month == other.month && day == other.day - 1;

  String get formattedDate =>
      intl.DateFormat('dd MMM yyyy hh:mm a').format(this);

  String get formattedDateWithoutTime =>
      intl.DateFormat('dd MMM yyyy').format(this);

  String get formattedTime => intl.DateFormat(' hh:mm a').format(this);
}
