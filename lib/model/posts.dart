class PostsModel{
  final int id;
  final String title;
  final String photo;
  final String mainPoint;
  final String body;
  final int categoryId;
  final String relatedNews;
  final int userId;
  final int recordStatus; 
  final String createdBy;
  final String createdByCompany;
  final int blockId;
  final String createdAt;
  final String cName;
  final String catName;
  final String colorCode;

  PostsModel(this.id,this.title,this.photo,this.mainPoint,this.body,this.categoryId,this.relatedNews,this.userId,this.recordStatus,this.createdBy,this.createdByCompany,this.blockId,this.createdAt,this.cName,this.catName,this.colorCode);//this.cName,

  PostsModel.fromJson(Map<String,dynamic> json)
  : id =json["id"],
    title=json["title"],
    photo=json["photo"],
    mainPoint=json["main_point"],
    body=json["body"],
    categoryId=json["category_id"],
    relatedNews=json["related_news"],
    userId=json["user_id"],
    recordStatus=json["recordstatus"],
    createdBy=json["created_by"],
    createdByCompany=json["created_by_company"],
    blockId=json["block_id"],
    createdAt=json["created_at"],
    cName=json["cname"],
    catName=json["cat_name"],
    colorCode=json["color_code"];

}