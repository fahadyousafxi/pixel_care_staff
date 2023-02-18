import 'package:intl/intl.dart';

class MyDateUtils {
  static String getTimeDifference(String startTime, String endTime) {
    /// Set the format that of the Date/Time that like to parse
    /// h - 12h in am/pm
    /// m - minute in hour
    /// a - am/pm marker
    /// See more format here: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
    var dateFormat = DateFormat('h:ma');
    DateTime durationStart = dateFormat.parse(startTime);
    DateTime durationEnd = dateFormat.parse(endTime);

    return '${durationEnd.difference(durationStart).inHours} hours';
  }
}
