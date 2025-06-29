library;

import 'package:intl/intl.dart';

String nowInStr() {
  final now = DateTime.now();
  return DateFormat("yyyy-MM-dd kk:mm:ss+0700").format(now);
}
