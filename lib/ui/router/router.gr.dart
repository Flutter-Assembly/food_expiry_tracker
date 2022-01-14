// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;

import '../screens/about/about_screen.dart' as _i12;
import '../screens/add_food/add_food_screen.dart' as _i7;
import '../screens/edit_profile_screen.dart' as _i17;
import '../screens/faqs/faq_screen.dart' as _i13;
import '../screens/favorite/favorite_screen.dart' as _i8;
import '../screens/feedback/feedback_screen.dart' as _i14;
import '../screens/food_details/food_detials_screen.dart' as _i15;
import '../screens/home/food_detail_screen.dart' as _i20;
import '../screens/home/home_main.dart' as _i18;
import '../screens/home/home_screen_controller.dart' as _i6;
import '../screens/home/storage_detail_screen.dart' as _i19;
import '../screens/intro/intro_screen.dart' as _i2;
import '../screens/login/login_screen.dart' as _i4;
import '../screens/profile_setting/profile_setting_screen.dart' as _i16;
import '../screens/search/search_screen.dart' as _i11;
import '../screens/settings/settings.dart' as _i10;
import '../screens/signup/signup_screen.dart' as _i5;
import '../screens/splash/splash_screen.dart' as _i1;
import '../screens/storage_summary/storage_summary_screen.dart' as _i9;
import '../screens/welcome/welcome_screen.dart' as _i3;

class AutoRouter extends _i21.RootStackRouter {
  AutoRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.SplashScreen());
    },
    IntroScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.IntroScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.WelcomeScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    LoginScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.LoginScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SignupScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.SignupScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    HomeScreenControllerRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.HomeScreenController(),
          opaque: true,
          barrierDismissible: false);
    },
    AddFoodScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.AddFoodScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    FavoriteScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.FavoriteScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    StorageSummaryScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.StorageSummaryScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SettingsScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.SettingsScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SearchScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.SearchScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.slideBottom,
          opaque: true,
          barrierDismissible: false);
    },
    AboutScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.AboutScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    FaqScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i13.FaqScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    FeedbackScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i14.FeedbackScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    FoodDetailsScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i15.FoodDetailsScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileSettingScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i16.ProfileSettingScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    EditProfileScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i17.EditProfileScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    HomeScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i18.HomeScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    StorageDetailScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i19.StorageDetailScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    FoodDetailScreenRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
          routeData: routeData,
          child: _i20.FoodDetailScreen(),
          transitionsBuilder: _i21.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i21.RouteConfig(IntroScreenRoute.name, path: '/intro-screen'),
        _i21.RouteConfig(WelcomeScreenRoute.name, path: '/welcome-screen'),
        _i21.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i21.RouteConfig(SignupScreenRoute.name, path: '/signup-screen'),
        _i21.RouteConfig(HomeScreenControllerRoute.name,
            path: '/home-screen-controller',
            children: [
              _i21.RouteConfig(HomeScreenRoute.name,
                  path: '', parent: HomeScreenControllerRoute.name),
              _i21.RouteConfig(StorageDetailScreenRoute.name,
                  path: 'storage-detail-screen',
                  parent: HomeScreenControllerRoute.name),
              _i21.RouteConfig(FoodDetailScreenRoute.name,
                  path: 'food-detail-screen',
                  parent: HomeScreenControllerRoute.name)
            ]),
        _i21.RouteConfig(AddFoodScreenRoute.name, path: '/add-food-screen'),
        _i21.RouteConfig(FavoriteScreenRoute.name, path: '/favorite-screen'),
        _i21.RouteConfig(StorageSummaryScreenRoute.name,
            path: '/storage-summary-screen'),
        _i21.RouteConfig(SettingsScreenRoute.name, path: '/settings-screen'),
        _i21.RouteConfig(SearchScreenRoute.name, path: '/search-screen'),
        _i21.RouteConfig(AboutScreenRoute.name, path: '/about-screen'),
        _i21.RouteConfig(FaqScreenRoute.name, path: '/faq-screen'),
        _i21.RouteConfig(FeedbackScreenRoute.name, path: '/feedback-screen'),
        _i21.RouteConfig(FoodDetailsScreenRoute.name,
            path: '/food-details-screen'),
        _i21.RouteConfig(ProfileSettingScreenRoute.name,
            path: '/profile-setting-screen'),
        _i21.RouteConfig(EditProfileScreenRoute.name,
            path: '/edit-profile-screen')
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i21.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i2.IntroScreen]
class IntroScreenRoute extends _i21.PageRouteInfo<void> {
  const IntroScreenRoute() : super(name, path: '/intro-screen');

