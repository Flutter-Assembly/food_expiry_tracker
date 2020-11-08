// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/about/about_screen.dart';
import '../screens/add_food/add_food_screen.dart';
import '../screens/faqs/faq_screen.dart';
import '../screens/favorite/favorite_screen.dart';
import '../screens/feedback/feedback_screen.dart';
import '../screens/home/food_detail_screen.dart';
import '../screens/home/home_main.dart';
import '../screens/home/home_screen_controller.dart';
import '../screens/home/storage_detail_screen.dart';
import '../screens/intro/intro_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/profile_setting/profile_setting_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/storage_summary/storage_summary_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String introScreen = '/intro-screen';
  static const String welcomeScreen = '/welcome-screen';
  static const String loginScreen = '/login-screen';
  static const String signupScreen = '/signup-screen';
  static const String homeScreenController = '/home-screen-controller';
  static const String addFoodScreen = '/add-food-screen';
  static const String favoriteScreen = '/favorite-screen';
  static const String profileSettingScreen = '/profile-setting-screen';
  static const String storageSummaryScreen = '/storage-summary-screen';
  static const String searchScreen = '/search-screen';
  static const String aboutScreen = '/about-screen';
  static const String faqScreen = '/faq-screen';
  static const String feedbackScreen = '/feedback-screen';
  static const all = <String>{
    splashScreen,
    introScreen,
    welcomeScreen,
    loginScreen,
    signupScreen,
    homeScreenController,
    addFoodScreen,
    favoriteScreen,
    profileSettingScreen,
    storageSummaryScreen,
    searchScreen,
    aboutScreen,
    faqScreen,
    feedbackScreen,
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
    RouteDef(
      Routes.homeScreenController,
      page: HomeScreenController,
      generator: HomeScreenControllerRouter(),
    ),
    RouteDef(Routes.addFoodScreen, page: AddFoodScreen),
    RouteDef(Routes.favoriteScreen, page: FavoriteScreen),
    RouteDef(Routes.profileSettingScreen, page: ProfileSettingScreen),
    RouteDef(Routes.storageSummaryScreen, page: StorageSummaryScreen),
    RouteDef(Routes.searchScreen, page: SearchScreen),
    RouteDef(Routes.aboutScreen, page: AboutScreen),
    RouteDef(Routes.faqScreen, page: FaqScreen),
    RouteDef(Routes.feedbackScreen, page: FeedbackScreen),
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
    HomeScreenController: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            HomeScreenController(),
        settings: data,
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
    FavoriteScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FavoriteScreen(),
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
    StorageSummaryScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StorageSummaryScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    SearchScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SearchScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
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
    FeedbackScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FeedbackScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}

class HomeScreenControllerRoutes {
  static const String homeScreen = '/';
  static const String storageDetailScreen = '/storage-detail-screen';
  static const String foodDetailScreen = '/food-detail-screen';
  static const all = <String>{
    homeScreen,
    storageDetailScreen,
    foodDetailScreen,
  };
}

class HomeScreenControllerRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(HomeScreenControllerRoutes.homeScreen, page: HomeScreen),
    RouteDef(HomeScreenControllerRoutes.storageDetailScreen,
        page: StorageDetailScreen),
    RouteDef(HomeScreenControllerRoutes.foodDetailScreen,
        page: FoodDetailScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    StorageDetailScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StorageDetailScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    FoodDetailScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FoodDetailScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
  };
}
