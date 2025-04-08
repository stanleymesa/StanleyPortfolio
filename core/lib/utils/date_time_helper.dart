import 'package:intl/intl.dart';

abstract class DateTimeHelper {
  DateTimeHelper._();

  static const FORMAT_DATE_YMD = "yyyy-MM-dd";
  static const FORMAT_DATE_TIME_YMDHMS = "yyyy-MM-dd HH:mm:ss";
  static const FORMAT_DATE_TIME_DMY_SHORT_MONTH_WITH_SPACE = "dd MMM yyyy";
  static const FORMAT_DATE_TIME_DMY_HM = "dd MMM yyyy, HH:mm";
  static const FORMAT_TIME = "HH:mm";

  static String format(DateTime dateTime, String format) =>
      DateFormat(format).format(dateTime);

  static DateTime parse(String dateString, String format) =>
      DateFormat(format).parse(dateString);

  static String formatYMD(DateTime dateTime) =>
      format(dateTime, FORMAT_DATE_YMD);

  static String formatDMY(DateTime dateTime) =>
      format(dateTime, FORMAT_DATE_TIME_DMY_SHORT_MONTH_WITH_SPACE);

  static String formatTime(DateTime dateTime) => format(dateTime, FORMAT_TIME);

  static DateTime parseYMD(String dateString) =>
      parse(dateString, FORMAT_DATE_YMD);

  static DateTime parseDMY(String dateString) =>
      parse(dateString, FORMAT_DATE_TIME_DMY_SHORT_MONTH_WITH_SPACE);
}
