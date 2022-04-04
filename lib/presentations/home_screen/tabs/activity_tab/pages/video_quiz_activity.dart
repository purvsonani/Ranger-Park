import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ranger_park/api/api_repository/api_repository.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/fonts_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/core/widgets/custom_progress_view.dart';
import 'package:ranger_park/core/widgets/widgets_util.dart';
import 'package:ranger_park/models/park_details.dart';
import 'package:ranger_park/models/question_details.dart';
import 'package:ranger_park/models/question_model.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/widgets/answer_item.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class VideoQuizActivity extends StatefulWidget {
  final QuestionModel data;
  final ParkDetails? parkData;

  VideoQuizActivity({required this.data, required this.parkData});

  @override
  State<VideoQuizActivity> createState() => _VideoQuizActivityState();
}

class _VideoQuizActivityState extends State<VideoQuizActivity> {
  bool _isLoading = false;
  int _selectedAnsIndex = -1;
  bool _showAnswerField = false;
  QuestionDetails? questionDetails;
  TextEditingController _answerController = TextEditingController();
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _getQuestionDetails();
  }

  void _videoInit() {
    _videoPlayerController =
        VideoPlayerController.network("${questionDetails?.imageVideoUrl}")
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return CustomProgressView(
      backgroundColor: ColorConstants.mainColor,
      isLoading: _isLoading,
      child: GestureDetector(
        onTap: () => Constants.disableKeyboard(context),
        child: Scaffold(
          body: SafeArea(
            child: _buildBody(),
          ),
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
                onPressed: () {
                  if (_showAnswerField) {
                    _showAnswerField = false;
                    setState(() {});
                  } else {
                    Get.back();
                  }
                },
                icon: Image.asset(
                  ImageConstants.ic_back,
                  height: 0.05.sh,
                ),
              ),
              Expanded(
                  child: Container(
                child: Text(
                  "${questionDetails?.title ?? ""}",
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
              "${questionDetails?.subText ?? ""}",
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
              if (questionDetails == null) Container(height: 0),
              Container(
                child: Text(
                  "${questionDetails?.queTitle ?? ""}",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 120.sp, color: ColorConstants.white),
                ),
              ),
              Constants.spaceVertical(20),
              Container(
                height: 0.60.sw,
                margin: EdgeInsets.symmetric(vertical: 50.h),
                alignment: Alignment.center,
                child: Card(
                  color: ColorConstants.black,
                  margin: EdgeInsets.zero,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: VideoViewWidget(
                      videoController: _videoPlayerController,
                    ),
                  ),
                ),
              ),
              Constants.spaceVertical(30),
              Container(
                child: Text(
                  "${questionDetails?.subtextTitle ?? ""}",
                  style: TextStyle(
                    fontFamily: FONT_FRAUNCES,
                    fontSize: 65.sp,
                    color: ColorConstants.white,
                  ),
                ),
              ),
              Constants.spaceVertical(150),
              Text(
                "${questionDetails?.question ?? ""}",
                style: TextStyle(color: ColorConstants.white, fontSize: 130.sp),
              ),
              Constants.spaceVertical(80),
              _buildAnswerList(),
              Constants.spaceVertical(80),
              _buildBottom()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerList() {
    if (questionDetails == null) {
      return Container();
    }
    if (!_showAnswerField)
      return Container(
        child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: questionDetails?.answerDetail?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 50.h, mainAxisSpacing: 20.w),
          itemBuilder: (context, index) {
            final data = questionDetails?.answerDetail![index];
            final bool selected = _selectedAnsIndex == index;
            return AnswerItem(
              onPressed: () {
                _selectedAnsIndex = index;
                setState(() {});
              },
              selected: selected,
              index: index,
              data: data,
            );
          },
        ),
      );

    return Container(
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
                color: ColorConstants.white,
                fontSize: 60.sp,
                fontFamily: FONT_FRAUNCES),
            maxLines: 12,
            controller: _answerController,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorConstants.darkGreen,
              border: InputBorder.none,
              hintText: StringConstants.type_here,
              hintStyle: TextStyle(
                  color: ColorConstants.mainColor,
                  fontFamily: FONT_FRAUNCES,
                  fontSize: 60.sp),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: ColorConstants.mainColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      BorderSide(color: ColorConstants.green, width: 2)),
            ),
          ),
          Constants.spaceVertical(85),
          WidgetUtil.startAdventureButtonWidget(
              onPressed: () {},
              btnTitle: "${questionDetails?.btnText ?? ""}",
              btnTextStyle: TextStyle(
                color: ColorConstants.mainColor,
                fontSize: 70.sp,
              ),
              image: "${questionDetails?.activityIconUrl ?? ""}"),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      child: Column(
        children: [
          if (_selectedAnsIndex != -1 && !_showAnswerField)
            WidgetUtil.startAdventureButtonWidget(
                onPressed: () {},
                btnTitle: "${questionDetails?.btnText}",
                btnTextStyle: TextStyle(
                  color: ColorConstants.mainColor,
                  fontSize: 70.sp,
                ),
                image: "${questionDetails?.activityIconUrl}"),
          Constants.spaceVertical(45),
          if (!_showAnswerField && questionDetails != null)
            WidgetUtil.noAnswerFoundButton(
                onPressed: () {
                  _showAnswerField = true;
                  setState(() {});
                },
                image: "${questionDetails?.activityIconUrl}")
        ],
      ),
    );
  }

  void _getQuestionDetails() async {
    _isLoading = true;
    setState(() {});
    try {
      final result =
          await apiRepository.getQuestionDetails(question_id: widget.data.id!);
      print("**********question_id: ${widget.data.id} ${widget.data.title}");
      _isLoading = false;
      setState(() {
        if (result != null) {
          if (result.isSuccess()) {
            if (result.data != null) {
              questionDetails = result.data;
              _videoInit();
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
