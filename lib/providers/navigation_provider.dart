import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_expiry_tracker/models/page_body_model.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/favorite/favorite_screen.dart';
import 'package:food_expiry_tracker/ui/screens/home/home_body.dart';
import 'package:food_expiry_tracker/ui/screens/profile_setting/profile_setting_screen.dart';
import 'package:food_expiry_tracker/ui/screens/storage_summary/storage_summary_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex;
  String _activeDrawerMenu;

  NavigationProvider.initialize() {
    _currentIndex = 0;
    _activeDrawerMenu = Routes.homeScreenController;
  }

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  get activeDrawerMenu => _activeDrawerMenu;

  set activeDrawerMenu(String routeName) {
    _activeDrawerMenu = routeName;
    notifyListeners();
  }

  void setCurrentIndexByRouteName(String routeName) {
    _currentIndex =
        _bottomNavPageList.indexWhere((page) => page.routeName == routeName);
    notifyListeners();
  }

  final List<PageBody> _bottomNavPageList = <PageBody>[
    PageBody(
        title: Text('Home'),
        body: HomeBody(),
        routeName: Routes.homeScreenController),
    PageBody(
        title: Text('Favorite'),
        body: FavoriteScreen(),
        routeName: Routes.favoriteScreen),
    PageBody(
        title: Text('Storage Summary'),
        body: StorageSummaryScreen(),
        routeName: Routes.storageSummaryScreen),
    PageBody(
        title: Text('Settings'),
        body: ProfileSettingScreen(),
        routeName: Routes.profileSettingScreen),
  ];

  get bottomNavBodyList => _bottomNavPageList;
}
