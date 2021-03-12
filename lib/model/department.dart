import 'package:tis/model/department_child.dart';

class DepartmentModel {
  final int id;
  final String name;
  final int user_id;
  final int parent;
  final int recordstatus;

  final List<DepartmentChildModel> child;

  const DepartmentModel(this.id, this.name, this.user_id, this.parent, this.recordstatus, this.child);

  factory DepartmentModel.fromJson(dynamic json) {
    var tagObjsJson = json['child'] as List;
    List<DepartmentChildModel> _tags = tagObjsJson
        .map((tagJson) => DepartmentChildModel.fromJson(tagJson))
        .toList();

    return DepartmentModel(json["id"], json["name"], json["user_id"],
        json["parent"], json["recordstatus"], _tags);
  }

}