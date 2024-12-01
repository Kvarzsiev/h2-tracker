import 'package:intl/intl.dart';

extension StringExtension on String {
  String toReadableTitle() {
    return replaceAll('_', ' ')
        .toLowerCase()
        .split(' ')
        .map((e) => toBeginningOfSentenceCase(e))
        .join(' ');
  }
}
