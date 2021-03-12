class Categories {
  final List<CategoryModel> categories;
  final String error;

  const Categories(this.categories, this.error);

  Categories.fromJson(List<dynamic> json)
  : categories=(json as List).map((i) => new CategoryModel.fromJson(i)).toList(),
  error="";

  Categories.withError(String errorValue)
    : categories = List(),
      error = errorValue;  
}

class CategoryModel {
  int id;
  String name;
  String colorCode;

  CategoryModel({
    this.id,
    this.name,
    this.colorCode,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      :id = json['id'],
      name = json['name'],
      colorCode= json['color_code'];
  }

