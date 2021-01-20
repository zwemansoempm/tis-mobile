import 'dart:convert';

class Categories {
  List<CategoryModel> categories;

  Categories({this.categories});

  factory Categories.fromJson(List<dynamic> categories){
    final tempData = categories.map((e) => CategoryModel.fromJson(e)).toList();
    return Categories( categories: tempData);
  }
}

List<CategoryModel> categoriesFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

//String photosToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  int id;
  String name;
  String colorCode;

  CategoryModel({
    this.id,
    this.name,
    this.colorCode,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      id : json['id'],
      name : json['name'],
      colorCode: json['color_code'],
    );
  }

}