import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _DummyDimensions extends Dimensions {
  _DummyDimensions() : super._(); // Dummy implementation for abstract class
}
abstract class Dimensions {
  late BuildContext context;

  Dimensions._(); // private constructor

  static Dimensions _instance = _DummyDimensions(); // Use a dummy instance

  static Dimensions getInstance(BuildContext context) {
    _instance.context = context;
    return _instance;
  }

  double get fontSizeExtraSmall =>
      ScreenUtil().setWidth(MediaQuery.of(context).size.width >= 1300 ? 14 : 10);

  double get fontSizeSmall =>
      ScreenUtil().setWidth(MediaQuery.of(context).size.width >= 1300 ? 16 : 12);

  double get fontSizeDefault =>
      ScreenUtil().setWidth(MediaQuery.of(context).size.width >= 1300 ? 18 : 14);

  double get fontSizeLarge =>
      ScreenUtil().setWidth(MediaQuery.of(context).size.width >= 1300 ? 20 : 16);

  double get fontSizeExtraLarge =>
      ScreenUtil().setWidth(MediaQuery.of(context).size.width >= 1300 ? 22 : 18);

  double get fontSizeOverLarge =>
      ScreenUtil().setWidth(MediaQuery.of(context).size.width >= 1300 ? 28 : 24);

  double paddingSizeTiny = ScreenUtil().setWidth(3.0);
  double paddingSizeExtraSmall = ScreenUtil().setWidth(5.0);
  double paddingSizeSeven = ScreenUtil().setWidth(7.0);
  double paddingSizeSmall = ScreenUtil().setWidth(10.0);
  double paddingSize = ScreenUtil().setWidth(12.0);
  double paddingSizeDefault = ScreenUtil().setWidth(15.0);
  double paddingSizeLarge = ScreenUtil().setWidth(20.0);
  double paddingSizeExtraLarge = ScreenUtil().setWidth(25.0);
  double paddingSizeSignUp = ScreenUtil().setWidth(35.0);
  double paddingSizeOverLarge = ScreenUtil().setWidth(30.0);

  double get splashLogoWidth =>
      ScreenUtil().setWidth(MediaQuery.of(context).size.width <= 400 ? 120 : 150);

  double radiusSmall = ScreenUtil().setWidth(5.0);
  double radiusDefault = ScreenUtil().setWidth(10.0);
  double radiusLarge = ScreenUtil().setWidth(15.0);
  double radiusExtraLarge = ScreenUtil().setWidth(20.0);
  double radiusOverLarge = ScreenUtil().setWidth(50.0);

  double webMaxWidth = ScreenUtil().setWidth(1170);// Size(1170.w,70.h);
  double identityImageWidth = ScreenUtil().setWidth(130);
  double identityImageHeight = ScreenUtil().setWidth(80);
  double menuIconSize = ScreenUtil().setWidth(25);

  double iconSizeSmall = ScreenUtil().setWidth(15);
  double iconSizeMedium = ScreenUtil().setWidth(20);
  double rewardImageSize = ScreenUtil().setWidth(70);
  double rewardImageSizeOfferPage = ScreenUtil().setWidth(150);
  double customerReactionSize = ScreenUtil().setWidth(100);
  double iconSizeLarge = ScreenUtil().setWidth(25);
  double iconSizeExtraLarge = ScreenUtil().setWidth(30);
  double iconSizeOnline = ScreenUtil().setWidth(100);
  double iconSizeDoubleExtraLarge = ScreenUtil().setWidth(40);
  double iconSizeDialog = ScreenUtil().setWidth(60);
  double roadArrowHeight = ScreenUtil().setWidth(50);
  double appBarHeight = ScreenUtil().setWidth(70);
  double dropDownWidth = ScreenUtil().setWidth(100);
  double compassPadding = ScreenUtil().setWidth(50);

  double orderStatusIconHeight = ScreenUtil().setWidth(70);
  //
  // double get headerCardHeight => MediaQuery.of(context).isLandscape
  //     ? 50.h
  //     : MediaQuery.of(context).isPortrait
  //     ? 45.h
  //     : 0;
}
