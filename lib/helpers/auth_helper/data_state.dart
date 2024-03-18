
// import 'package:dio/dio.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class DataState<T>  {
  final T? data;
  final FirebaseException? error;

  final String? errorMsg;

  const DataState({this.data, this.error, this.errorMsg});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataState<T> &&
        other.data == data &&
        other.error == error &&
        other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => data.hashCode ^ error.hashCode ^ errorMsg.hashCode;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {

  const DataFailed(FirebaseException error, T data) : super(error: error,data: data);
 }

class DataFailedErrorMsg<T> extends DataState<T> {

  const DataFailedErrorMsg(String error,T? data) : super(errorMsg: error,data: data);
}
