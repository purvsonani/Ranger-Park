import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/constant_parameters/constant_parameters.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/fonts_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/models/park_details.dart';
import 'package:get/get.dart';
import 'package:ranger_park/models/question_model.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/pages/ranger_profile.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/pages/text_quiz_activity.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/widgets/activity_item.dart';
import '../../../../../api/api_repository/api_repository.dart';
import '../../../../../core/widgets/widgets_util.dart';

class ParkDetailsPage extends StatefulWidget {
  final ParkDetails parkData;

  const ParkDetailsPage({required this.parkData});

  @override
  _ParkDetailsPageState createState() => _ParkDetailsPageState();
}

class _ParkDetailsPageState extends State<ParkDetailsPage> {
  ApiRepository _apiRepository = ApiRepository();

  bool isLoading = false;
  List<String>? swiperList = [];
  ParkDetails? parkDetails;
  List<QuestionModel>? activityList = [];

  @override
  void initState() {
    super.initState();
    _getParkDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Stack(children: [
      SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                buildSwiper(),
                buildParkDetails(),
                buildActivitiesList(),
              ],
            ),
            Positioned(
              top: 0.42.sh,
              child: Image.network(
                widget.parkData.iconUrl ?? "",
                height: 0.245.sh,
              ),
            ),
          ],
        ),
      ),
      Positioned(top: 150.h, right: 0, left: 0, child: buildHeader()),
    ]);
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(ImageConstants.ic_back)),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 160.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.parkData.name ?? "",
                    style:
                        TextStyle(fontSize: 90.sp, color: ColorConstants.white),
                  ),
                  Text(
                    "${widget.parkData.city ?? ""}, ${widget.parkData.state ?? ""}",
                    style: TextStyle(
                        fontSize: 45.sp,
                        color: ColorConstants.white,
                        fontFamily: FONT_FRAUNCES),
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15.h),
              child: Image.asset(
                ImageConstants.ic_bear,
                height: 0.045.sh,
              ))
        ],
      ),
    );
  }

  Widget buildSwiper() {
    return Container(
      height: 0.52.sh,
      child: Swiper(
        itemCount: swiperList!.length,
        itemHeight: double.infinity,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(bottom: 0.11.sh),
          builder: DotSwiperPaginationBuilder(
              color: Colors.white30,
              activeColor: Colors.white,
              space: 15.w,
              size: 18.w,
              activeSize: 18.w),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: ColorConstants.black,
            child: Image.network(
              swiperList![index],
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget buildParkDetails() {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      padding: EdgeInsets.symmetric(horizontal: 50.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Image.asset(
                    ImageConstants.ic_show_map,
                    height: 0.075.sh,
                  ),
                  Constants.spaceVertical(45),
                  _buildButton(
                      buttonName: ConstantsStrings.show_map, onPressed: () {})
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    ImageConstants.ic_park_info,
                    height: 0.065.sh,
                  ),
                  Constants.spaceVertical(50),
                  _buildButton(
                      buttonName: ConstantsStrings.park_info, onPressed: () {})
                ],
              ),
            ],
          ),
          Constants.spaceVertical(70),
          _buildProfileButton(),
          Constants.spaceVertical(70),
          Text(
            ConstantsStrings.activities,
            style: TextStyle(color: ColorConstants.white, fontSize: 120.sp),
          ),
        ],
      ),
    );
  }

  Widget buildActivitiesList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: activityList?.length,
          itemBuilder: (context, index) {
            final data = activityList![index];
            return ActivityItem(
                onPressed: () {
                  _onActivityTap(data);
                },
                questionModelData: data);
          }),
    );
  }

  Widget _buildProfileButton() {
    return ElevatedButton.icon(
      onPressed: () {
        _onRangerClicked();
      },
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: ColorConstants.mainColor,
          minimumSize: Size(0.5.sw, 130.w),
          padding: EdgeInsets.only(right: 40.w),
          side: BorderSide(width: 5.w, color: ColorConstants.white)),
      icon: ExtendedImage.network(parkDetails?.rangerImage ?? "",
          width: 130.w,
          height: 130.w,
          cache: true,
          shape: BoxShape.circle,
          fit: BoxFit.cover,
          border: Border.all(width: 5.w, color: ColorConstants.white)),
      label: Text(
          "${ConstantsStrings.meet} ${parkDetails?.name ?? ""}, ${ConstantsStrings.parks_ranger}",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorConstants.white, letterSpacing: 1, fontSize: 42.sp)),
    );
  }

  Widget _buildButton(
      {required String buttonName, required VoidCallback onPressed}) {
    return Container(
      width: 0.27.sw,
      height: 0.040.sh,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 40.sp),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ColorConstants.mainColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(width: 5.w, color: ColorConstants.white)))),
      ),
    );
  }

  // void _onActivityTap(QuestionModel data) {
  //   switch (data.type) {
  //     case ParameterConstants.ACTIVITY_TYPE_TEXT_Q:
  //       switch (data.mediaType) {
  //         case ParameterConstants.MEDIA_TYPE_TEXT:
  //           Get.to(() => TextQuizActivity(data: data,parkData: parkDetails,));
  //           break;
  //
  //         case ParameterConstants.MEDIA_TYPE_IMAGE:
  //           // Get.to();
  //           break;
  //         case ParameterConstants.MEDIA_TYPE_TEXT:
  //           // Get.to();
  //           break;
  //       }
  //       break;
  //     case ParameterConstants.ACTIVITY_TYPE_IMAGE_UPLOAD_Q:
  //       break;
  //   }
  // }

  void _onActivityTap(QuestionModel data) async {
    switch (data.type) {
      case ParameterConstants.ACTIVITY_TYPE_TEXT_Q:
        switch (data.mediaType) {
          case ParameterConstants.MEDIA_TYPE_VIDEO:
            // Get.to(ActivityQuiz(data: data, parkData: widget.parkData));
            break;

          case ParameterConstants.MEDIA_TYPE_IMAGE:
            // Get.to(ActivityQuiz(data: data, parkData: widget.parkData));
            break;

          case ParameterConstants.MEDIA_TYPE_TEXT:
            Get.to(IdentifyMammal(data: data, parkData: widget.parkData));
            break;
        }
        break;

      case ParameterConstants.ACTIVITY_TYPE_IMAGE_UPLOAD_Q:
        // Get.to(ActivityImageUpload(data: data, parkData: widget.parkData));
        break;
    }
  }

  void _onRangerClicked() {
    Get.to(() => RangerProfilePage());
  }

  void _getParkDetails() async {
    isLoading = true;
    setState(() {});

    try {
      final response =
          await _apiRepository.getParkDetails(park_id: widget.parkData.id!);
      isLoading = false;
      parkDetails = widget.parkData;

      setState(() {
        parkDetails = response.data;
        swiperList = parkDetails?.imageUrl;
        activityList = response.questionList;
      });
    } on Exception catch (e) {
      print("************_getParkDetails() exception**************");
    }
  }
}
