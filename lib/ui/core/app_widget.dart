import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/core/app_config.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AutoRouter();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp.router(
        title: AppConfig.app_name,
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        // builder: ExtendedNavigator.builder<AutoRouter>(router: AutoRouter()),
        theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
          accentColor: kSecondaryColor,
          backgroundColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: kPrimaryColor,
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
