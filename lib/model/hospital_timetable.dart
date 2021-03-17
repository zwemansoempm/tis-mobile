class HospitalTimeTableModel {
  int id;
  String mon;
  String tue;
  String wed;
  String thu;
  String fri;
  String sat;
  String sun;
  String part;
  int profile_id;

  HospitalTimeTableModel(this.id, this.mon, this.tue, this.wed, this.thu, this.fri, this.sat, this.sun, this.part, this.profile_id);

  HospitalTimeTableModel.fromJson(Map<String, dynamic> json)

  : id = json["id"],
    mon = json["mon"],
    tue = json["tue"],
    wed = json["wed"],
    thu = json["thu"],
    fri = json["fri"],
    sat = json["sat"],
    sun = json["sun"],
    part = json["part"],
    profile_id =json["profile_id"];



}