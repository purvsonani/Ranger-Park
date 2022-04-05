import 'dart:convert';

class RewardsDetails {
  RewardsDetails({
    this.id,
    this.name,
    this.parksNumber,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageUrl,
    this.bgImageUrl,
  });

  final int? id;
  final String? name;
  final int? parksNumber;
  final String? image;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic? deletedAt;
  final String? imageUrl;
  final String? bgImageUrl;

  factory RewardsDetails.fromRawJson(String str) =>
      RewardsDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RewardsDetails.fromJson(Map<String, dynamic> json) => RewardsDetails(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        parksNumber: json["parks_number"] == null ? null : json["parks_number"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        bgImageUrl: json["bg_image_url"] == null ? null : json["bg_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "parks_number": parksNumber == null ? null : parksNumber,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "image_url": imageUrl == null ? null : imageUrl,
        "bg_image_url": bgImageUrl == null ? null : bgImageUrl,
      };
}
