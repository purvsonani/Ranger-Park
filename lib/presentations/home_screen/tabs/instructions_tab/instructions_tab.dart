import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/color_constants.dart';


class InstructionsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Text("No Instructions...." ,
      style: TextStyle(
        color: ColorConstants.white,
        fontSize: 100.h
      ),),
    );
  }
}
