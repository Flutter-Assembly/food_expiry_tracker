import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/providers/user_provider.dart';
import 'package:food_expiry_tracker/ui/screens/home/home_main.dart';
import 'package:food_expiry_tracker/ui/screens/intro/intro_screen.dart';
import 'package:food_expiry_tracker/ui/screens/login/login_screen.dart';
import 'package:food_expiry_tracker/ui/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Container(
          child: Text('Loading...'),
        );
      case Status.Unauthenticated:
        return IntroScreen();
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomeScreen();
      default: return WelcomeScreen();
    }
  }
}