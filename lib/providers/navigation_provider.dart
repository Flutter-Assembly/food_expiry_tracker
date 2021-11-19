import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:food_expiry_tracker/models/page_body_model.dart';
import 'package:food_expiry_tracker/ui/core/app_title.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/favorite/favorite_screen.dart';
import 'package:food_expiry_tracker/ui/screens/home/home_body.dart';
import 'package:food_expiry_tracker/ui/screens/profile_setting/profile_setting_screen.dart';
import 'package:food_expiry_tracker/ui/screens/settings/settings.dart';
import 'package:food_expiry_tracker/ui/screens/storage_summary/storage_summary_screen.dart';

class NavigationProvider with ChangeNotifier {
  late int _currentIndex;
  late PageRouteInfo _activeDrawerMenu;
  late PageBody _activePage;

  NavigationProvider.initialize() {
    _currentIndex = 0;
    _activeDrawerMenu = HomeScreenControllerRoute();
    _activePage = _bottomNavPageList
        .where((page) => page.routeName == HomeScreenControllerRoute())
        .first;
  }

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  PageRouteInfo get activeDrawerMenu => _activeDrawerMenu;
  PageBody get activePage => _activePage;

  set activeDrawerMenu(PageRouteInfo routeName) {
    _activeDrawerMenu = routeName;
    _activePage =
        _bottomNavPageList.where((page) => page.routeName == routeName).first;
    notifyListeners();
  }

  void setCurrentIndexByRouteName(PageRouteInfo routeName) {
    _currentIndex =
        _bottomNavPageList.indexWhere((page) => page.routeName == routeName);
    notifyListeners();
  }

  final List<PageBody> _bottomNavPageList = <PageBody>[
    PageBody(
        title: AppTitle(innerApp: true),
        body: HomeBody(),
        routeName: HomeScreenControllerRoute()),
    PageBody(
        title: AppTitle(innerApp: true),
        body: FavoriteScreen(),
        routeName: FavoriteScreenRoute()),
    PageBody(
        title: AppTitle(innerApp: true),
        body: StorageSummaryScreen(),
        routeName: StorageSummaryScreenRoute()),
    PageBody(
        title: AppTitle(innerApp: true),
        body: SettingsScreen(),
        routeName: SettingsScreenRoute()),
  ];

  get bottomNavBodyList => _bottomNavPageList;
}
