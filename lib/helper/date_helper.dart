import 'package:intl/intl.dart';

String displayTimeAgoFromTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("d - MMM - y");
  result = formatter.format(date);
  return result;
}

String displayTimeAndDateTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("dd-MM – hh:mm a");
  result = formatter.format(date);
  return result;
}

int dateFormat(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("dd-MM–yyyy");
  result = formatter.format(date);
  DateTime parseDate = DateFormat("dd-MM–yyyy").parse(result);
  return parseDate.millisecondsSinceEpoch;
}

String dateInMillisecondsSinceEpoch(DateTime date) {
  String result = '';
  final DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm:ss");
  result = formatter.format(date);
  return result;
}

String displayDayAndDateTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("EEEE,MMMM d, hh:mm a");
  result = formatter.format(date);
  return result;
}

String displayMonthAndDateTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("MMMM d, hh:mm a");
  result = formatter.format(date);
  return result;
}
