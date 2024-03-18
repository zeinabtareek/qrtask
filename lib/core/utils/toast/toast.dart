


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
  showVipToast(BuildContext context, {required String message, isError}) {

    return  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
        backgroundColor:isError?Colors.red :Theme.of(context).primaryColor,
    textColor: isError?Colors.white :Colors.black ,

    // toastDuration: Duration(seconds: 2),
  );


}
