class JobDetailModel {
  final String title;
  final int customer_id;
  final int profile_id;
  final String description;
  final String skills;
  final String location;
  final int zipcode_id;
  final int township_id;
  final String nearest_station;
  final String employment_status;
  final String salary_type;
  final String salary;
  final String salary_remark;
  final String allowances;
  final String insurance;
  final String working_hours;
  final String holidays;
  final String jobnum;
  final int user_id;
  final int recordstatus;
  final String city_name;
  final String cusname;
  final String township_name;
  final String jobid;

  const JobDetailModel(
    this.title,
    this.customer_id,
    this.profile_id,
    this.description,
    this.skills,
    this.location,
    this.zipcode_id,
    this.township_id,
    this.nearest_station,
    this.employment_status,
    this.salary_type,
    this.salary,
    this.salary_remark,
    this.allowances,
    this.insurance,
    this.working_hours,
    this.holidays,
    this.jobnum,
    this.user_id,
    this.recordstatus,
    this.city_name,
    this.cusname,
    this.township_name,
    this.jobid,
  );

  JobDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        customer_id = json['customer_id'],
        profile_id = json['profile_id'],
        description = json['description'],
        skills = json['skills'],
        location = json['location'],
        zipcode_id = json['zipcode_id'],
        township_id = json['township_id'],
        nearest_station = json['nearest_station'],
        employment_status = json['employment_status'],
        salary_type = json['salary_type'],
        salary = json['salary'],
        salary_remark = json['salary_remark'],
        allowances = json['allowances'],
        insurance = json['insurance'],
        working_hours = json['working_hours'],
        holidays = json['holidays'],
        jobnum = json['jobnum'],
        user_id = json['user_id'],
        recordstatus = json['recordstatus'],
        city_name = json['city_name'],
        cusname = json['cusname'],
        township_name = json['township_name'],
        jobid = json['jobid'];
}
