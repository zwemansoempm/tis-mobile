class FacTypeModel {
  int id;
  String description;

  FacTypeModel(this.id, this.description);

  FacTypeModel.fromJson(Map<String , dynamic> json) :
    id = json['id'],
    description = json['description'];
}
