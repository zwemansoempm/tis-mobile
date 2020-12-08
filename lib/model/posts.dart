class PostsModel{
  final int id;
  final String title;
  final String photo;
  final String main_point;
  final String body;
  final int category_id;
  final String related_news;
  final int user_id;
  final int recordstatus; 
  final String created_by;
  final String created_by_company;
  final int block_id;
  final String created_at;

  PostsModel(this.id,this.title,this.photo,this.main_point,this.body,this.category_id,this.related_news,this.user_id,this.recordstatus,this.created_by,this.created_by_company,this.block_id,this.created_at);

  PostsModel.fromJson(Map<String,dynamic> json)
  : id =json["id"],
    title=json["title"],
    photo=json["photo"],
    main_point=json["main_point"],
    body=json["body"],
    category_id=json["category_id"],
    related_news=json["related_news"],
    user_id=json["user_id"],
    recordstatus=json["recordstatus"],
    created_by=json["created_by"],
    created_by_company=json["created_by_company"],
    block_id=json["block_id"],
    created_at=json["created_at"];

}