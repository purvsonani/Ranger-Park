import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  static Widget spaceHorizontal(double width) {
    return SizedBox(width: width.w);
  }

  static Widget spaceVertical(double height) {
    return SizedBox(height: height.w);
  }

  static disableKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }


}