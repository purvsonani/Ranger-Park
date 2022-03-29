import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/presentations/home_screen/tabs/activity_tab/activity_tab.dart';
import 'package:ranger_park/presentations/home_screen/tabs/instructions_tab/instructions_tab.dart';
import 'package:ranger_park/presentations/home_screen/tabs/rewards_tab/rewards_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void onTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
    print(">>>>>>>>>>>>>>" + _selectedIndex.toString());
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody()),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBody() {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) => setState(() {
        _selectedIndex == index;
      }),
      children: [
        ActivityTab(),
        RewardsTab(),
        InstructionsTab()
      ],
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
        backgroundColor: ColorConstants.bottomAppbarBackground,
        selectedItemColor: ColorConstants.selectedTabText,
        unselectedItemColor: ColorConstants.notSelectedTabText,
        onTap: onTap,
        currentIndex: _selectedIndex,
        selectedFontSize: 45.h,
        unselectedFontSize: 45.h,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageConstants.ic_activities,
              height: 0.07.sw,
            ),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageConstants.ic_activities,
              height: 0.07.sw,
            ),
            label: "Rewards",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImageConstants.ic_activities,
              height: 0.07.sw,
            ),
            label: "Instructions",
          ),
        ]);
  }
}
