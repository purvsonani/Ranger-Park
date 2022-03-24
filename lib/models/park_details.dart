// class ParkDetails{
//
//     String
//
//   ParkDetails({});
// }



class Data{
  int? id;
  String? name;
  String? city;
  String? state;
  String? icon;
  String? image;
  String? description;
  String? location;
  int? ranger;
  int? region;
  double? latitude;
  double? longitude;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<String>? imageUrl;
  String? iconUrl;

  Data(
      {this.id,
        this.name,
        this.city,
        this.state,
        this.icon,
        this.image,
        this.description,
        this.location,
        this.ranger,
        this.region,
        this.latitude,
        this.longitude,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.imageUrl,
        this.iconUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    state = json['state'];
    icon = json['icon'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    ranger = json['ranger'];
    region = json['region'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    imageUrl = json['image_url'].cast<String>();
    iconUrl = json['icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['state'] = this.state;
    data['icon'] = this.icon;
    data['image'] = this.image;
    data['description'] = this.description;
    data['location'] = this.location;
    data['ranger'] = this.ranger;
    data['region'] = this.region;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['image_url'] = this.imageUrl;
    data['icon_url'] = this.iconUrl;
    return data;
  }
}
