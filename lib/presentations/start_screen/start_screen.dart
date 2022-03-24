import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ranger_park/presentations/home_screen/home_screen.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/fonts_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/string_constants.dart';
import '../../core/widgets/widgets_util.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody()),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Constants.spaceVertical(70),
          Image.asset(ImageConstants.ic_def_ranger,
              width: 0.45.sw, height: 0.45.sw),
          Constants.spaceVertical(55),
          Text(ConstantsStrings.learn_more,
              style: TextStyle(fontSize: 100.sp, color: Colors.white)),
          Constants.spaceVertical(34),
          Container(
            width: 280.w,
            child: Text(ConstantsStrings.learn_more_content,
                style: TextStyle(fontSize: 48.sp, fontFamily: FONT_FRAUNCES)),
          ),
          Constants.spaceVertical(115),
          WidgetUtil.startAdventureButton(onTap: () {
            onButtonTap();
          }),
          Constants.spaceVertical(80),
          WidgetUtil.oregonLogo()
        ],
      ),
    );
  }

  void onButtonTap(){
    Get.to(() => HomeScreen());
  }
}
