import 'package:intl/intl.dart';

String dateToStringFormat(DateTime date){
  return DateFormat('M/dd').format(date);
}
