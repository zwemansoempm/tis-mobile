import 'package:tis/model/township.dart';

class TownshipResponse {
  final List<TownshipModel> township;

  final String error;

  TownshipResponse(this.township, this.error);
  TownshipResponse.fromJson(Map<String, dynamic> json)
      : township = (json["getTownships"] as List)
            .map((i) => new TownshipModel.fromJson(i))
            .toList(),
        error = "";

  TownshipResponse.withError(String errorValue)
      : township = List(),
        error = errorValue;
}
