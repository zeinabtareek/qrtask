import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../../helpers/auth_helper/data_state.dart';
import '../../../../../injection_container.dart';
import '../../../../Authentication/data/local/auth_local_data_source.dart';
import '../../../../Authentication/data/models/res-models/user_model.dart';
import '../../model/qr_model.dart';

abstract class RemoteQrDataSource {
  Future<QRModel> getQrData();

  // Future<UserAuthModel>
  getUserData();

  onQRViewCreated(QRViewController controller);
}

class RemoteQrDataSourceImp implements RemoteQrDataSource {
  @override
  Future<QRModel> getQrData() {
    throw UnimplementedError();
  }

  ///Using qr camera pkage
  @override
  onQRViewCreated(QRViewController controller) {}

  @override
  getUserData() async {
    var user =   locator<BaseAuthLocalDataSource>().getUserModel();
    print('User Local ${user?.email}');
     return  user;
  }

  ///Using qr scanner
//   @override
//   onQRViewCreated(QRViewController controller) {
//     controller.scannedDataStream.listen((barcode) {
//       String? scanData = barcode.code;
//
//        try {
//         QRModel qrModel = QRModel.fromJson(json.decode(scanData!));
//         print(qrModel);
//       } catch (error) {
//         print("Error decoding scanned data: $error");
//       }
//     });
//   }
}
