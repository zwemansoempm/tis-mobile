import 'package:tis/model/township.dart';

class PostalList {
  final int id;
  final String jis_code;
  final String zip5_code;
  final String zip7_code;
  final String kana_pref;
  final String kana_city;
  final String kana_street;
  final String pref;
  final String city;
  final String street;
  final int city_id;
  final int flag1;
  final int flag2;
  final int flag3;
  final int flag4;
  final int flag5;
  final int flag6;
  PostalList(
    this.id,
    this.jis_code,
    this.zip5_code,
    this.zip7_code,
    this.kana_pref,
    this.kana_city,
    this.kana_street,
    this.pref,
    this.city,
    this.street,
    this.city_id,
    this.flag1,
    this.flag2,
    this.flag3,
    this.flag4,
    this.flag5,
    this.flag6,
  );
  PostalList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        jis_code = json['jis_code'],
        zip5_code = json['zip5_code'],
        zip7_code = json['zip7_code'],
        kana_pref = json['kana_pref'],
        kana_city = json['kana_city'],
        kana_street = json['kana_street'],
        pref = json['pref'],
        city = json['city'],
        street = json['street'],
        city_id = json['city_id'],
        flag1 = json['flag1'],
        flag2 = json['flag2'],
        flag3 = json['flag3'],
        flag4 = json['flag4'],
        flag5 = json['flag2'],
        flag6 = json['flag6'];
}
