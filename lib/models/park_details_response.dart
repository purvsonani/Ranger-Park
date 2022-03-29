import 'dart:convert';
import 'package:ranger_park/models/park_details.dart';

import 'question_model.dart';

class ParkDetailsResponse {
  ParkDetailsResponse({
    this.error,
    this.data,
    this.questionList,
  });

  int? error;
  String? message;
  ParkDetails? data;
  List<QuestionModel>? questionList;

  int? statusCode;

  bool isSuccess() {
    return this.error == 0;
  }

  ParkDetailsResponse.withError({int? error,})
      :
        this.error = error!;

  factory ParkDetailsResponse.fromRawJson(String str) =>
      ParkDetailsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParkDetailsResponse.fromJson(Map<String, dynamic> json) =>
      ParkDetailsResponse(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : ParkDetails.fromJson(json["data"]),
        questionList: json["question_list"] == null
            ? null
            : List<QuestionModel>.from(
            json["question_list"].map((x) => QuestionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "error": error == null ? null : error,
    "data": data == null ? null : data?.toJson(),
    "question_list": questionList == null
        ? null
        : List<dynamic>.from(questionList!.map((x) => x.toJson())),
  };
}
