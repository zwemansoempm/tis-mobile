class NursingMailCommentModel {
  String name;
  String furigana;
  String bdate;
  String sex1;
  String postal;
  String division;
  String city; //selectedValue
  String township;
  String phone;
  String mail;

  String relation;
  String ttname;
  String sex;
  String years;
  String nursing;
  String fect;
  String hope;

  String townshipname;

  List<String> fav_mail;
  List<int> fav_id;
  List<String> fav_name;
  List<bool> arr_document;
  int selectedValue;
  List<bool> fav_name_copy;


  NursingMailCommentModel(
      this.name,
      this.furigana,
      this.bdate,
      this.sex1,
      this.postal,
      this.division,
      this.city,
      this.township,
      this.phone,
      this.mail,
      this.relation,
      this.ttname,
      this.sex,
      this.years,
      this.nursing,
      this.fect,
      this.hope,
      // this.townshipname,
      // this.fav_mail,
      // this.fav_id,
      // this.fav_name,
      // this.arr_document,
      // this.selectedValue,
      // this.fav_name_copy,
      );
}
