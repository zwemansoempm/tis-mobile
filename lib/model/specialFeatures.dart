class SpecialFeatureModel {
  int id;
  String name;
  String short_name;
  String type;
  int user_id;
  int recordstatus;

  SpecialFeatureModel(
    this.id,this.name,
    this.short_name,this.type,this.user_id,this.recordstatus
  );

  SpecialFeatureModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    short_name = json['short_name'],
    type = json['type'],
    user_id = json['user_id'],
    recordstatus = json['recordstatus'];

}