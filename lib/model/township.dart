class TownshipModel {
  final int id;
  final String township_name;
  final String city_id;

  TownshipModel(this.id, this.township_name, this.city_id);

  TownshipModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        township_name = json["township_name"],
        city_id = json["city_id"];
}
