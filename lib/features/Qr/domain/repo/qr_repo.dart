
import 'package:qr_code_scanner/qr_code_scanner.dart';
abstract class QrRepo{
  onQRViewCreated(  QRViewController controller) ;
  getQrData();
  getUserData();
}