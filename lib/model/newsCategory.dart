import 'package:tis/model/posts.dart';

class NewsCategory {
  String catId;
  List<PostsModel> bigNews;
  List<PostsModel> moreNews;
  Cat cat;
  List<List<List<PostsModel>>> newsList;

  final String error;

  NewsCategory({
    this.catId,
    this.cat,
    this.bigNews,
    this.moreNews,
    this.error,
    this.newsList
  });

  // factory NewsCategory.fromJson(Map<String, dynamic> json) {
  //   var news = json["bigNews"] as List;
  //   return NewsCategory(
  //     catId : json["cat_id"],
  //     cat : Cat.fromJson(json["cat"]),
  //     bigNews : news.map((e) => PostsModel.fromJson(e) ).toList(),
  //   );
    
  //   //json.map((e) => PostsModel.fromJson(e)).toList(),
  // }

  NewsCategory.fromJson(Map<String, dynamic> json) :
    catId = json["cat_id"],
    cat = Cat.fromJson(json["cat"]),
    bigNews = (json["bigNews"] as List).map((e) => PostsModel.fromJson(e)).toList(),
    moreNews = (json["moreNews"] as List).map((e) => PostsModel.fromJson(e)).toList(),
    newsList = (json["newslist"] as List).map((e) => 
      (e as List).map((f) => (f as List).map((g) => PostsModel.fromJson(g)).toList() ).toList() ).toList(),
    error="";
  
  NewsCategory.withError(String errorValue)
      : catId = "",
        cat = new Cat(),
        bigNews = List(),
        moreNews = List(),
        newsList = List(),
        error = errorValue;

}

class Cat {
  String name;
  String colorCode;

  Cat({
    this.name,
    this.colorCode,
  });

  Cat.fromJson(Map<String , dynamic> json) 
  : name = json["name"],
    colorCode = json["color_code"];

}

