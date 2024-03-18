



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/AppColors.dart';
import '../../../common/app_style.dart';
import '../../../widgets/custom_button.dart';



class SuccessDialog extends StatelessWidget {
   final String? icon;
  final String title;
  final String ? des;
  final dynamic Function()?onYesPressed;
  final bool isLogOut;
  final bool withNoButton;
  final bool isLoading;
  final void Function()? onNoPressed;
  final Widget? widget;
  final String? leftBtnText;
  final String? rightBtnText;
  final bool noButton;
  final double? width;
  // final Key _internalKey = GlobalKey(); // Unique GlobalKey for each instance
  final Key ?key; // Unique GlobalKey for each instance

   const
   SuccessDialog({
    this.key,
    this.leftBtnText,
    this.rightBtnText,
    this.des,
    this.icon,
    // this.internalKey,
    required this.title,
    required this.onYesPressed,
    this.isLogOut = false,
    this.noButton = false,
    this.isLoading = false,
    this.withNoButton = false,
    this.onNoPressed,
    this.widget,
    this.width,
  }): super(key: key);

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
                icon!=null?  Image.asset(icon!,width: 130.w,height: 100.h,):SizedBox(),

                K.sizedBoxH1,
                 Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),

                ),
                widget == null ? const SizedBox() : widget ?? SizedBox(),

                K.sizedBoxH1,
                Text(
                  des ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, ),

                ),
                K.sizedBoxH1,




                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    leftBtnText!=null?   Expanded(
                      child:

                      CustomButton(
                        showBorder: true,

                        transparent: false,
                        width: width??250,
                        fontSize: 16,
                        isLoading:false  ,
                        backgroundColor: Colors.white,
                        textColor: Theme.of(context).primaryColor,

                        buttonText:  leftBtnText??'' ,
                        onPressed:onNoPressed ,
                        radius: 5 ,
                      ),   ):const SizedBox(),leftBtnText!=null?K.sizedBoxW0:SizedBox(),
                    Expanded(
                      child:

                CustomButton(
                showBorder: false,

                  transparent: false,
                  width: width??250,
                  fontSize: 16,
                  isLoading:isLoading  ,
                  backgroundColor: Theme.of(context).primaryColor,
                   buttonText:  rightBtnText??'' ,
                  onPressed:onYesPressed ,
                  radius: 5 ,
                ),   ),



                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
