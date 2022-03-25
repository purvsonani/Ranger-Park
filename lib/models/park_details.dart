// class ParkDetails{
//
//     String
//
//   ParkDetails({});
// }



import 'dart:convert';

class ParkDetails{
  final int? id;
  final String? name;
  final String? city;
  final String? state;
  final String? icon;
  final String? image;
  final String? description;
  final String? location;
  final int? ranger;
  final int? region;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic? deletedAt;
  final List<String>? imageUrl;
  final String? iconUrl;
  final String? rangerImage;
  final String? rangerName;
  final double? latitude;
  final double? longitude;

  ParkDetails({
    this.id,
    this.name,
    this.city,
    this.state,
    this.icon,
    this.image,
    this.description,
    this.location,
    this.ranger,
    this.region,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageUrl,
    this.iconUrl,
    this.rangerImage,
    this.rangerName,
    this.latitude,
    this.longitude,
  });

  factory ParkDetails.fromRawJson(String str) =>
      ParkDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParkDetails.fromJson(Map<String, dynamic> json) =>
      ParkDetails(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        icon: json["icon"] == null ? null : json["icon"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        location: json["location"] == null ? null : json["location"],
        ranger: json["ranger"] == null ? null : json["ranger"],
        region: json["region"] == null ? null : json["region"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        imageUrl: json["image_url"] == null
            ? null
            : List<String>.from(json["image_url"].map((x) => x)),
        iconUrl: json["icon_url"] == null ? null : json["icon_url"],
        rangerImage: json["ranger_image"] == null ? null : json["ranger_image"],
        rangerName: json["ranger_name"] == null ? null : json["ranger_name"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
      );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "icon": icon == null ? null : icon,
    "image": image == null ? null : image,
    "description": description == null ? null : description,
    "location": location == null ? null : location,
    "ranger": ranger == null ? null : ranger,
    "region": region == null ? null : region,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "image_url": imageUrl == null
        ? null
        : List<dynamic>.from(imageUrl!.map((x) => x)),
    "icon_url": iconUrl == null ? null : iconUrl,
    "ranger_image": rangerImage == null ? null : rangerImage,
    "ranger_name": rangerName == null ? null : rangerName,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}
