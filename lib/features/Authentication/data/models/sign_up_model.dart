

import 'base_phone_req_model.dart';

abstract class SignUpReqModel {}

class QrSignUpReqModel extends SignUpReqModel {
  String? fName;
  String ?lName;
  String ?email;
  String ?deviceType;
  String ?deviceToken;
  String ?phone;
  String ?password;
  String ?referralCode;
   QrSignUpReqModel({
      this.fName,
      this.lName,
       this.email,
      this.phone,
      this.deviceToken,
      this.deviceType,
      this.password,
      this.referralCode,
   });

  Map<String, dynamic> toJson() {
    return {

      'email': email,
      'referral_code': referralCode,
      'first_name': fName,
      'last_name': lName,
      'device_type': deviceType,
      'device_token': deviceToken,
       // ...phoneReqModel.toJson(),
      'phone': phone,
      'password': password,
      'password_confirmation': password,
     };
  }
}