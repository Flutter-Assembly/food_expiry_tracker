import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_expiry_tracker/providers/user_provider.dart';
import 'package:food_expiry_tracker/ui/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreenController extends StatefulWidget {
  @override
  _HomeScreenControllerState createState() => _HomeScreenControllerState();
}

class _HomeScreenControllerState extends State<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, authProvider, child) {
      return authProvider.status == Status.Authenticated
          ? ExtendedNavigator()
          : LoginScreen();
    });
  }
}
