import 'dart:convert';

class QuestionModel {
  QuestionModel({
    this.id,
    this.type,
    this.mediaType,
    this.title,
    this.activityIcon,
    this.activityIconUrl,
  });

  final int? id;
  final int? type;
  final String? mediaType;
  final String? title;
  final String? activityIcon;
  final String? activityIconUrl;

  factory QuestionModel.fromRawJson(String str) => QuestionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json["id"] == null ? null : json["id"],
    type: json["type"] == null ? null : json["type"],
    mediaType: json["media_type"] == null ? null : json["media_type"],
    title: json["title"] == null ? null : json["title"],
    activityIcon: json["activity_icon"] == null ? null : json["activity_icon"],
    activityIconUrl: json["activity_icon_url"] == null ? null : json["activity_icon_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "type": type == null ? null : type,
    "media_type": mediaType == null ? null : mediaType,
    "title": title == null ? null : title,
    "activity_icon": activityIcon == null ? null : activityIcon,
    "activity_icon_url": activityIconUrl == null ? null : activityIconUrl,
  };
}
