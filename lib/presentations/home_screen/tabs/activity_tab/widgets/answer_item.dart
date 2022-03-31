import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/color_constants.dart';

import '../../../../../models/answer_details.dart';

class AnswerItem extends StatelessWidget {
  final AnswerDetails? data;
  final int? index;
  final bool selected;
  final VoidCallback onPressed;

  AnswerItem(
      {this.data, this.index, required this.onPressed, required this.selected});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.w)),
      padding: EdgeInsets.zero,
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.w)),
        elevation: selected ? 15 : 0,
        color: selected ? ColorConstants.white : ColorConstants.green,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            // "${NumberFormat('#,##,000').format(double.parse(data?.imageTitle ?? "0"))} MI",
            "${data?.imageTitle ?? "0"}",
            // "${double.parse(text ?? "0").toStringAsFixed(2)}",
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: ColorConstants.mainColor,
                fontSize: 65.sp,
                letterSpacing: 1),
          ),
        ),
      ),
    );
    // return MaterialButton(
    //   splashColor: null,
    //   height: 0.38.sw,
    //   onPressed: onPressed,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
    //   child: Container(
    //     height: 0.38.sw,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(100.r),
    //       color: selected ? ColorConstants.white : ColorConstants.green,
    //     ),
    //     child: Center(
    //       child: Text(
    //         "${data?.imageTitle}",
    //         style: TextStyle(color: ColorConstants.mainColor ,fontSize: 70.sp),
    //       ),
    //     ),
    //   ),
    // );
  }
}
