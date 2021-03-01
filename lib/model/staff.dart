class StaffModel {
  int id;
  int profileId;
  String staff;
  String nursingStaff;
  String minNumStaff;
  String numStaff;
  String remarks;

  StaffModel(
    this.id,
    this.profileId,
    this.staff,
    this.nursingStaff,
    this.minNumStaff,
    this.numStaff,
    this.remarks,
  );

  StaffModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    profileId = json['profile_id'],
    staff = json['staff'],
    nursingStaff = json['nursing_staff'],
    minNumStaff = json['min_num_staff'],
    numStaff = json['num_staff'],
    remarks = json['remark'];

}