import 'dart:ffi';

import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  int? totalSteps;
  int? currentStep;
  double? dotHeight;
  double? dotWidth;
  double? lineHeight;
  double? lineWidth;
  double? DotBorderWidth;
  Color? selectedDotColor;
  Color? unselectedDotColor;
  Color? selectedLineColor;
  Color? unselectedLineColor;
  Color? selectedDotBorderColor;
  Color? unselectedDotBorderColor;

  StepperWidget({
    required this.totalSteps,
    required this.currentStep,
    required this.dotHeight,
    required this.dotWidth,
    required this.lineHeight,
    required this.lineWidth,
    this.DotBorderWidth,
    required this.selectedDotColor,
    required this.unselectedDotColor,
    required this.selectedLineColor,
    required this.unselectedLineColor,
    required this.selectedDotBorderColor,
    required this.unselectedDotBorderColor,
  });

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
        return _buildDot(isSelectedDot);
      }

      return Row(
        children: [_buildDot(isSelectedDot), _buildLine(isSelectedLine)],
      );
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }

  Widget _buildDot(bool isSelectedDot) {
    return Container(
      height: dotHeight,
      width: dotWidth,
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelectedDot
                ? selectedDotBorderColor!
                : unselectedDotBorderColor!,
            width: DotBorderWidth!),
        shape: BoxShape.circle,
        color: isSelectedDot ? selectedDotColor : unselectedDotColor,
      ),
    );
  }

  Widget _buildLine(bool isSelectedLine) {
    return Container(
      height: lineHeight,
      width: lineWidth,
      color: isSelectedLine ? selectedLineColor : unselectedLineColor,
    );
  }
}
