import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/models/park_details.dart';
import 'package:ranger_park/models/question_details.dart';
import 'package:get/get.dart';
import '../../../../../api/api_repository/api_repository.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/color_constants.dart';
import '../../../../../core/utils/fonts_constants.dart';
import '../../../../../core/utils/image_constants.dart';
import '../../../../../core/utils/string_constants.dart';
import '../../../../../core/widgets/custom_progress_view.dart';
import '../../../../../core/widgets/widgets_util.dart';
import '../../../../../models/question_model.dart';
import '../widgets/identify_mammal_item.dart';

class IdentifyMammal extends StatefulWidget {
  final QuestionModel data;
  final ParkDetails? parkData;

  IdentifyMammal({required this.data, required this.parkData});

  @override
  State<IdentifyMammal> createState() => _IdentifyMammalState();
}

class _IdentifyMammalState extends State<IdentifyMammal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getQuestionDetails();
  }

  TextEditingController _answerController = TextEditingController();
  QuestionDetails? _questionDetails;
  bool _isLoading = false;
  bool _showAnswerField = false;

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
        children: [_buildHeader(), Constants.spaceVertical(60), _buildInfo()],
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
                  "${_questionDetails?.title ?? ""}",
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
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "${_questionDetails?.queTitle ?? ""}",
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 118.sp, color: ColorConstants.white),
                ),
              ),
              Constants.spaceVertical(20),
              Container(
                child: Text(
                  "${_questionDetails?.question ?? ""}",
                  style: TextStyle(
                    fontFamily: FONT_FRAUNCES,
                    fontSize: 60.sp,
                    color: ColorConstants.white,
                  ),
                ),
              ),
              Constants.spaceVertical(130),
              _buildAnswerList(),
              Constants.spaceVertical(50),
              _buildBottom(),
              Constants.spaceVertical(70),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerList() {
    if (_questionDetails == null) {
      return Container();
    }
    if (!_showAnswerField)
      return Container(
        child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _questionDetails?.answerDetail?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 0.30.sh,
            crossAxisCount: 2,
            crossAxisSpacing: 30.h,
          ),
          itemBuilder: (context, index) {
            final data = _questionDetails?.answerDetail![index];
            return IdentifyMammmalItem(
              onPressed: () {},
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
              btnTitle: "${_questionDetails?.btnText}",
              btnTextStyle: TextStyle(
                color: ColorConstants.mainColor,
                fontSize: 70.sp,
              ),
              image: "${_questionDetails?.activityIconUrl}"),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      child: Column(
        children: [
          if (!_showAnswerField)
            WidgetUtil.noAnswerFoundButton(
                onPressed: () {
                  _showAnswerField = true;
                  setState(() {});
                },
                image: "${_questionDetails?.activityIconUrl}")
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
      _isLoading = false;
      setState(() {
        if (result != null) {
          if (result.isSuccess()) {
            if (result.data != null) {
              _questionDetails = result.data;
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
