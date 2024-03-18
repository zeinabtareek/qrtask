




import 'package:dartz/dartz.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrtask/features/Qr/data/repo_imp/qr_repo_imp.dart';
import 'package:qrtask/helpers/auth_helper/data_state.dart';

import '../../../../core/bases/base_use_case.dart';
import '../../../../injection_container.dart';
import '../../../Authentication/data/local/auth_local_data_source.dart';
import '../../../Authentication/data/models/res-models/user_model.dart';
import '../../data/model/qr_model.dart';


class QrUseCase implements BaseUseCase<UserAuthModel, NoParameters> {
  final QrRepoImp _data;
  QrUseCase(this._data);


  // @override
  // Future<Either<DataFailedErrorMsg, QRModel>> call(NoParameters parameters) {
  //   return _data.getQrData().then((result) => Right(result)).catchError((error) {
  //     return Left(DataFailedErrorMsg('Failed to get QR data: $error', null));
  //   });
  // }

  Future<String> onQRViewCreated(QRViewController controller) async {
    try {
      final scannedData = await _data.onQRViewCreated(controller);
      return scannedData;
    } catch (error) {
      return '';
    }
  }



  @override
  Future<Either<DataFailedErrorMsg, UserAuthModel>> call(NoParameters params) async {
     final result = await _data.getUserData();
    print('User in Use Case ${result?.email}');

    try {
      return Right(result!);
    } catch (failure) {
      return Left(DataFailedErrorMsg('Error signing out: $failure', ''));
    }
  }
}



