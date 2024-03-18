import 'dart:convert';

 import 'package:firebase_auth/firebase_auth.dart';

import '../base_id_value_model.dart';
import 'country_model.dart';

// class UserAuthModel {
//   String? id;
//   String? phoneCode;
//   String? phone;
//   String? email;
//   String? img;
//   String? firstName;
//   String? lastName;
//   String? username;
//   String? address;
//   String? identityNo;
//   bool? isActive;
//   bool? isBanned;
//   bool? isDataCompleted;
//   int? rating;
//   dynamic lang;
//   dynamic theme;
//   dynamic profileCompletedRatio;//profile_completed_ratio
//   Country? country;
//   String? token;
//   String? wallet;
//   DateTime? createdAt;
//   String? ridesCount;
//   UserAuthModel({
//     this.id,
//     this.phoneCode,
//     this.phone,
//     this.email,
//     this.img,
//     this.firstName,
//     this.lastName,
//     this.username,
//     this.address,
//     this.profileCompletedRatio,//profile_completed_ratio
//     this.identityNo,
//     this.isActive,
//     this.isBanned,
//     this.isDataCompleted,
//     this.wallet,
//     this.rating,
//     required this.lang,
//     required this.theme,
//     this.country,
//     this.token,
//     this.createdAt,
//     this.ridesCount,
//   });
//
//   factory UserAuthModel.fromMap(Map<String, dynamic> json, {String? msg}) {
//     return UserAuthModel(
//       id: json["id"],
//       phoneCode: json["phone_code"],
//       ridesCount: json['rides_count'].toString(),
//       phone: json["phone"],
//       email: json["email"],
//       img: json["img"],
//       firstName: json["first_name"],
//       lastName: json["last_name"],
//       username: json["username"],
//       address: json["address"],
//       profileCompletedRatio: json["profile_completed_ratio"],
//       identityNo: json["identity_no"],
//       isActive: json["is_active"],
//       isBanned: json["is_banned"],
//       wallet: json["wallet"].toString(),
//       isDataCompleted: json["is_data_completed"],
//       rating: json["rating"],
//       lang: json["lang"],
//       theme: json["theme"],
//       country:
//       json["country"] == null ? null : Country.fromMap(json["country"]),
//       token: json["token"],
//       createdAt: json["created_at"] == null
//           ? null
//           : DateTime.parse(json["created_at"]),
//     );
//   }
//
//   Map<String, dynamic> toMap() => {
//     "rides_count": ridesCount,
//     "id": id,
//     "phone_code": phoneCode,
//     "phone": phone,
//     "email": email,
//     "img": img,
//     "first_name": firstName,
//     "profile_completed_ratio": profileCompletedRatio,
//     "last_name": lastName,
//     "username": username,
//     "address": address,
//     "identity_no": identityNo,
//     "is_active": isActive,
//     "is_banned": isBanned,
//     "is_data_completed": isDataCompleted,
//     "rating": rating,
//     "lang": lang,
//     "theme": theme,
//     "wallet": wallet,
//     "country": country?.toMap(),
//     "token": token,
//     "created_at": createdAt?.toIso8601String(),
//   };
//
//   String toJson() => json.encode(toMap());
//
//   factory UserAuthModel.fromJson(String jsn) =>
//       UserAuthModel.fromMap(json.decode(jsn));
//
//   setEmil(String emil) => email = emil;
//
//   setIdentityNo(String identityNo) => this.identityNo = identityNo;
//     setToken(String newToken) {
//     token = newToken;
//   }
//   String get tkn => token!;
//   String? get viewName => "$firstName $lastName";
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//
//     return other is UserAuthModel &&
//         other.id == id &&
//         other.phoneCode == phoneCode &&
//         other.phone == phone &&
//         other.email == email &&
//         other.img == img &&
//         other.firstName == firstName &&
//         other.lastName == lastName &&
//         other.username == username &&
//         other.address == address &&
//         other.identityNo == identityNo &&
//         other.isActive == isActive &&
//         other.isBanned == isBanned &&
//         other.isDataCompleted == isDataCompleted &&
//         other.rating == rating &&
//         other.lang == lang &&
//         other.theme == theme &&
//         other.wallet == wallet &&
//         other.country == country &&
//         other.token == token &&
//         other.profileCompletedRatio == profileCompletedRatio &&
//         other.createdAt == createdAt;
//   }
//
//   @override
//   int get hashCode {
//     return id.hashCode ^
//     phoneCode.hashCode ^
//     phone.hashCode ^
//     email.hashCode ^
//     img.hashCode ^
//     firstName.hashCode ^
//     lastName.hashCode ^
//     username.hashCode ^
//     address.hashCode ^
//     identityNo.hashCode ^
//     isActive.hashCode ^
//     profileCompletedRatio.hashCode ^
//     isBanned.hashCode ^
//     isDataCompleted.hashCode ^
//     rating.hashCode ^
//     lang.hashCode ^
//     theme.hashCode ^
//     country.hashCode ^
//     wallet.hashCode ^
//     token.hashCode ^
//     createdAt.hashCode;
//   }
//
//   @override
//   String toString() {
//     return 'User(id: $id, phoneCode: $phoneCode,profileCompletedRatio: $profileCompletedRatio, phone: $phone, email: $email, img: $img, firstName: $firstName, lastName: $lastName, username: $username, address: $address, identityNo: $identityNo, isActive: $isActive, isBanned: $isBanned, isDataCompleted: $isDataCompleted, rating: $rating, lang: $lang, theme: $theme,wallet: $wallet, country: $country, token: $token, createdAt: $createdAt)';
//   }
//
//   UserAuthModel copyWith({
//     String? id,
//     String? phoneCode,
//     String? phone,
//     String? email,
//     String? img,
//     String? firstName,
//     String? lastName,
//     String? username,
//     String? address,
//     String? identityNo,
//     bool? isActive,
//     bool? isBanned,
//     bool? isDataCompleted,
//     int? rating,
//     dynamic? lang,
//     dynamic? theme,
//     Country? country,
//     String? token,
//     DateTime? createdAt,
//     String? ridesCount,
//     num? profileCompletedRatio,
//
//   }) {
//     return UserAuthModel(
//       id: id ?? this.id,
//       phoneCode: phoneCode ?? this.phoneCode,
//       phone: phone ?? this.phone,
//       email: email ?? this.email,
//       img: img ?? this.img,
//       firstName: firstName ?? this.firstName,
//       lastName: lastName ?? this.lastName,
//       username: username ?? this.username,
//       address: address ?? this.address,
//       identityNo: identityNo ?? this.identityNo,
//       isActive: isActive ?? this.isActive,
//       isBanned: isBanned ?? this.isBanned,
//       isDataCompleted: isDataCompleted ?? this.isDataCompleted,
//       rating: rating ?? this.rating,
//       lang: lang ?? this.lang,
//       profileCompletedRatio: profileCompletedRatio ?? this.profileCompletedRatio,
//       theme: theme ?? this.theme,
//       country: country ?? this.country,
//       token: token ?? this.token,
//       createdAt: createdAt ?? this.createdAt,
//       ridesCount: ridesCount ?? this.ridesCount,
//     );
//   }
// }



