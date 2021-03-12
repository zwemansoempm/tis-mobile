import 'package:tis/model/occupation_child.dart';

class OccupationModel {
  final int id;
  final String name;
  final int user_id;
  final int parent;
  final int recordstatus;
  //final OccupationChildModel child;
  final List<OccupationChildModel> child;

  const OccupationModel(this.id, this.name, this.user_id, this.parent,
      this.recordstatus, this.child);

//   OccupationModel.fromJson(Map json)
//       : id = json["id"].toString(),
//         name = json["name"] as String,
//         user_id = json["user_id"].toString(),
//         parent = json["parent"].toString(),
//         recordstatus = json["recordstatus"].toString(),
//         child = OccupationChildModel.fromJson(json['child'] as List);
// }

//  var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
// List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();

// var tagObjsJson = json['tags'] as List;
//List<Tag> _tags = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();

  factory OccupationModel.fromJson(dynamic json) {
    var tagObjsJson = json['child'] as List;
    List<OccupationChildModel> _tags = tagObjsJson
        .map((tagJson) => OccupationChildModel.fromJson(tagJson))
        .toList();

    return OccupationModel(json["id"], json["name"], json["user_id"],
        json["parent"], json["recordstatus"], _tags);
  }
}
