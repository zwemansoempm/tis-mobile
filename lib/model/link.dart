class LinkModel{
  final int id;
  final String postDate;
  final int type;
  final int status; 
  final String description;
  final String createdAt;

  LinkModel(this.id,this.postDate,this.type,this.status,this.description,this.createdAt);

  LinkModel.fromJson(Map<String,dynamic> json) //Map<String,dynamic> List<dynamic>
  : id =json["id"],
    postDate=json["post_date"],
    type=json["type"],
    status=json["status"],   
    description=json["description"],
    createdAt=json["created_at"];  
}