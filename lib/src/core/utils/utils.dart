import 'package:intl/intl.dart';

class Utils {
  static String toDateTime(int timestamp) {
    return DateFormat.yMMMd().format(
      DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000,
      ),
    );
  }
}
