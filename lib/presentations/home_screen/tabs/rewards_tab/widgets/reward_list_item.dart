import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/fonts_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/models/ranger_details.dart';
import 'package:ranger_park/models/rewards_details.dart';
import 'package:ranger_park/presentations/home_screen/tabs/rewards_tab/widgets/reward_stepper_widget.dart';

class RewardListItem extends StatelessWidget {
  final RewardsDetails? rewardsDetails;

  RewardListItem({required this.rewardsDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.rewardItemBackground,
              borderRadius: BorderRadius.circular(90.w)
            ),
            height: 0.5.sh,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.w,
                  backgroundImage: NetworkImage("${rewardsDetails?.imageUrl}"),
                ),
                Constants.spaceVertical(15),
                Text(
                  "${StringConstants.rangers_reward.replaceAll("@", "${rewardsDetails?.name}")}",
                  style:
                      TextStyle(color: ColorConstants.white, fontSize: 50.sp),
                ),
                Constants.spaceVertical(15),
                _buildProgress(),
                Constants.spaceVertical(15),
                Text(
                  StringConstants.complete_5_parks
                      .replaceAll("@", "${rewardsDetails?.name}"),
                  style: TextStyle(fontSize: 30.sp, fontFamily: FONT_FRAUNCES),
                ),
                Constants.spaceVertical(15),
                _buildClaimButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProgress() {
    return RewardStepperWidget(
        totalSteps: 5,
        currentStep: 2,
        dotHeight: 28.w,
        dotWidth: 28.w,
        lineHeight: 7.w,
        lineWidth: 30.w,
        DotBorderWidth: 6.w,
        selectedDotColor: ColorConstants.yellow,
        unselectedDotColor: ColorConstants.mainColor,
        selectedLineColor: ColorConstants.white,
        unselectedLineColor: ColorConstants.green,
        selectedDotBorderColor: ColorConstants.white,
        unselectedDotBorderColor: ColorConstants.green);
  }

  Widget _buildClaimButton(){
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.rewardItemBackground)
        ),
        onPressed: (){},
        child: Text("update*"),
      ),
    );
  }
}
