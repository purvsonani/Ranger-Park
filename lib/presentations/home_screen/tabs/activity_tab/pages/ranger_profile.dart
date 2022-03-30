import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';

import '../../../../../core/utils/fonts_constants.dart';

class RangerProfilePage extends StatefulWidget {
  const RangerProfilePage({Key? key}) : super(key: key);

  @override
  _RangerProfilePageState createState() => _RangerProfilePageState();
}

class _RangerProfilePageState extends State<RangerProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                splashColor: null,
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  ImageConstants.ic_back,
                  height: 0.1.sh,
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantsStrings.park_ranger,
                      style: TextStyle(fontSize: 90.sp),
                    ),
                    Constants.spaceVertical(30),
                    Text(
                      ConstantsStrings.oregon_states_park,
                      style:
                          TextStyle(fontSize: 45.sp, fontFamily: FONT_FRAUNCES),
                    ),
                  ],
                ),
              )),
              Image.asset(
                ImageConstants.ic_bear,
                height: 0.045.sh,
              ),
            ],
          ),
          Constants.spaceVertical(100),
          Text(
            "RANGER NAME",
            style: TextStyle(fontSize: 150.sp, color: ColorConstants.white),
          ),
          Constants.spaceVertical(80),
          CircleAvatar(
            backgroundColor: ColorConstants.white,
            radius: 0.12.sh,
          ),
          Constants.spaceVertical(40),
          Container(
            child: Text(
              "This week we will tturn our attention to another useful device used in both fiction and non-fiction, the descriptive technique. As we learned, narrative paragraphs describe a sequence of events or tell a story. The logical arrangement of ideas and sentences in a narrative paragraph is chronological - according to time order. But what if you were asked to describe how something looks - a place, a thing, or a person? How should you arrange your ideas and sentences in the paragraph? Obviously, time order would not be logical.",
              style: TextStyle(
                  color: ColorConstants.white, fontFamily: FONT_FRAUNCES , fontSize: 50.sp),
            ),
          )
        ],
      ),
    );
  }
}
