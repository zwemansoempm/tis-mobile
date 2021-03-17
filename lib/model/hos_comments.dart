class CommentsModel {
  int id;
  String name;
  String review_title;
  String dob;

  CommentsModel(this.id, this.name, this.review_title, this.dob);

  CommentsModel.fromJson(Map<String, dynamic> json) :
  id = json['id'],
  name = json['name'],
  review_title = json['review_title'],
  dob = json['dob'];

}
