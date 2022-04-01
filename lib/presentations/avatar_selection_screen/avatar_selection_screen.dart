import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/presentations/avatar_selection_screen/widgets/custom_avatar.dart';
import 'package:get/get.dart';
import 'package:ranger_park/presentations/start_screen/start_screen.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/string_constants.dart';
import '../../core/widgets/widgets_util.dart';

class AvatarSelectionScreen extends StatefulWidget {
  final String userName;

  const AvatarSelectionScreen({required this.userName});

  @override
  State<AvatarSelectionScreen> createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  int _selectedAvatarIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody()),
      floatingActionButton: buildFloatButton(),
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
            Constants.spaceVertical(34),
            Container(
              width: 250.w,
              child: Text(
                  StringConstants.hello_user.replaceAll("@", widget.userName),
                  style:
                      TextStyle(fontSize: 108.sp, color: ColorConstants.white)),
            ),
            Constants.spaceVertical(150.h),
            avatarList(),
            Constants.spaceVertical(200),
            WidgetUtil.startAdventureButton(onTap: () {
              onButtonTap();
            }),
            Constants.spaceVertical(150),
            WidgetUtil.oregonLogo(),
            Constants.spaceVertical(70),
          ],
        ),
      ),
    );
  }

  void onButtonTap() {
    if (_selectedAvatarIndex != -1) {
      Get.to(() => StartScreen(name: widget.userName));
    } else {
      Fluttertoast.showToast(
          msg: StringConstants.avatarToast,
          backgroundColor: ColorConstants.black,
          textColor: ColorConstants.white,
          gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    }
  }

  Widget avatarList() {
    return Container(
      child: GridView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 100.w,
              mainAxisSpacing: 100.h),
          itemBuilder: (context, index) {
            final bool isSelected = _selectedAvatarIndex == index;
            return CustomAvatar(
                isSelected: isSelected,
                onPressed: () {
                  _selectedAvatarIndex = index;
                  setState(() {});
                });
          }),
    );
  }

  Widget buildFloatButton() {
    return WidgetUtil.buildHelpFabButton(
        onPressed: () {},
        isKeyboardOpened: MediaQuery.of(context).viewInsets.bottom != 0);
  }
}
