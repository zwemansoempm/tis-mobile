class SpecialFeature {
  int id;
  String name;
  int profile_id;
  int recordstatus;
  String short_name;
  String type;
  int user_id;

  SpecialFeature(this.id, this.name, this.profile_id, this.short_name, this.user_id, this.type, this.recordstatus);

  SpecialFeature.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    name = json["name"],
    profile_id = json["profile_id"],
    short_name = json["short_name"],
    type = json["type"],
    user_id = json["user_id"],
    recordstatus = json["recordstatus"];
}