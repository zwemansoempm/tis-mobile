import 'package:tis/model/job.dart';

class JobResponse {
  final List<JobModel> job;
  final String error;

  const JobResponse(this.job, this.error);
  JobResponse.fromJson(Map<String, dynamic> json)
      : job =
            (json["job"] as List).map((i) => new JobModel.fromJson(i)).toList(),
        error = "";

  JobResponse.withError(String errorValue)
      : job = List(),
        error = errorValue;
}
