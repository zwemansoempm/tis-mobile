import 'package:tis/model/city.dart';
import 'package:tis/model/occupation.dart';

class CityOccListResponse {
  final List<CityModel> cityList;
  final List<OccupationModel> occList;
  final String error;

  const CityOccListResponse(this.cityList, this.occList, this.error);
  CityOccListResponse.fromJson(Map<String, dynamic> json)
      : cityList = (json["city"] as List)
            .map((i) => new CityModel.fromJson(i))
            .toList(),
        occList = (json["occupations"] as List)
            .map((i) => new OccupationModel.fromJson(i))
            .toList(),
        error = "";

  CityOccListResponse.withError(String errorValue)
      : cityList = List(),
        occList = List(),
        error = errorValue;
}
