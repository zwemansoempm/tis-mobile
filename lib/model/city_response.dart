import 'package:tis/model/city.dart';

class CityResponse {
  final List<CityModel> city;
  final String error;

  const CityResponse(this.city, this.error);
  CityResponse.fromJson(Map<String, dynamic> json)
      : city = (json["cities"] as List)
            .map((i) => new CityModel.fromJson(i))
            .toList(),
        error = "";

  CityResponse.withError(String errorValue)
      : city = List(),
        error = errorValue;
}
