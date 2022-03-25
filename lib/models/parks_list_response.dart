import 'dart:convert';

import 'package:ranger_park/models/park_details.dart';

class ParkListResponse {
  ParkListResponse({
    this.error,
    this.data,
  });

  int? error;
  List<ParkDetails>? data;

  bool isSuccess() {
    return this.error == 0;
  }

  ParkListResponse.withError({int? error}) : this.error = error!;

  factory ParkListResponse.fromRawJson(String str) =>
      ParkListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParkListResponse.fromJson(Map<String, dynamic> json) =>
      ParkListResponse(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<ParkDetails>.from(
                json["data"].map((x) => ParkDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
