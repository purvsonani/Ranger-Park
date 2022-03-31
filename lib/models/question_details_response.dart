import 'dart:convert';

import 'package:ranger_park/models/question_details.dart';

class QuestionDetailsResponse {
  QuestionDetailsResponse({
    this.error,
    this.data,
  });

  int? error;
  QuestionDetails? data;

  bool isSuccess() {
    return this.error == 0;
  }

  QuestionDetailsResponse.withError({int? statusCode, int? error, String? msg})
      : this.error = error!;

  factory QuestionDetailsResponse.fromRawJson(String str) =>
      QuestionDetailsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      QuestionDetailsResponse(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null ? null : QuestionDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "data": data == null ? null : data?.toJson(),
      };
}