  static const String name = 'IntroScreenRoute';
}

/// generated route for [_i3.WelcomeScreen]
class WelcomeScreenRoute extends _i21.PageRouteInfo<void> {
  const WelcomeScreenRoute() : super(name, path: '/welcome-screen');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for [_i4.LoginScreen]
class LoginScreenRoute extends _i21.PageRouteInfo<void> {
  const LoginScreenRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

/// generated route for [_i5.SignupScreen]
class SignupScreenRoute extends _i21.PageRouteInfo<void> {
  const SignupScreenRoute() : super(name, path: '/signup-screen');

  static const String name = 'SignupScreenRoute';
}

/// generated route for [_i6.HomeScreenController]
class HomeScreenControllerRoute extends _i21.PageRouteInfo<void> {
  const HomeScreenControllerRoute({List<_i21.PageRouteInfo>? children})
      : super(name, path: '/home-screen-controller', initialChildren: children);

  static const String name = 'HomeScreenControllerRoute';
}

/// generated route for [_i7.AddFoodScreen]
class AddFoodScreenRoute extends _i21.PageRouteInfo<void> {
  const AddFoodScreenRoute() : super(name, path: '/add-food-screen');

  static const String name = 'AddFoodScreenRoute';
}

/// generated route for [_i8.FavoriteScreen]
class FavoriteScreenRoute extends _i21.PageRouteInfo<void> {
  const FavoriteScreenRoute() : super(name, path: '/favorite-screen');

  static const String name = 'FavoriteScreenRoute';
}

/// generated route for [_i9.StorageSummaryScreen]
class StorageSummaryScreenRoute extends _i21.PageRouteInfo<void> {
  const StorageSummaryScreenRoute()
      : super(name, path: '/storage-summary-screen');

  static const String name = 'StorageSummaryScreenRoute';
}

/// generated route for [_i10.SettingsScreen]
class SettingsScreenRoute extends _i21.PageRouteInfo<void> {
  const SettingsScreenRoute() : super(name, path: '/settings-screen');

  static const String name = 'SettingsScreenRoute';
}

/// generated route for [_i11.SearchScreen]
class SearchScreenRoute extends _i21.PageRouteInfo<void> {
  const SearchScreenRoute() : super(name, path: '/search-screen');

  static const String name = 'SearchScreenRoute';
}

/// generated route for [_i12.AboutScreen]
class AboutScreenRoute extends _i21.PageRouteInfo<void> {
  const AboutScreenRoute() : super(name, path: '/about-screen');

  static const String name = 'AboutScreenRoute';
}

/// generated route for [_i13.FaqScreen]
class FaqScreenRoute extends _i21.PageRouteInfo<void> {
  const FaqScreenRoute() : super(name, path: '/faq-screen');

  static const String name = 'FaqScreenRoute';
}

/// generated route for [_i14.FeedbackScreen]
class FeedbackScreenRoute extends _i21.PageRouteInfo<void> {
  const FeedbackScreenRoute() : super(name, path: '/feedback-screen');

  static const String name = 'FeedbackScreenRoute';
}

/// generated route for [_i15.FoodDetailsScreen]
class FoodDetailsScreenRoute extends _i21.PageRouteInfo<void> {
  const FoodDetailsScreenRoute() : super(name, path: '/food-details-screen');

  static const String name = 'FoodDetailsScreenRoute';
}

/// generated route for [_i16.ProfileSettingScreen]
class ProfileSettingScreenRoute extends _i21.PageRouteInfo<void> {
  const ProfileSettingScreenRoute()
      : super(name, path: '/profile-setting-screen');

  static const String name = 'ProfileSettingScreenRoute';
}

/// generated route for [_i17.EditProfileScreen]
class EditProfileScreenRoute extends _i21.PageRouteInfo<void> {
  const EditProfileScreenRoute() : super(name, path: '/edit-profile-screen');

  static const String name = 'EditProfileScreenRoute';
}

/// generated route for [_i18.HomeScreen]
class HomeScreenRoute extends _i21.PageRouteInfo<void> {
  const HomeScreenRoute() : super(name, path: '');

  static const String name = 'HomeScreenRoute';
}

/// generated route for [_i19.StorageDetailScreen]
class StorageDetailScreenRoute extends _i21.PageRouteInfo<void> {
  const StorageDetailScreenRoute() : super(name, path: 'storage-detail-screen');

  static const String name = 'StorageDetailScreenRoute';
}

/// generated route for [_i20.FoodDetailScreen]
class FoodDetailScreenRoute extends _i21.PageRouteInfo<void> {
  const FoodDetailScreenRoute() : super(name, path: 'food-detail-screen');

  static const String name = 'FoodDetailScreenRoute';
}
