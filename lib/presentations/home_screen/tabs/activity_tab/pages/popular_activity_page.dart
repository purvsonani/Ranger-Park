import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ranger_park/api/api_repository/api_repository.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/core/widgets/custom_progress_view.dart';
import 'package:ranger_park/core/widgets/widgets_util.dart';
import 'package:ranger_park/models/question_details.dart';
import '../../../../../core/utils/fonts_constants.dart';
import '../../../../../core/utils/image_constants.dart';
import '../../../../../models/park_details.dart';
import '../../../../../models/question_model.dart';
import 'dart:io';

class PopularActivityPage extends StatefulWidget {
  final QuestionModel data;
  final ParkDetails? parkData;

  PopularActivityPage({required this.data, required this.parkData});

  @override
  State<PopularActivityPage> createState() => _PopularActivityPageState();
}

class _PopularActivityPageState extends State<PopularActivityPage> {
  ImagePicker _imagePicker = ImagePicker();
  ApiRepository apiRepository = ApiRepository();
  QuestionDetails? _questionDetails;
  bool _isLoading = false;
  bool _imageSelected = false;
  File? imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getParkDetails();
  }

  @override
  Widget build(BuildContext context) {
    return CustomProgressView(
      isLoading: _isLoading,
      child: Scaffold(
        body: SafeArea(
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        children: [_buildHeader(), Constants.spaceVertical(40), _buildInfo()],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  ImageConstants.ic_back,
                  height: 0.05.sh,
                ),
              ),
              Expanded(
                  child: Container(
                child: Text(
                  "${_questionDetails?.title ?? ""}",
                  style: TextStyle(fontSize: 95.sp),
                  textAlign: TextAlign.center,
                ),
              )),
              Image.asset(
                ImageConstants.ic_bear,
                height: 0.045.sh,
              )
            ],
          ),
          Container(
            child: Text(
              "${_questionDetails?.subText ?? ""}",
              style: TextStyle(fontSize: 50.sp, fontFamily: FONT_FRAUNCES),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _buildImage(),
              Constants.spaceVertical(90),
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageFile == null)
      return Container(
        height: 0.4.sh,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90.w),
            color: ColorConstants.green),
        child: Center(
          child: GestureDetector(
            onTap: () {
              _getImageFromCamera();
            },
            child: CircleAvatar(
              radius: 0.16.sw,
              backgroundColor: ColorConstants.mainColor,
              child: Image.asset(
                ImageConstants.ic_camera,
                height: 0.055.sh,
              ),
            ),
          ),
        ),
      );

    return Container(
      height: 0.4.sh,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.w),
          color: ColorConstants.green),
      child: Center(
        child: GestureDetector(
            onTap: () {
              _getImageFromCamera();
            },
            child: ExtendedImage.file(
              imageFile!,
              borderRadius: BorderRadius.circular(100.w),
              shape: BoxShape.rectangle,
              fit: BoxFit.cover,
              width: double.infinity,
            )),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      child: Column(
        children: [
          Text(
            "${_questionDetails?.queTitle ?? ""}",
            style: TextStyle(color: ColorConstants.white, fontSize: 118.sp),
          ),
          Constants.spaceVertical(20),
          Text(
            _questionDetails?.question ?? "",
            style: TextStyle(
                color: ColorConstants.white,
                fontSize: 60.sp,
                fontFamily: FONT_FRAUNCES),
          ),
          Constants.spaceVertical(120),
          if (_imageSelected)
            WidgetUtil.startAdventureButtonWidget(
                onPressed: () {},
                btnTitle: StringConstants.upload_photo,
                btnTextStyle: TextStyle(
                  color: ColorConstants.mainColor,
                  fontSize: 70.sp,
                ),
                image: _questionDetails?.activityIconUrl ?? ""),
          Constants.spaceVertical(50),
        ],
      ),
    );
  }

  void _getImageFromCamera() async {
    XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      _imageSelected = true;
      setState(() {});
    }
  }

  void _getParkDetails() async {
    _isLoading = true;
    setState(() {});

    try {
      final response =
          await apiRepository.getQuestionDetails(question_id: widget.data.id!);
      print("************park_id: ${widget.data.id}");
      _isLoading = false;

      setState(() {
        _questionDetails = response.data;
      });
    } on Exception catch (e) {
      print("************_getParkDetails() exception**************");
    }
  }
}
