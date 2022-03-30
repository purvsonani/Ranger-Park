import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/models/question_model.dart';

class ActivityItem extends StatefulWidget {
  final VoidCallback onPressed;
  QuestionModel questionModelData;

  ActivityItem({required this.onPressed, required this.questionModelData});

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h ,horizontal: 20.w),
      child: Stack(
        children: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(0.85.sw, 0.058.sh),
                  shape: StadiumBorder(),
                  elevation: 10,
                  primary: ColorConstants.green,
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w)),
              onPressed: widget.onPressed,
              icon: ExtendedImage.network(
                "${widget.questionModelData.activityIconUrl}",
                shape: BoxShape.circle,
                height: 0.05.sh,
              ),
              label: Text(
                "${widget.questionModelData.title}",
                style: TextStyle(fontSize: 60.sp),
              ))
        ],
      ),
    );
  }
}
