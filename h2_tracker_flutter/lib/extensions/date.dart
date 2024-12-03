import 'package:intl/intl.dart';

enum PtBrFormat { shortest, short, medium }

extension DateExtension on DateTime {
  String formatToPtBr(PtBrFormat format) {
    switch (format) {
      case PtBrFormat.shortest:
        {
          final dateFormat = DateFormat('dd/MM');
          return dateFormat.format(this);
        }
      case PtBrFormat.short:
        {
          final dateFormat = DateFormat('dd/MM/yyyy');
          return dateFormat.format(this);
        }
      case PtBrFormat.medium:
        {
          final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
          return dateFormat.format(this);
        }
    }
  }
}
