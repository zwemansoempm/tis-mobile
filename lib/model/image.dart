class ImageModel {
  int id;
  int profileId;
  String photo;
  String title;
  String description;

  ImageModel(
    this.id,
    this.profileId,
    this.photo,
    this.title,
    this.description,
  );

  ImageModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    profileId = json['profile_id'],
    photo = json['photo'],
    title = json['title'],
    description = json['description'];

}