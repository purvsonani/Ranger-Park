import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/core/widgets/custom_progress_view.dart';
import 'package:ranger_park/models/rewards_details.dart';
import 'package:ranger_park/presentations/home_screen/tabs/rewards_tab/widgets/reward_list_item.dart';

import '../../../../api/api_repository/api_repository.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/color_constants.dart';
import '../../../../core/utils/image_constants.dart';

class RewardsTab extends StatefulWidget {
  @override
  State<RewardsTab> createState() => _RewardsTabState();
}

class _RewardsTabState extends State<RewardsTab> {
  List<RewardsDetails>? rewardsData = [];
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRewards();
  }

  @override
  Widget build(BuildContext context) {
    return CustomProgressView(
      isLoading: _isLoading,
      child: Scaffold(
        body: SafeArea(
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.h),
        child: Column(
          children: [
            Constants.spaceVertical(50),
            _buildHeader(),
            Constants.spaceVertical(50),
            _buildRewardList()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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

  Widget _buildRewardList() {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: rewardsData?.length,
          itemBuilder: (context, index) {
            final data = rewardsData![index];
            return RewardListItem(rewardsDetails: data);
          }),
    );
  }

  void _getRewards() async {
    _isLoading = true;
    setState(() {});
    try {
      final result = await apiRepository.getRewards();
      _isLoading = false;
      setState(() {
        if (result != null) {
          if (result.isSuccess()) {
            if (result.rewardDetails != null) {
              rewardsData = result.rewardDetails;
            }
          } else {
            print("**************Result Null getQuestionDetails()**********");
          }
        }
      });
    } on Exception catch (e) {
      print("************_getQuestionDetails() exception**************");
      _isLoading = false;
    }
  }
}
