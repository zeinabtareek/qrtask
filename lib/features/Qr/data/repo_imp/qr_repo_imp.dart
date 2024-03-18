




import 'package:qr_code_scanner/src/qr_code_scanner.dart';
import 'package:qrtask/features/Qr/domain/repo/qr_repo.dart';

import '../services/remote/remote_qr.dart';

class QrRepoImp implements QrRepo{

  RemoteQrDataSource _data;
  QrRepoImp(this._data);
  @override
  getQrData() async {
    return await _data.getQrData();

  }


  @override
  getUserData() {
    return _data.getUserData();
  }
  @override
  onQRViewCreated(QRViewController controller) {
    return _data.onQRViewCreated(controller);  }
}