import 'dart:convert';

 import 'country_model.dart';


UserAuthModel userAuthModelFromJson(String str) =>
    UserAuthModel.fromMap(json.decode(str));

String userAuthModelToJson(UserAuthModel data) => json.encode(data.toJson());


class UserAuthModel {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  bool? isActive;
  bool? isBanned;
  bool? isDataCompleted;
  String? token;
  DateTime? createdAt;

  UserAuthModel({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phone,
    this.isActive,
    this.isBanned,
    this.isDataCompleted,
    this.token,
    this.createdAt,
  });
  setPhone(String newPhone) {
    phone = newPhone;
  }
  factory UserAuthModel.fromMap(Map<String, dynamic> json) => UserAuthModel(
    id: json["id"],
    firstName: json["name"],
    lastName: json["last_name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    isActive: json["is_active"],
    isBanned: json["is_banned"],
    isDataCompleted: json["is_data_completed"],
    token: json["token"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": firstName,
    "last_name": lastName,
    "username": username,
    "email": email,
    "phone": phone,
    "is_active": isActive,
    "is_banned": isBanned,
    "is_data_completed": isDataCompleted,
    "token": token,
    "created_at": createdAt?.toIso8601String(),
  };

  factory UserAuthModel.fromJson(String str) =>
      UserAuthModel.fromMap(json.decode(str));

  factory UserAuthModel.fromFirebaseUser(User user) {
    return UserAuthModel(
      id: user.uid,
      email: user.email,
      firstName: user.displayName,
      phone: user.phoneNumber,
      token: user.uid,
      createdAt: DateTime.now(),
      );
  }


  setEmil(String emil) => email = emil??'';

   setToken(String newToken) {
    token = newToken;
  }
  String get tkn => token!;
  String? get viewName => "$firstName ";
  // factory UserAuthModel.fromJson(String str) =>
  //     UserAuthModel.fromMap(json.decode(str));
// }
}
