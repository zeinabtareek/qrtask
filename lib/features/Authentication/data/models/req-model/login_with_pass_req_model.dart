import 'dart:convert';

import '../base_phone_req_model.dart';


abstract class LoginReqModel {}

class LoginWithPassReqModel implements LoginReqModel {
  BasePhoneReqModel phoneReqModel;
  String password;
  LoginWithPassReqModel({
    required this.phoneReqModel,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      ...phoneReqModel.toJson(),
      'password': password,
    };
  }

  // phone_code

  factory LoginWithPassReqModel.fromJson(String json) {
    final data = jsonDecode(json);
    return LoginWithPassReqModel(
      phoneReqModel: BasePhoneReqModel.froMap(data),
      password: data['password'],
    );
  }

  LoginWithPassReqModel copyWith({
    BasePhoneReqModel? phoneReqModel,
    String? password,
  }) {
    return LoginWithPassReqModel(
      phoneReqModel: phoneReqModel ?? this.phoneReqModel,
      password: password ?? this.password,
    );
  }
}
