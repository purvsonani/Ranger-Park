import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ranger_park/api/api_repository/api_repository.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/models/park_details.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/pages/park_details_page.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/widgets/park_item.dart';
import 'dart:math' as math;
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/fonts_constants.dart';
import 'package:get/get.dart';

class ActivityTab extends StatefulWidget {
  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {
  ApiRepository _apiRepository = ApiRepository();
  List<ParkDetails>? _searchParksList = [];
  List<ParkDetails>? _parksList = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getParkList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Constants.disableKeyboard(context),
      child: Scaffold(
        body: SafeArea(child: buildBody()),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.spaceVertical(50),
            buildHeader(),
            Constants.spaceVertical(200),
            buildSearch(),
            Constants.spaceVertical(50),
            parkList(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.pick_park,
          style: TextStyle(color: ColorConstants.white, fontSize: 110.sp),
        ),
        Image.asset(
          ImageConstants.ic_bear,
          height: 0.045.sh,
        ),
      ],
    );
  }

  Widget buildSearch() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
                decoration: TextDecoration.none,
                color: ColorConstants.white,
                fontSize: 63.sp,
                letterSpacing: 1),
            cursorColor: ColorConstants.white,
            decoration: InputDecoration(
                prefixIcon: Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(
                      Icons.search,
                      color: ColorConstants.green,
                    )),
                suffixIcon: Container(
                    margin: EdgeInsets.only(right: 20.w, top: 5.h, bottom: 5.h),
                    child: MaterialButton(
                        minWidth: 0,
                        onPressed: () {},
                        elevation: 10,
                        shape: StadiumBorder(),
                        color: ColorConstants.suffixIconBackground,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50.w, vertical: 0),
                        child:
                            Image.asset(ImageConstants.ic_map, height: 70.w))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide: BorderSide(
                        color: ColorConstants.textFieldBorder, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                        BorderSide(color: ColorConstants.white, width: 2)),
                border: InputBorder.none,
                hintText: StringConstants.search_park,
                hintStyle: TextStyle(
                    color: ColorConstants.textFieldBorder, fontSize: 60.sp),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 100.w, vertical: 35.h)),
          ),
          Constants.spaceVertical(25),
          Text(
            StringConstants.complete_park_for_prize,
            style: TextStyle(
              fontFamily: FONT_FRAUNCES,
            ),
          )
        ],
      ),
    );
  }

  Widget parkList() {
    if (isLoading) {
      return Container(
        child: Center(
            child: CircularProgressIndicator(color: ColorConstants.white)),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.symmetric(vertical: 40.h),
        itemCount: _searchParksList?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 0.32.sh,
          crossAxisSpacing: 50.w,
          // mainAxisSpacing: 40.w,
        ),
        itemBuilder: (context, index) {
          final data = _searchParksList![index];
          return ParkItem(
            parkDetails: data,
            onTap: () {
              onParkClick(data);
            },
          );
        },
      ),
    );
  }

  void onParkClick(ParkDetails data) {
    Constants.disableKeyboard(context);
    Get.to(() => ParkDetailsPage(parkData: data));
  }

  Future<void> _getParkList() async {
    isLoading = true;
    setState(() {});

    try {
      final response = await _apiRepository.getParkList();

      isLoading = false;
      setState(() {
        _parksList = response.data;
        _searchParksList = _parksList;
      });
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
