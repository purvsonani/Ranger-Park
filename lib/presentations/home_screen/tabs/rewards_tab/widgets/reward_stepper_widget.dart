import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ranger_park/core/utils/color_constants.dart';

class RewardStepperWidget extends StatelessWidget {
  int? totalSteps;
  int? currentStep;
  double? dotHeight;
  double? dotWidth;
  double? lineHeight;
  double? lineWidth;
  Color? textColor;
  Color? selectedDotColor;
  Color? unselectedDotColor;
  Color? selectedLineColor;
  Color? unselectedLineColor;

  RewardStepperWidget(
      {required this.totalSteps,
      required this.currentStep,
      required this.dotHeight,
      required this.dotWidth,
      required this.lineHeight,
      required this.lineWidth,
      required this.selectedDotColor,
      required this.unselectedDotColor,
      required this.selectedLineColor,
      required this.unselectedLineColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildProgressBar(),
    );
  }

  Widget _buildProgressBar() {
    List<Widget> list = List.generate(totalSteps!, (index) {
      bool isSelectedDot = currentStep! > index;
      bool isSelectedLine = currentStep! > index + 1;

      if (index == totalSteps! - 1) {
        return _buildDot(isSelectedDot, index);
      }

      return Row(
        children: [
          _buildDot(isSelectedDot, index),
          _buildLine(isSelectedLine, isSelectedDot)
        ],
      );
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }

  Widget _buildDot(bool isSelectedDot, int index) {
    return Container(
      height: dotHeight,
      width: dotWidth,
      child: Center(
          child: Text(
        "${index + 1}",
        style: TextStyle(color: textColor),
      )),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelectedDot ? selectedDotColor : unselectedDotColor,
      ),
    );
  }

  Widget _buildLine(bool isSelectedLine, bool isSelectedDot) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          isSelectedDot ? ColorConstants.yellow : ColorConstants.green,
          isSelectedLine ? ColorConstants.yellow : ColorConstants.green
        ]),
      ),
      height: lineHeight,
      width: lineWidth,
      // color: isSelectedLine ? selectedLineColor : unselectedLineColor,
    );
  }
}
