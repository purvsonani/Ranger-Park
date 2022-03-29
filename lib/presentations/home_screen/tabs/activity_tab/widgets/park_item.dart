import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/models/park_details.dart';

import '../../../../../core/constants/constants.dart';

class ParkItem extends StatefulWidget {
  ParkItem({Key? key, required this.parkDetails , required this.onTap});

  ParkDetails parkDetails;
  VoidCallback onTap;

  @override
  State<ParkItem> createState() => _ParkItemState();
}

class _ParkItemState extends State<ParkItem> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              height: 0.250.sh,
              child: Stack(
                children: [
                  Positioned(
                    top: 10.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.network(widget.parkDetails.iconUrl.toString()),
                  ),
                  Positioned(
                      right: 0,
                      top: -2,
                      child: Image.asset(
                        ImageConstants.ic_park_category,
                        height: 70.w,
                      ))
                ],
              ),
            ),
            Constants.spaceVertical(10),
            Text(
              ConstantsStrings.start_the_park,
              style: TextStyle(fontSize: 40.sp),
            ),
          ],
        ),
      ),
    );
  }
}
