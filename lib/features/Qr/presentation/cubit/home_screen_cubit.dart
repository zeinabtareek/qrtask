
import 'dart:async';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:qrtask/core/bases/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrtask/injection_container.dart';

import '../../../../core/bases/base_state/base_cubit_state.dart';
import '../../../../core/bases/base_use_case.dart';
import '../../../Authentication/data/local/auth_local_data_source.dart';
import '../../../Authentication/data/models/res-models/user_model.dart';
import '../../domain/repo/qr_repo.dart';
import '../../domain/use_case/qr_repo_use_case.dart';

class HomeScreenCubit extends BaseCubit {
  final QrUseCase _useCase;
  HomeScreenCubit(
      this._useCase
      ) {  }
  final TextEditingController controller = TextEditingController();


  UserAuthModel? userModel; // Make userModel nullable

  @override
  FutureOr<void> init() async {
    if (!(state is BaseLoadingSate)) emit(BaseLoadingSate(true));

    initializeScanKit();
    await getUserData();
  }

  Future<void> getUserData() async {
    emit(const BaseLoadingSate(true));

    final result = await _useCase(const NoParameters());

    result.fold(
            (left) => emit(BaseErrorState(errorMessage: left.errorMsg)),
            (r) {
          userModel = r;
          emit(BaseCompletedState(data: r));
        }
    );
  }


  //  getUserData() async {
  //   emit(const BaseLoadingSate(true));
  //   await Future.delayed(const Duration(seconds: 1));
  //
  //   final result = await _useCase(const NoParameters());
  //
  //   result.fold(
  //           (left) => emit(BaseErrorState(errorMessage: left.errorMsg)),
  //           (r) =>  emit(BaseCompletedState(data: r))
  //   );
  // }







  ScanKitEncoder encoder = ScanKitEncoder(200, 200, ScanTypes.qRCode,
      backgroundColor: Colors.blue, color: Colors.red,margin: 2);

  ImageProvider? _image;
   late final ScanKit scanKit;
  late final StreamSubscription scanSubscription;
  String code = '';
  set image(ImageProvider? value) {
    _image = value;
    emit(BaseCompletedState(data: _image));
  }

  ImageProvider? get image => _image;
///[generate]
  generate() async {
    if (controller.text.isNotEmpty) {
      var bytes = await encoder.encode(controller.text);
      final provider = MemoryImage(bytes);
      image = provider;
    }
  }


  ///[Scan]


  void initializeScanKit() {
    scanKit = ScanKit();
    scanSubscription = scanKit.onResult.listen((val) {
      debugPrint("scanning result:${val.originalValue}  scanType:${val.scanType}");

        code = val.originalValue;
        emit(BaseCompletedState(data: code));
     });
  }
///[get user model]








   @override
  Future<void> close() async {
    await scanSubscription.cancel();
    scanKit.dispose();
    super.close();
  }

  // Start QR code scanning
  Future<void> startScan() async {
    try {
      await scanKit.startScan(
        scanTypes: ScanTypes.qRCode.bit |
        ScanTypes.code39.bit |
        ScanTypes.code128.bit,
      );
    } catch (e) {
      emit(BaseErrorState(errorMessage:'Failed to start scan: $e'));
      debugPrint(e.toString());
    }
  }



  @override
  get data => throw UnimplementedError();





  void onQRViewCreated(BuildContext context, QRViewController controller) {
    _useCase.onQRViewCreated(controller).then((scannedData) {
      showScannedDataDialog1(context, scannedData);
    });

  }




  void showScannedDataDialog1(BuildContext context, String scannedData) {
     showScannedDataDialog(  context,   scannedData);
    emit(BaseCompletedState(data: scannedData));
  }


  void showScannedDataDialog(BuildContext context, String scannedData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Scanned Data'),
          content: Text(scannedData),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }



}
