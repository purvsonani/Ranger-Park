import 'dart:convert';

import 'package:ranger_park/models/ranger_details.dart';

class RangerDetailsResponse {
  RangerDetailsResponse({
    this.error,
    this.rangerDetails,
  });

  int? error;
  RangerDetails? rangerDetails;

  bool isSuccess() {
    return this.error == 0;
  }

  RangerDetailsResponse.withError({int? error}) : this.error = error!;

  factory RangerDetailsResponse.fromJson(Map<String, dynamic> json) =>
      RangerDetailsResponse(
        error: json["error"] == null ? null : json["error"],
        rangerDetails:
            json["data"] == null ? null : RangerDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "data": rangerDetails == null ? null : rangerDetails?.toJson(),
      };
}
