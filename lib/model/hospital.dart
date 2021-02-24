class HospitalModel {
  final int hos_id;
  final int id;
  final int customer_id;
  final int pro_num;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String logo;
  final int townships_id;
  final String access;
  final String medical_department;
  final String specialist;
  final String gallery;
  final String details_info;
  final String subject;
  final String closed_day;
  final String facilities;
  final String website;
  final String special_features;
  final String congestion;
  final int activate;
  final int recordstatus;
  final String city_name;
  final String township_name;
  final String profilenumber;

  HospitalModel(
    this.hos_id, this.id, this.customer_id, this.pro_num, this.name, this.email, this.phone, this.address,
    this.logo, this.townships_id, this.access, this.medical_department, this.specialist, this.gallery,
    this.details_info, this.subject, this.closed_day, this.facilities, this.website, this.special_features,
    this.congestion, this.activate, this.recordstatus, this.city_name, this.township_name, this.profilenumber
    );


  HospitalModel.fromJson(Map<String, dynamic> json)
    : hos_id = json['hos_id'],
      id = json['id'],
      customer_id = json['customer_id'],
      pro_num = json['pro_num'],
      name = json['name'],
      email = json['email'],
      phone = json['phone'],
      address = json['address'],
      logo = json['logo'],
      townships_id = json['townships_id'],
      access = json['access'],
      medical_department = json['medical_department'],
      specialist = json['specialist'],
      gallery = json['gallery'],
      details_info = json['details_info'],
      subject = json['subject'],
      closed_day = json['closed_day'],
      facilities= json['facilities'],
      website = json['website'],
      special_features = json['special_features'],
      congestion = json['congestion'],
      activate = json['activate'],
      recordstatus = json['recordstatus'],
      city_name = json['city_name'],
      township_name = json['township_name'],
      profilenumber = json['profilenumber'];

}