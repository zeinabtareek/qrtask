





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ErrorDialog extends StatelessWidget {
//   final String title;
//   final String message;
//   // final String message;
//   final void Function() resetState;
//
//   const ErrorDialog({
//     super.key,
//     required this.title,
//     required this.message,
//     required this.resetState,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Center(child: Text(title)),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(15),
//         ),
//       ),
//       content: Text(   message,
//         textAlign: TextAlign.center,
//         style: const TextStyle(color: Colors.black),
//       ),
//       actionsAlignment: MainAxisAlignment.center,
//       actions: [
//         ElevatedButton(
//           onPressed: resetState,
//           child: const Text(
//             'resend_it',
//             style: TextStyle(color: Colors.white),
//
//             ///Zeinab  Back translation
//             // 'close'.tr(context: context),
//           ),
//         ),
//       ],
//     );
//   }
// }