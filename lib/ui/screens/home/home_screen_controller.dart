import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class HomeScreenController extends StatefulWidget {
  @override
  _HomeScreenControllerState createState() => _HomeScreenControllerState();
}

class _HomeScreenControllerState extends State<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedNavigator()
    );
  }
}
