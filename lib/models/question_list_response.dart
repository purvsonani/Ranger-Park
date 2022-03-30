import 'dart:convert';

import 'package:ranger_park/models/question_list.dart';

class QuestionListResponse {
  QuestionListResponse({
    this.error,
    this.data,
  });

  int? error;
  QuestionList? data;

  bool isSuccess() {
    return this.error == 0;
  }

  QuestionListResponse.withError({int? statusCode, int? error, String? msg})
      : this.error = error!;

  factory QuestionListResponse.fromRawJson(String str) =>
      QuestionListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionListResponse.fromJson(Map<String, dynamic> json) =>
      QuestionListResponse(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null ? null : QuestionList.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "data": data == null ? null : data?.toJson(),
      };
}
