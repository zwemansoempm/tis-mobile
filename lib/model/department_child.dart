class DepartmentChildModel {
  final int id;
  final String name;
  final int user_id;
  final int parent;
  final int recordstatus;

  const DepartmentChildModel(
    this.id,
    this.name,
    this.user_id,
    this.parent,
    this.recordstatus,
  );

  DepartmentChildModel.fromJson(dynamic json)
      : id = json["id"],
        name = json["name"] as String,
        user_id = json["user_id"],
        parent = json["parent"],
        recordstatus = json["recordstatus"];
}
