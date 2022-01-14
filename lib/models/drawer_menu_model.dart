import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';

class DrawerMenu {
  PageRouteInfo? menuRoute;
  String? menuName;
  IconData? menuIcon;
  bool? isBodyView;

  DrawerMenu({this.menuRoute, this.menuName, this.menuIcon, this.isBodyView});

  List<DrawerMenu> _menuList = [];
  List<DrawerMenu> get menuList => _menuList;

  initialize() {
    _menuList = <DrawerMenu>[
      DrawerMenu(
        menuRoute: HomeScreenControllerRoute(),
        menuName: 'Home',
        menuIcon: Icons.home,
        isBodyView: true,
      ),
      DrawerMenu(
        menuRoute: AddFoodScreenRoute(),
        menuName: 'Add Food',
        menuIcon: Icons.post_add,
        isBodyView: false,
      ),
      DrawerMenu(
        menuRoute: StorageSummaryScreenRoute(),
        menuName: 'Storage',
        menuIcon: Icons.insert_chart_outlined_rounded,
        isBodyView: true,
      ),
      DrawerMenu(
        menuRoute: FavoriteScreenRoute(),
        menuName: 'Favorite',
        menuIcon: Icons.favorite,
        isBodyView: true,
      ),
      DrawerMenu(
          menuRoute: ProfileSettingScreenRoute(),
          menuName: 'Settings',
          menuIcon: Icons.settings,
          isBodyView: true),
      DrawerMenu(
          menuRoute: FeedbackScreenRoute(),
          menuName: 'Feedback',
          menuIcon: Icons.feedback,
          isBodyView: false),
      DrawerMenu(
          menuRoute: FaqScreenRoute(),
          menuName: 'FaQs',
          menuIcon: Icons.help,
          isBodyView: false),
      DrawerMenu(
          menuRoute: AboutScreenRoute(),
          menuName: 'About',
          menuIcon: Icons.phone_android,
          isBodyView: false),
    ];
  }
}
