import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:food_expiry_tracker/models/page_body_model.dart';
import 'package:food_expiry_tracker/providers/navigation_provider.dart';
import 'package:food_expiry_tracker/ui/core/app_drawer.dart';
import 'package:food_expiry_tracker/ui/core/app_scaffold.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/home/widgets/fab_bottom_bar.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _favoriteNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _storageSummaryNavigatorKey =
    GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _settingNavigatorKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    _homeNavigatorKey,
    _favoriteNavigatorKey,
    _homeNavigatorKey,
    _storageSummaryNavigatorKey,
    _settingNavigatorKey
  ];

  //to handle back button pressed
  Future<bool> _systemBackButtonPressed() {
    if (_navigatorKeys[_selectedIndex].currentState.canPop()) {
      _navigatorKeys[_selectedIndex]
          .currentState
          .pop(_navigatorKeys[_selectedIndex].currentContext);
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return WillPopScope(
      onWillPop: _systemBackButtonPressed,
      child: AppScaffold(
        // drawer: Consumer<NavigationProvider>(
        //   builder: (context, navigationProvider, child) {
        //     return AppDrawer(activeMenu: navigationProvider.activeDrawerMenu);
        //   },
        // ),
        drawer: AppDrawer(),
        body: IndexedStack(
          index: navigationProvider.currentIndex,
          children: navigationProvider.bottomNavBodyList
              .map<Widget>((PageBody pages) {
            return pages.body;
          }).toList(),
        ),
        footer: FABBottomAppBar(
          backgroundColor: kPrimaryColor,
          // centerItemText: 'Add Food',
          color: Colors.grey,
          selectedColor: Colors.white,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: (int index) {
            navigationProvider.currentIndex = index;
            navigationProvider.activeDrawerMenu =
                navigationProvider.bottomNavBodyList[index].routeName;
          },
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
            FABBottomAppBarItem(iconData: Icons.favorite, text: 'Favourites'),
            FABBottomAppBarItem(
                iconData: Icons.insert_chart_outlined_rounded, text: 'Storage'),
            FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
          ],
        ),
        fabLocation: FloatingActionButtonLocation.centerDocked,
        fab: FloatingActionButton(
          onPressed: () {
            ExtendedNavigator.of(context).push(Routes.addFoodScreen);
          },
          tooltip: 'Add Food',
          child: Icon(Icons.add),
          elevation: 2.0,
        ),
      ),
    );
  }
}
