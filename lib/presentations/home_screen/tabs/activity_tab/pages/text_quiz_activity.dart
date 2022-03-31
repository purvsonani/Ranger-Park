import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/api/api_repository/api_repository.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/fonts_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/widgets/custom_progress_view.dart';
import 'package:ranger_park/models/park_details.dart';
import 'package:ranger_park/models/question_details.dart';
import 'package:ranger_park/models/question_model.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/widgets/answer_item.dart';

class TextQuizActivity extends StatefulWidget {
  final QuestionModel data;
  final ParkDetails? parkData;

  TextQuizActivity({required this.data, required this.parkData});

  @override
  State<TextQuizActivity> createState() => _TextQuizActivityState();
}

class _TextQuizActivityState extends State<TextQuizActivity> {
  @override
  void initState() {
    super.initState();
    _getQuestionDetails();
  }

  bool _isLoading = false;
  QuestionDetails? questionDetails;

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
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          _buildHeader(),
          Constants.spaceVertical(50),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImageConstants.ic_back,
                  height: 0.05.sh,
                ),
              ),
              Expanded(
                  child: Container(
                child: Text(
                  "${questionDetails?.title}",
                  style: TextStyle(fontSize: 100.sp),
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
              "${questionDetails?.subText}",
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
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "${questionDetails?.queTitle}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 120.sp, color: ColorConstants.white),
                ),
              ),
              Constants.spaceVertical(20),
              Container(
                child: ExtendedImage.network("${questionDetails?.imageVideoUrl}"),
              ),
              Constants.spaceVertical(30),
              Container(
                child: Text(
                  "${questionDetails?.subtextTitle}",
                  style: TextStyle(
                    fontFamily: FONT_FRAUNCES,
                    fontSize: 65.sp,
                    color: ColorConstants.white,
                  ),
                ),
              ),
              Constants.spaceVertical(150),
              Text(
                "${questionDetails?.question}",
                style: TextStyle(color: ColorConstants.white, fontSize: 130.sp),
              ),
              Constants.spaceVertical(80),
              _buildAnswerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.h),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: questionDetails?.answerDetail?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
             crossAxisSpacing: 50.h,
             mainAxisSpacing: 20.w
        ),
        itemBuilder: (context, index) {
          final data  = questionDetails?.answerDetail![index];
          return AnswerItem(
            onPressed: () {},
            selected: true,
            index: index,
            data: data,
          );
        },
      ),
    );
  }

  void _getQuestionDetails() async {
    _isLoading = true;
    setState(() {});
    try {
      final result =
          await apiRepository.getQuestionDetails(question_id: widget.data.id!);
      _isLoading = false;
      setState(() {
        if (result != null) {
          if (result.isSuccess()) {
            if (result.data != null) {
              questionDetails = result.data;
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
