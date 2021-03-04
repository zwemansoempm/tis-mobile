import 'dart:convert';

import 'package:tis/model/job_detail.dart';

class JobDetailResponse {
  final JobDetailModel job;
  final String error;

  JobDetailResponse(this.job, this.error);
  JobDetailResponse.fromJson(Map<String, dynamic> json)
      : job = JobDetailModel(
            json['title'],
            json['customer_id'],
            json['profile_id'],
            json['description'],
            json['skills'],
            json['location'],
            json['zipcode_id'],
            json['township_id'],
            json['nearest_station'],
            json['employment_status'],
            json['salary_type'],
            json['salary'],
            json['salary_remark'],
            json['allowances'],
            json['insurance'],
            json['working_hours'],
            json['holidays'],
            json['jobnum'],
            json['user_id'],
            json['recordstatus'],
            json['city_name'],
            json['cusname'],
            json['township_name'],
            json['jobid']),
        error = "";

  JobDetailResponse.withError(String errorValue)
      : job = null,
        error = errorValue;
}
