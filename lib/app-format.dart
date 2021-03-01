import 'package:intl/intl.dart';
import 'package:html/parser.dart';

String dateToStringFormat(DateTime date){
  return DateFormat('M/dd').format(date);
}

String moneyChangeFormat(int value) {
  var formatter = NumberFormat('###,###');
  StringBuffer sb = new StringBuffer();

  if(value == 0 || value == null){
    return "0";
  }
  
  sb.write((value/10000).floor() == 0 ? '' : formatter.format((value/10000).floor()).toString()+"万");
  sb.write(value%10000 == 0 ? '' : formatter.format(value%10000).toString());
  return sb.toString();
}

String parseHtmlString(String htmlString) {
  String parsedString;
  if(htmlString != null){
    final document = parse(htmlString);
    parsedString = parse(document.body.text).documentElement.text;
  }

  return parsedString;
}
