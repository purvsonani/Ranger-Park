import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/core/widgets/custom_progress_view.dart';
import 'package:ranger_park/models/park_details.dart';
import 'package:ranger_park/models/ranger_details.dart';
import '../../../../../api/api_repository/api_repository.dart';
import '../../../../../core/utils/fonts_constants.dart';

class RangerProfilePage extends StatefulWidget {

  final ParkDetails parkData;


  const RangerProfilePage({required this.parkData});

  @override
  _RangerProfilePageState createState() => _RangerProfilePageState();
}

class _RangerProfilePageState extends State<RangerProfilePage> {

  RangerDetails? rangerData;
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    _getRangerDetails();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomProgressView(
      isLoading: _isLoading,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(child: _buildBody()),
        ),
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
                      StringConstants.park_ranger,
                      style: TextStyle(fontSize: 90.sp),
                    ),
                    Constants.spaceVertical(30),
                    Text(
                      StringConstants.oregon_states_park,
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
            "${rangerData?.firstName ?? ""} ${rangerData?.lastName ?? ""}",
            style: TextStyle(fontSize: 150.sp, color: ColorConstants.white),
          ),
          Constants.spaceVertical(80),
          if(rangerData != null)
          CircleAvatar(
            backgroundImage: NetworkImage("${rangerData?.imageUrl}"),
            backgroundColor: ColorConstants.white,
            radius: 0.12.sh,
          ),
          Constants.spaceVertical(40),
          Container(
            child: Text(
              "${rangerData?.description ?? ""}",
              style: TextStyle(
                  color: ColorConstants.white, fontFamily: FONT_FRAUNCES , fontSize: 50.sp),
            ),
          )
        ],
      ),
    );
  }

  void _getRangerDetails() async {
    _isLoading = true;
    setState(() {});
    try {
      final result =
      await apiRepository.getRangerDetails(ranger_id: widget.parkData.ranger!);
      print("**********ranger_id: ${widget.parkData.ranger}");
      _isLoading = false;
      setState(() {
        if (result != null) {
          if (result.isSuccess()) {
            if (result.rangerDetails != null) {
              rangerData = result.rangerDetails;
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
