import 'dart:convert';

class RangerDetails {
  RangerDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageUrl,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? description;
  final String? image;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? imageUrl;

  factory RangerDetails.fromJson(Map<String, dynamic> json) => RangerDetails(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        description: json["description"] == null ? null : json["description"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "image_url": imageUrl == null ? null : imageUrl,
      };
}
