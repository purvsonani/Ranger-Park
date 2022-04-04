import 'package:extended_image/extended_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import '../../../../../models/answer_details.dart';
import 'package:flutter/material.dart';

class IdentifyMammmalItem extends StatelessWidget {
  final AnswerDetails? data;
  final int? index;
  final VoidCallback onPressed;

  IdentifyMammmalItem({this.data, this.index, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90.w)),
            splashColor: ColorConstants.yellow,
            highlightColor: ColorConstants.yellow,
            padding: EdgeInsets.zero,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90.w)),
              elevation: 15,
              child: ExtendedImage.network(
                data?.answerImageUrl ?? "",
                width: double.infinity,
                height: 0.22.sh,
                cache: true,
                fit: BoxFit.cover,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(90.w),
                handleLoadingProgress: true,
                loadStateChanged: (state) {
                  if (state.extendedImageLoadState == LoadState.loading) {
                    return SpinKitFadingFour(color: ColorConstants.white, size: 70.w);
                  }
                  return null;
                },
              ),
            ),
          ),
          Constants.spaceVertical(20),
          InkWell(
            onTap: onPressed,
            child: Text(
              data?.imageTitle ?? "",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorConstants.white, fontSize: 70.sp),
            ),
          ),
        ],
      ),
    );
  }
}

