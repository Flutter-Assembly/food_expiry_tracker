// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/about/about_screen.dart';
import '../screens/add_food/add_food_screen.dart';
import '../screens/expired_food/expired_food_screen.dart';
import '../screens/faqs/faq_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/intro/intro_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/profile_setting/profile_setting_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/support/support_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String introScreen = '/intro-screen';
  static const String welcomeScreen = '/welcome-screen';
  static const String loginScreen = '/login-screen';
  static const String signupScreen = '/signup-screen';
  static const String homeScreen = '/home-screen';
  static const String addFoodScreen = '/add-food-screen';
  static const String profileSettingScreen = '/profile-setting-screen';
  static const String expiredFoodScreen = '/expired-food-screen';
  static const String aboutScreen = '/about-screen';
  static const String faqScreen = '/faq-screen';
  static const String supportScreen = '/support-screen';
  static const all = <String>{
    splashScreen,
    introScreen,
    welcomeScreen,
    loginScreen,
    signupScreen,
    homeScreen,
    addFoodScreen,
    profileSettingScreen,
    expiredFoodScreen,
    aboutScreen,
    faqScreen,
    supportScreen,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.introScreen, page: IntroScreen),
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.signupScreen, page: SignupScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.addFoodScreen, page: AddFoodScreen),
    RouteDef(Routes.profileSettingScreen, page: ProfileSettingScreen),
    RouteDef(Routes.expiredFoodScreen, page: ExpiredFoodScreen),
    RouteDef(Routes.aboutScreen, page: AboutScreen),
    RouteDef(Routes.faqScreen, page: FaqScreen),
    RouteDef(Routes.supportScreen, page: SupportScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    IntroScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => IntroScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    WelcomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WelcomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LoginScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    SignupScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    HomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    AddFoodScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddFoodScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ProfileSettingScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProfileSettingScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ExpiredFoodScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ExpiredFoodScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    AboutScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AboutScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    FaqScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => FaqScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    SupportScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SupportScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}