import 'dart:convert';
import 'package:ranger_park/models/rewards_details.dart';

class RewardsResponse {
  RewardsResponse({
    this.error,
    this.rewardDetails,
  });

  int? error;
  List<RewardsDetails>? rewardDetails;

  bool isSuccess() {
    return this.error == 0;
  }

  RewardsResponse.withError({int? statusCode, int? error, String? msg})
      : this.error = error!;

  factory RewardsResponse.fromRawJson(String str) =>
      RewardsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RewardsResponse.fromJson(Map<String, dynamic> json) =>
      RewardsResponse(
        error: json["error"] == null ? null : json["error"],
        rewardDetails: json["data"] == null
            ? null
            : List<RewardsDetails>.from(
                json["data"].map((x) => RewardsDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "data": rewardDetails == null
            ? null
            : List<dynamic>.from(rewardDetails!.map((x) => x.toJson())),
      };
}
