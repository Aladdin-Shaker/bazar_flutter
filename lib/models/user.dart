class User {
  final int id;
  // final String? email;
  // final int? phone;
  // final String? firstname;
  // final String? lastname;
  final String fullname;
  // final String? fcmToken;
  // final String? imageUrlId;
  // final int? status;
  // final String? gender;
  // final String? bio;
  // final String? description;
  // final String? country;
  // final String? city;
  // final String? address;
  // final String? facebook;
  // final String? instagram;
  // final String? twitter;
  final String imageUrl;

  User(
    this.id,
    // this.email,
    // this.phone,
    // this.firstname,
    // this.lastname,
    this.fullname,
    // this.fcmToken,
    // this.imageUrlId,
    // this.status,
    // this.gender,
    // this.bio,
    // this.description,
    // this.country,
    // this.city,
    // this.address,
    // this.facebook,
    // this.instagram,
    // this.twitter,
    this.imageUrl,
  );

  //  constructor, for constructing a new User instance from a map structure
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        // email = json['email'] as String?,
        // phone = json['phone'] as int?,
        // firstname = json['firstname'] as String?,
        // lastname = json['lastname'] as String?,
        fullname = json['fullname'] as String,
        // fcmToken = json['fcmToken'] as String?,
        // imageUrlId = json['imageUrlId'] as String?,
        // status = json['status'] as int?,
        // gender = json['gender'] as String?,
        // bio = json['bio'] as String?,
        // description = json['description'] as String?,
        // country = json['country'] as String?,
        // city = json['city'] as String?,
        // address = json['address'] as String?,
        // facebook = json['facebook'] as String?,
        // instagram = json['instagram'] as String?,
        // twitter = json['twitter'] as String?,
        imageUrl = json['imageUrl'] as String;

  // method?, which converts a User instance into a map.

  Map<String, dynamic> toJson() => {
        'id': id,
        // 'email': email,
        // 'phone': phone,
        // 'firstname': firstname,
        // 'lastname': lastname,
        'fullname': fullname,
        // 'fcmToken': fcmToken,
        // 'imageUrlId': imageUrlId,
        // 'status': status,
        // 'gender': gender,
        // 'bio': bio,
        // 'description': description,
        // 'country': country,
        // 'city': city,
        // 'address': address,
        // 'facebook': facebook,
        // 'instagram': instagram,
        // 'twitter': twitter,
        'imageUrl': imageUrl,
      };
}
