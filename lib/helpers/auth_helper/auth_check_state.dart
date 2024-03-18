






 import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_context/one_context.dart';

import '../../core/utils/snackbar/snack_bar.dart';
import '../../features/Authentication/data/models/base_model.dart';

import 'data_state.dart';



void checkStatus<T extends BaseResModel>(
    DataState<T> state, {
      Function(T? res)? onSuccess,
      Function(T? error)? onError,
      bool showErrorToast = true,
      bool showSuccessToast = false,
    }) {
  if (state is DataSuccess<T>) {
    if (state.errorMsg == null || state.errorMsg!.isEmpty) {
      _handelSuccess<T>(showSuccessToast, state, onSuccess);
    } else {
      _handelError<T>(showErrorToast, state, onError);
    }
  } else if (state is DataFailed<T>) {
    _handelError<T>(showErrorToast, state, onError);
  } else if (state is DataFailedErrorMsg<T>) {
    _handelError<T>(showErrorToast, state, onError);
  } else {
    _handelError<T>(showErrorToast, state, onError);
  }
}

void _handelSuccess<T extends BaseResModel>(
    bool showSuccessToast,
    DataSuccess<dynamic> state,
    Function(T? res)? onSuccess,
    ) {
  if (showSuccessToast) {
    // showSnackBar('',state.data?.msg ?? "" ,isError: false);
    showSnackBarMessage(  OneContext().context!,
      isError: false,
      message:'success'
      // message: state.data?.msg ?? "",
    );


  }
  onSuccess?.call(state.data);
}

void _handelError<T extends BaseResModel>(
    bool showErrorToast,
    DataState<T> state,
    Function(T? error)? onError,
    ) {
  if (showErrorToast) {


    String errorMessage = state.error?.message ?? 'Error';

    if (state.error is FirebaseAuthException) {
       FirebaseAuthException firebaseAuthException = state.error as FirebaseAuthException;
      errorMessage = firebaseAuthException.message ?? 'Firebase Auth Error';
    }

    showSnackBarMessage(  OneContext().context!,
      isError: true,
      message: errorMessage,
    );

  }
  onError?.call(state.data);
}
