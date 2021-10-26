import 'package:intl/intl.dart';

class CommonUtil {
  String chgeDateFormat(DateTime date) {
    // 日付フォーマットを変更し文字列で返す
    var format = new DateFormat.yMMMd('ja');
    var date2 = format.format(date);

    return date2.toString();
  }
}