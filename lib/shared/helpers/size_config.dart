import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double getHeight;
  static double getStatusBarHeight;
  static double getDefaultSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    if (Platform.isAndroid) {
      getHeight = (screenWidth / 2) + 30;
    } else if (Platform.isIOS) {
      getHeight = (screenWidth / 2) + 120;
    }
    getStatusBarHeight = MediaQuery.of(context).padding.top;
    if (screenHeight > 400) {
      getDefaultSize = 16 * ui.window.devicePixelRatio / 2;
    } else {
      getDefaultSize = 16 * ui.window.devicePixelRatio;
    }
  }
}
