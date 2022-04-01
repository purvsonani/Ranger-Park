import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/string_constants.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/color_constants.dart';
import '../../../../core/utils/image_constants.dart';

class RewardsTab extends StatelessWidget {
  const RewardsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.h),
      child: Column(
        children: [
          Constants.spaceVertical(50),
          buildHeader(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.pick_rewards,
          style: TextStyle(color: ColorConstants.white, fontSize: 110.sp),
        ),
        Image.asset(
          ImageConstants.ic_bear,
          height: 0.045.sh,
        ),
      ],
    );
  }
}
