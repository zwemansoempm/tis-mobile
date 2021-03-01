import 'dart:convert';

class CooperateMedical {
  int profileId;
  String clinicalSubject;
  String details;
  String medicalExpense;
  String remark;

  CooperateMedical(
    this.profileId,
    this.clinicalSubject,
    this.details,
    this.medicalExpense,
    this.remark,
  );

  CooperateMedical.fromJson(Map<String, dynamic> json) :
    profileId = json['profile_id'],
    clinicalSubject = json['clinical_subject'],
    details = json['details'],
    medicalExpense = json['medical_expense'],
    remark = json['remark'];
}