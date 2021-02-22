class CustomerModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String logo;
  final String phone;
  final String address;
  final int type_id;
  final int township_id;
  final int user_id;
  final int confirm_user_id;
  final int status;
  final int pro_num;
  final int recordstatus;

  CustomerModel(
      this.id,
      this.name,
      this.email,
      this.password,
      this.logo,
      this.phone,
      this.address,
      this.type_id,
      this.township_id,
      this.user_id,
      this.confirm_user_id,
      this.status,
      this.pro_num,
      this.recordstatus);

  CustomerModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        password = json["password"],
        logo = json["logo"],
        phone = json["phone"],
        address = json["address"],
        type_id = json["type_id"],
        township_id = json["township_id"],
        user_id = json["user_id"],
        confirm_user_id = json["confirm_user_id"],
        status = json["status"],
        pro_num = json["pro_num"],
        recordstatus = json["recordstatus"];
}
