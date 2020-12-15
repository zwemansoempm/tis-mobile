class MedicalModel{
  final int id;
  final String title;
  final String photo;
  final String mainPoint; 
  final int blockId;
  final String createdAt;
  final String name;
  final int pattern;
  final String colorCode;
  final int pid;


  MedicalModel(this.id,this.title,this.photo,this.mainPoint,this.blockId,this.createdAt,this.name,this.pattern,this.colorCode,this.pid);

  MedicalModel.fromJson(Map<String,dynamic> json) //Map<String,dynamic> List<dynamic>
  : id =json["id"],
    title=json["title"],
    photo=json["photo"],
    mainPoint=json["main_point"],   
    blockId=json["block_id"],
    createdAt=json["created_at"],
    name=json["name"],
    pattern=json["pattern"],
    colorCode=json["color_code"],
    pid=json["pid"];
}