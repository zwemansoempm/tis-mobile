class CityModel {
  final int id;
  final String city_name;
  // final String cityEng;
  // final double latitude;
  // final double longitude;

  // CityModel(
  //     this.id, this.cityName, this.cityEng, this.latitude, this.longitude);
  CityModel(this.id, this.city_name);

  // CityModel.fromJson(Map<String, dynamic> json)
  //     : id = json["id"],
  //       cityName = json["cityName"],
  //       cityEng = json["cityEng"],
  //       latitude = json["latitude"],
  //       longitude = json["longitude"];
  CityModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        city_name = json["city_name"];
}
