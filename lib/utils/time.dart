// get today's date with the format 15, July

import 'package:intl/intl.dart';

String getTodayDate() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('d, MMMM');
  final String formatted = formatter.format(now);
  return formatted;
}
