



import 'package:flutter/material.dart';


void showSnackBarMessage(BuildContext context, {required String message, isError}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          dismissDirection: DismissDirection.horizontal,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
          backgroundColor: isError ? Colors.red : Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Text(message, style: TextStyle(color: Colors.white))
      )
  );
}