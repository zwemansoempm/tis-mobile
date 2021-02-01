class MedicalAcceptanceModel {
  int id;
  String name;
  int user_id;
  int recordstatus;

  MedicalAcceptanceModel(this.id,this.name,this.user_id,this.recordstatus);

  MedicalAcceptanceModel.fromJson(Map<String,dynamic> json) :
    id = json['id'],
    name = json['name'],
    user_id = json['user_id'],
    recordstatus = json['recordstatus'];
}