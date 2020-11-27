import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';

class DrawerMenu {
  String menuRoute;
  String menuName;
  IconData menuIcon;
  bool isBodyView;

  DrawerMenu({this.menuRoute, this.menuName, this.menuIcon, this.isBodyView});

  List<DrawerMenu> _menuList = [];
  List<DrawerMenu> get menuList => _menuList;

  initialize() {
    _menuList = <DrawerMenu>[
      DrawerMenu(
        menuRoute: Routes.homeScreenController,
        menuName: 'Home',
        menuIcon: Icons.home,
        isBodyView: true,
      ),
      DrawerMenu(
        menuRoute: Routes.addFoodScreen,
        menuName: 'Add Food',
        menuIcon: Icons.post_add,
        isBodyView: false,
      ),
      DrawerMenu(
        menuRoute: Routes.storageSummaryScreen,
        menuName: 'Storage',
        menuIcon: Icons.insert_chart_outlined_rounded,
        isBodyView: true,
      ),
      DrawerMenu(
        menuRoute: Routes.favoriteScreen,
        menuName: 'Favorite',
        menuIcon: Icons.favorite,
        isBodyView: true,
      ),
      DrawerMenu(
          menuRoute: Routes.profileSettingScreen,
          menuName: 'Settings',
          menuIcon: Icons.settings,
          isBodyView: true),
      DrawerMenu(
          menuRoute: Routes.feedbackScreen,
          menuName: 'Feedback',
          menuIcon: Icons.feedback,
          isBodyView: false),
      DrawerMenu(
          menuRoute: Routes.faqScreen,
          menuName: 'FaQs',
          menuIcon: Icons.help,
          isBodyView: false),
      DrawerMenu(
          menuRoute: Routes.aboutScreen,
          menuName: 'About',
          menuIcon: Icons.phone_android,
          isBodyView: false),
    ];
  }
}
