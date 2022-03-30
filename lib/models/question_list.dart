import 'dart:convert';

class QuestionList {
  QuestionList({
    this.id,
    this.title,
    this.subText,
    this.queTitle,
    this.question,
    this.ansImage,
    this.imageVideo,
    this.imageVideoUrl,
    this.subtextTitle,
    this.subtextAnswer,
    this.btnText,
    this.type,
    this.mediaType,
    this.status,
    this.activityIcon,
    this.parkId,
    this.createdAt,
    this.updatedAt,
    this.activityIconUrl,
  });

  final int? id;
  final String? title;
  final String? subText;
  final String? queTitle;
  final String? question;
  final String? ansImage;
  final String? imageVideo;
  final String? imageVideoUrl;
  final String? subtextTitle;
  final String? subtextAnswer;
  final String? btnText;
  final int? type;
  final String? mediaType;
  final int? status;
  final String? activityIcon;
  final int? parkId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? activityIconUrl;

  factory QuestionList.fromRawJson(String str) =>
      QuestionList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        subText: json["sub_text"] == null ? null : json["sub_text"],
        queTitle: json["que_title"] == null ? null : json["que_title"],
        question: json["question"] == null ? null : json["question"],
        ansImage: json["ans_image"] == null ? null : json["ans_image"],
        imageVideo: json["image_video"] == null ? null : json["image_video"],
        imageVideoUrl:
            json["image_video_url"] == null ? null : json["image_video_url"],
        subtextTitle:
            json["subtext_title"] == null ? null : json["subtext_title"],
        subtextAnswer:
            json["subtext_answer"] == null ? null : json["subtext_answer"],
        btnText: json["btn_text"] == null ? null : json["btn_text"],
        type: json["type"] == null ? null : json["type"],
        mediaType: json["media_type"] == null ? null : json["media_type"],
        status: json["status"] == null ? null : json["status"],
        activityIcon:
            json["activity_icon"] == null ? null : json["activity_icon"],
        parkId: json["park_id"] == null ? null : json["park_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        activityIconUrl: json["activity_icon_url"] == null
            ? null
            : json["activity_icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "sub_text": subText == null ? null : subText,
        "que_title": queTitle == null ? null : queTitle,
        "question": question == null ? null : question,
        "ans_image": ansImage == null ? null : ansImage,
        "image_video": imageVideo == null ? null : imageVideo,
        "image_video_url": imageVideoUrl == null ? null : imageVideoUrl,
        "subtext_title": subtextTitle == null ? null : subtextTitle,
        "subtext_answer": subtextAnswer == null ? null : subtextAnswer,
        "btn_text": btnText == null ? null : btnText,
        "type": type == null ? null : type,
        "media_type": mediaType == null ? null : mediaType,
        "status": status == null ? null : status,
        "activity_icon": activityIcon == null ? null : activityIcon,
        "park_id": parkId == null ? null : parkId,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "activity_icon_url": activityIconUrl == null ? null : activityIconUrl,
      };
}
