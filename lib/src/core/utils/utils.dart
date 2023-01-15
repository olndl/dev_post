import 'package:intl/intl.dart';

class Utils {
  static String toDateTime(int timestamp) {
    return DateFormat.yMd().format(
      DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000,
      ),
    );
  }
}
