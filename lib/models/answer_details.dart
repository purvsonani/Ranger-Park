import 'dart:convert';

class AnswerDetails {
  AnswerDetails({
    this.id,
    this.questionId,
    this.answerImage,
    this.ans,
    this.imageTitle,
    this.answerImageUrl,
  });

  final int? id;
  final int? questionId;
  final String? answerImage;
  final int? ans;
  final String? imageTitle;
  final String? answerImageUrl;

  factory AnswerDetails.fromRawJson(String str) => AnswerDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnswerDetails.fromJson(Map<String, dynamic> json) => AnswerDetails(
    id: json["id"] == null ? null : json["id"],
    questionId: json["question_id"] == null ? null : json["question_id"],
    answerImage: json["answer_image"] == null ? null : json["answer_image"],
    ans: json["ans"] == null ? null : json["ans"],
    imageTitle: json["image_title"] == null ? null : json["image_title"],
    answerImageUrl: json["answer_image_url"] == null ? null : json["answer_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "question_id": questionId == null ? null : questionId,
    "answer_image": answerImage == null ? null : answerImage,
    "ans": ans == null ? null : ans,
    "image_title": imageTitle == null ? null : imageTitle,
    "answer_image_url": answerImageUrl == null ? null : answerImageUrl,
  };
}
