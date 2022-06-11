class UserModel {
  User? user;
  String? token;

  UserModel({this.user, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }


}








class User {
  User({
     this.id,
     this.name,
     this.email,
     this.role,
     this.image,
     this.approved,
     this.createdAt,
     this.country,
     this.gender,
     this.mobile,
     this.nameAr,
     this.profileImageChanged,
     this.longitude,
     this.latitude,
     this.city,
     this.currency,
  });

  int? id;
  String? name;
  String? email;
  String? role;
  String? image;
  String? approved;
  DateTime? createdAt;
  String? country;
  String? gender;
  String? mobile;
  String? nameAr;
  int? profileImageChanged;
  String? longitude;
  String? latitude;
  String? city;
  String? currency;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    image: json["image"],
    approved: json["approved"],
    createdAt: DateTime.parse(json["created_at"]),
    country: json["country"],
    gender: json["gender"],
    mobile: json["mobile"],
    nameAr: json["name_ar"],
    profileImageChanged: json["profile_image_changed"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    city: json["city"],
    currency: json["currency"],
  );

 
}
