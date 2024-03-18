//
// import '../base_model.dart';
//
// class RegisterWithOTpModel extends BaseResModel<dynamic> {
//   int? status;
//   RegisterData? data;
//   String? message;
//
//   RegisterWithOTpModel({this.status, this.data, this.message});
//   //
//   RegisterWithOTpModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new RegisterData.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
//
//   @override
//   // TODO: implement statusNumber
//   int get statusNumber => status!;
//   String get token=>data?.token.toString()??'';
//   }
//
//
// class RegisterData {
//   String? id;
//   String ?name;
//   String  ?phone;
//   String ?email;
//   bool? isActive;
//   String? lang;
//   String? token;
//   bool? isDataCompleted;
//   String? branch;
//   String? createdAt;
//
//   RegisterData(
//       {this.id,
//         this.name,
//         this.phone,
//         this.email,
//         this.isActive,
//         this.lang,
//         this.token,
//         this.isDataCompleted,
//         this.branch,
//         this.createdAt});
//
//   RegisterData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     phone = json['phone'];
//     email = json['email'];
//     isActive = json['is_active'];
//     lang = json['lang'];
//     token = json['token'];
//     isDataCompleted = json['is_data_completed'];
//     branch = json['branch'];
//     createdAt = json['created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['is_active'] = this.isActive;
//     data['lang'] = this.lang;
//     data['token'] = this.token;
//     data['is_data_completed'] = this.isDataCompleted;
//     data['branch'] = this.branch;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }
