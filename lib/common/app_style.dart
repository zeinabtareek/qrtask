
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrtask/common/text_style.dart';

 import '../../common/AppColors.dart';


class K {
  ///primary color text (green)
  static Color lightGreen = const Color(0xffEDF7F6);
  static Color lightGreen2 = const Color(0xffCCE8E5);
  static Color lightPrimaryColor = const Color(0xffEDF7F6);
  static Color gradientLightGreenColor = const Color.fromARGB(255, 60, 155, 137);


  static TextStyle primaryMediumTextStyle(BuildContext context) =>
      textBold.copyWith(
        color: Theme.of(context).primaryColor,
        fontSize: 16.sp
      );



  static TextStyle primarySmallTextStyle(BuildContext context) =>
      textRegular.copyWith(
        fontSize: 12.sp,
        color: Theme.of(context).colorScheme.outline,
      );

  static TextStyle primaryWithUnderLineSmallTextStyle(BuildContext context) =>
      textMedium.copyWith(
        decoration: TextDecoration.underline,
        color: Theme.of(context).primaryColor,
        fontSize: 12.sp,
      );

  ///hint color text (grey)
  static TextStyle hintMediumTextStyle(BuildContext context) =>
      textMedium.copyWith(
        color: Theme.of(context).hintColor,
        fontSize: 14.sp
      );

  static TextStyle hintLargeTextStyle(BuildContext context) =>
      textMedium.copyWith(
        color: Theme.of(context).hintColor,
        fontSize: 16.sp
      );

  static TextStyle mainColorMediumTextStyle(BuildContext context) =>
      textMedium.copyWith(
        color: AppColors.secondaryColor,
        fontSize: 14.sp,
      );

  static TextStyle hintSmallTextStyle(BuildContext context) =>
      textMedium.copyWith(
        fontSize:14.sp,
        color: Theme.of(context).hintColor,
      );

  static TextStyle greyMediumTextStyle(BuildContext context) =>
      textMedium.copyWith(
        color: Theme.of(context)
            .textTheme
            .bodyMedium!
            .color!
            .withOpacity(.6),
      );

  /// black color text
  static TextStyle boldPrimaryTextStyle(BuildContext context) =>
      textBold.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle boldBlackTextStyle(BuildContext context) =>
      textBold.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle semiBoldBlackTextStyle(BuildContext context) =>
      textBold.copyWith(
        fontSize: 14.sp
      );

  static TextStyle blackTextStyleLarge(BuildContext context) =>
      textBold.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  ///border radius
  static BorderRadius borderRadiusOnlyTop = BorderRadius.only(
    topLeft: Radius.circular(10.r),
    topRight: Radius.circular(10.r),
  );

  ///box decorations
  ///box decoration with border primary color and background white
  static BoxDecoration boxDecorationWithPrimaryBorder(BuildContext context) =>
      BoxDecoration(
        color: AppColors.primaryAppColorLight,
        borderRadius: BorderRadius.circular(50.r),
      );
  static BoxDecoration boxDecorationWithPrimaryBorderSimpleRaduis = BoxDecoration(
    color: AppColors.primaryAppColorLight,
    // color: Theme.of(Get.context!).colorScheme.secondaryContainer,
    borderRadius: BorderRadius.circular(5.r),
  );
  static BoxDecoration selectedBoxDecorationWithPrimaryBorderSimpleRaduis = BoxDecoration(
    color: AppColors.primaryAppColor,
    // color: Theme.of(Get.context!).colorScheme.secondaryContainer,
    borderRadius: BorderRadius.circular(5.r),
  );


  static BoxDecoration lightGreenBoxDecoration(BuildContext context) =>
      BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          width: 1,
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      );

  static BoxDecoration shadowBoxDecoration(BuildContext context) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
            color: Colors.black12,
          )
        ],
      );

  static BoxDecoration shadowBoxDecorationWithPrimary(BuildContext context) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Theme.of(context).primaryColor,
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
            color: Colors.black12,
          )
        ],
      );

  static EdgeInsets fixedPadding0 = EdgeInsets.all(20.sp);
  static EdgeInsets fixedPadding2 = EdgeInsets.all(15.sp);
  static EdgeInsets fixedPadding1 = EdgeInsets.all(10.sp);
  static SizedBox sizedBoxH0 = SizedBox(
    height: 15.h
  );

  static SizedBox sizedBoxH1 = SizedBox(height: 20.h);
  static SizedBox sizedBoxH2 = SizedBox(
    height:15.h
  );
  static SizedBox sizedBoxH3 = SizedBox(
    height: 5.h,
  );
  static SizedBox sizedBoxW0 = SizedBox(
    width:15.w
  );

  static List<int> suggestedAmount = [
    1000,
    2000,
    3000,
    4000,
    5000,
    10000,
    15000,
    20000,
  ];

  static UnderlineInputBorder underlineInputBorder(BuildContext context) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).primaryColor,
        ),
      );
}

