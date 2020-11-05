import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_expiry_tracker/ui/screens/about/about_screen.dart';
import 'package:food_expiry_tracker/ui/screens/faqs/faq_screen.dart';
import 'package:food_expiry_tracker/ui/screens/feedback/feedback_screen.dart';
import 'package:food_expiry_tracker/ui/screens/home/food_detail_screen.dart';
import 'package:food_expiry_tracker/ui/screens/home/home_screen_controller.dart';
import 'package:food_expiry_tracker/ui/screens/home/storage_detail_screen.dart';
import 'package:food_expiry_tracker/ui/screens/search/search_screen.dart';
import 'package:food_expiry_tracker/ui/screens/splash/splash_screen.dart';
import 'package:food_expiry_tracker/ui/screens/intro/intro_screen.dart';
import 'package:food_expiry_tracker/ui/screens/usage_summary/usage_summary_screen.dart';
import 'package:food_expiry_tracker/ui/screens/welcome/welcome_screen.dart';
import 'package:food_expiry_tracker/ui/screens/login/login_screen.dart';
import 'package:food_expiry_tracker/ui/screens/signup/signup_screen.dart';
import 'package:food_expiry_tracker/ui/screens/home/home_screen.dart';
import 'package:food_expiry_tracker/ui/screens/add_food/add_food_screen.dart';
import 'package:food_expiry_tracker/ui/screens/profile_setting/profile_setting_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: SplashScreen, initial: true),
    CustomRoute(
        page: IntroScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: WelcomeScreen, transitionsBuilder: TransitionsBuilders.fadeIn),

    // auth screens
    CustomRoute(
        page: LoginScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SignupScreen, transitionsBuilder: TransitionsBuilders.fadeIn),

    // app screens
    CustomRoute(
      page: HomeScreenController,
      children: <AutoRoute>[
        CustomRoute(
            page: HomeScreen,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            initial: true),
        CustomRoute(
            page: StorageDetailScreen,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            page: FoodDetailScreen,
            transitionsBuilder: TransitionsBuilders.slideLeft),
      ],
    ),
    CustomRoute(
        page: AddFoodScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: ProfileSettingScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: UsageSummaryScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: SearchScreen, transitionsBuilder: TransitionsBuilders.fadeIn),

    // other screens
    CustomRoute(
        page: AboutScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: FaqScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: FeedbackScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AutoRouter {}
