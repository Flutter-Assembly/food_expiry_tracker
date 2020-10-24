import 'package:auto_route/auto_route.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart'; 
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:flutter/services.dart'; 
import 'package:food_expiry_tracker/ui/core/ui_setting.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: UISetting.app_color
    ));

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: UISetting.app_name,
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator.builder<AutoRouter>(router: AutoRouter()),
        // ExtendedNavigator(router: Router()),
        theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          backgroundColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor:  kPrimaryColor,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
