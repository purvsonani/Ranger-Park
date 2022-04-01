import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ranger_park/core/widgets/widgets_util.dart';
import 'package:ranger_park/presentations/avatar_selection_screen/avatar_selection_screen.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/color_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/string_constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Constants.disableKeyboard(context),
      child: Scaffold(
        body: SafeArea(child: buildBody()),
        floatingActionButton: buildFloatButton(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Constants.spaceVertical(80),
            Image.asset(ImageConstants.ic_def_ranger,
                width: 0.45.sw, height: 0.45.sw),
            Constants.spaceVertical(55),
            Text(StringConstants.welcome,
                style: TextStyle(fontSize: 200.sp, color: Colors.white)),
            Constants.spaceVertical(34),
            Container(
              width: 250.w,
              child: Text(StringConstants.hello_ranger_whats_,
                  style: TextStyle(fontSize: 108.sp)),
            ),
            Constants.spaceVertical(60),
            buildTextField(),
            Constants.spaceVertical(50),
            WidgetUtil.startAdventureButton(onTap: (){
              onButtonTap();
            }),
            Constants.spaceVertical(150),
            WidgetUtil.oregonLogo()
          ],
        ),
      ),
    );
  }

  void onButtonTap() {
    if (_nameController.text.isNotEmpty){
      Get.to(AvatarSelectionScreen(
            userName: _nameController.text,
          ));
    } else {
      Fluttertoast.showToast(
        msg: StringConstants.nameToast,
        backgroundColor: ColorConstants.black,
        textColor: ColorConstants.white,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    }
  }

  Widget buildTextField() {
    return Container(
      child: TextFormField(
        style: TextStyle(
            decoration: TextDecoration.none,
            color: ColorConstants.white,
            fontSize: 63.sp,
            letterSpacing: 1),
        controller: _nameController,
        cursorColor: ColorConstants.white,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: BorderSide(
                    color: ColorConstants.textFieldBorder, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: BorderSide(color: ColorConstants.white, width: 2)),
            border: InputBorder.none,
            labelText: "type your name",
            labelStyle: TextStyle(
                color: ColorConstants.textFieldBorder, fontSize: 60.sp),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 100.w, vertical: 35.h)),
      ),
    );
  }

  Widget buildFloatButton() {
    return WidgetUtil.buildHelpFabButton(
        onPressed: () {},
        isKeyboardOpened: MediaQuery.of(context).viewInsets.bottom != 0);
  }
}
