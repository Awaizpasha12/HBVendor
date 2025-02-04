import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happybash/screens/product_add_screen.dart';
import 'package:happybash/screens/product_menu_screen.dart';
import 'package:happybash/utility/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:happybash/screens/dashboard_screen.dart';

import '../controllers/personal_information_controller.dart';
import '../screens/profile_screen.dart';
import 'common_method.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  State<CommonBottomNavigationBar> createState() => _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  final navigationScreen = [
    const DashboardScreen(),
    const ProductMenuScreen(),
    const ProfileScreen(),
    const SizedBox(),
    const SizedBox(),

  ];
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  _getData() async {
    await PersonalInformationController.to.getUserDetailsApiCall(() {
      setObject("authUserData", PersonalInformationController.to.userDetailsData.value);
      setIsLogin(isLogin: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationScreen[selectedIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: colorFFFFFF,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: color2A9DA0,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/li_home.png", scale: 4),
              activeIcon: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: colorDFFBE7,
                ),
                child: Image.asset(
                  "assets/images/li_home.png",
                  scale: 4,
                  color: color2A9DA0,
                ),
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/menu.png", scale: 4),
              activeIcon: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: colorDFFBE7,
                ),
                child: Image.asset(
                  "assets/images/menu.png",
                  scale: 4,
                  color: color2A9DA0,
                ),
              ),
              label: "menu",
            ),
            // BottomNavigationBarItem(
            //   icon: Image.asset("assets/images/Add.png", scale: 4),
            //   activeIcon: Container(
            //     height: 48,
            //     width: 48,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       color: colorDFFBE7,
            //     ),
            //     child: Image.asset(
            //       "assets/images/Add.png",
            //       scale: 4,
            //       color: color2A9DA0,
            //     ),
            //   ),
            //   label: "add",
            // ),
            // BottomNavigationBarItem(
            //   icon: Image.asset("assets/images/truck-delivery.png", scale: 4),
            //   activeIcon: Container(
            //     height: 48,
            //     width: 48,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       color: colorDFFBE7,
            //     ),
            //     child: Image.asset(
            //       "assets/images/truck-delivery.png",
            //       scale: 4,
            //       color: color2A9DA0,
            //     ),
            //   ),
            //   label: "add",
            // ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/li_user.png", scale: 4),
              activeIcon: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: colorDFFBE7,
                  ),
                  child: Image.asset(
                "assets/images/li_user.png",
                scale: 4,
                color: color2A9DA0,
              )),
              label: "user",
            ),
          ],
        ),
      ),
    );
  }
}
