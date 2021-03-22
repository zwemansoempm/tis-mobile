class HospitalSpecFeatModel {
  int id;
  String name;
  String short_name;
  String type;
  int user_id;
  int recordstatus;
  int profile_id;

  HospitalSpecFeatModel(this.id, this.name, this.short_name, this.type, this.user_id, this.recordstatus, this.profile_id);

  HospitalSpecFeatModel.fromJson(Map<String, dynamic> json)
  : id = json["id"],
  name = json["name"],
  short_name = json["short_name"],
  type = json["type"],
  user_id = json["user_id"],
  profile_id = json["profile_id"],
  recordstatus = json["recordstatus"];
}