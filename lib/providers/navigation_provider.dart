import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_expiry_tracker/models/page_body_model.dart';
import 'package:food_expiry_tracker/ui/core/app_title.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/favorite/favorite_screen.dart';
import 'package:food_expiry_tracker/ui/screens/home/home_body.dart';
import 'package:food_expiry_tracker/ui/screens/profile_setting/profile_setting_screen.dart';
import 'package:food_expiry_tracker/ui/screens/storage_summary/storage_summary_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex;
  String _activeDrawerMenu;
  PageBody _activePage;

  NavigationProvider.initialize() {
    _currentIndex = 0;
    _activeDrawerMenu = Routes.homeScreenController;
    _activePage = _bottomNavPageList
        .where((page) => page.routeName == Routes.homeScreenController)
        .first;
  }

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  get activeDrawerMenu => _activeDrawerMenu;
  PageBody get activePage => _activePage;

  set activeDrawerMenu(String routeName) {
    _activeDrawerMenu = routeName;
    _activePage = _bottomNavPageList
        .where((page) => page.routeName == routeName)
        .first;
    notifyListeners();
  }

  void setCurrentIndexByRouteName(String routeName) {
    _currentIndex =
        _bottomNavPageList.indexWhere((page) => page.routeName == routeName);
    notifyListeners();
  }

  final List<PageBody> _bottomNavPageList = <PageBody>[
    PageBody(
        title: AppTitle(innerApp: true),
        body: HomeBody(),
        routeName: Routes.homeScreenController),
    PageBody(
        title: AppTitle(innerApp: true),
        body: FavoriteScreen(),
        routeName: Routes.favoriteScreen),
    PageBody(
        title: AppTitle(innerApp: true),
        body: StorageSummaryScreen(),
        routeName: Routes.storageSummaryScreen),
    PageBody(
        title: AppTitle(innerApp: true),
        body: ProfileSettingScreen(),
        routeName: Routes.profileSettingScreen),
  ];

  get bottomNavBodyList => _bottomNavPageList;
}
