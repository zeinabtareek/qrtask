import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../base_model.dart';
import 'user_model.dart';

abstract class RegisterResModel {}

class QrTaskAuthorizedResModel extends BaseResModel<QrTaskAuthorizedResModel>
    implements RegisterResModel {
  User? user;//package:firebase_auth/firebase_auth.dart
  // UserAuthModel? user;

  QrTaskAuthorizedResModel(
    this.user, {
    super.msg,
    super.status,
  });

  // factory QrTaskAuthorizedResModel.fromJson(Map<String, dynamic> json) {
  //
  //   return QrTaskAuthorizedResModel(
  //     // json["data"] != null ? User.fromMap(json["data"]) : null,
  //     // json["data"] != null ? UserAuthModel.fromMap(json["data"]) : null,
  //     msg: json["message"],
  //     status: json['status'],
  //   );
  // }

  // Map<String, dynamic> toMap() => {"data": user?.toJson()};
  // String toJson() => json.encode(toMap());

  @override
  QrTaskAuthorizedResModel? get data => this;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QrTaskAuthorizedResModel && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'VipAuthorizedResModel(user: $user)';

  bool get isSuccess => user != null && status == 200;

  @override
  int get statusNumber => status!;
}
