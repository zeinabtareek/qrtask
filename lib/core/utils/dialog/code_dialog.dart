

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/AppColors.dart';
import '../../../common/app_style.dart';


class CodeDialog extends StatelessWidget {

  final String code;
  final Widget? widget;
  final Function()? onPressed;
  const CodeDialog({super.key,
    required this.code,
    this.widget,
    this.onPressed,
   });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:  AppColors.primaryAppColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                 Text(
               ' Code ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
                K.sizedBoxH1,
                widget == null ?
                GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    width: 165.w,
                    height: 45.h,
                    padding: K.fixedPadding0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(code,style: K.blackTextStyleLarge(context)),
                        const Icon(Icons.copy)
                      ],
                    )),
                  ),
                ) : widget ??
                    SizedBox(),

                K.sizedBoxH1,



              ],
            ),
          ),
        ),
      ),
    );
  }
}