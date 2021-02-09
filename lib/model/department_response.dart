import 'package:tis/model/department.dart';
import 'dart:convert';

class DepartmentResponse {
  final List<DepartmentModel> department;

  final String error;

  DepartmentResponse(this.department, this.error);
  DepartmentResponse.fromJson(Map json)
      : department = (json["subjects"] as List)
            .map((i) => new DepartmentModel.fromJson(i))
            .toList(),
        error = "";

  DepartmentResponse.withError(String errorValue)
      : department = List(),
        error = errorValue;
}

