import 'package:intl/intl.dart';
import 'package:html/parser.dart';

String dateToStringFormat(DateTime date){
  return DateFormat('M/dd').format(date);
}

String moneyChangeFormat(int value) {
  var formatter = NumberFormat('###,###');
  StringBuffer sb = new StringBuffer();
  sb.write(value == 0 ? '0' : '');
  sb.write(value/10000.floor() == 0 ? '' : formatter.format((value/10000).floor()).toString()+"万");
  sb.write(value%10000 == 0 ? '' : formatter.format(value%10000).toString());
  return sb.toString();
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;
  return parsedString;
}
