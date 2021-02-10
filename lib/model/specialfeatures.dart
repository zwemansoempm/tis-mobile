class SpecialFeaturesModel {
  final int id;
  final String name;
  final String short_name;
  final String type;
  final int user_id;
  final int recordstatus;

  SpecialFeaturesModel(this.id, this.name, this.short_name, this.user_id, this.type, this.recordstatus);

  SpecialFeaturesModel.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    name = json["name"],
    short_name = json["short_name"],
    type = json["type"],
    user_id = json["user_id"],
    recordstatus = json["recordstatus"];
}