# UI

This contain application user interfaces such as views, widgets

## Steps to add a Screen

* Navigate to `lib/ui/screens/ directory`
* If you're adding a new screen. Create a folder for the screen name e.g notification
* Create the screen dart file e.g notification_screen.dart
* Create a sub directory named `widgets` to allow addition of widget used by the screen added
* Implement your screen logic UI

> You can check the style guide for color, spacing etc. Also check the lib/ui/core folder for 
> global widgets to reuse e.g buttons, app drawer, app scaffold etc.

## Steps to route the Screen

* Navigate to `lib/ui/route/router.dart` folder
* Open the `router.dart` file and add your route. check example below

```dart
/*
page: the destination screen
transitionsBuilder: the transition effect to visit the screen
*/
import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_expiry_tracker/ui/screens/notification/notification_screen.dart';  

@MaterialAutoRouter(
  routes: <AutoRoute>[ 
    CustomRoute(page: NotificationScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AutoRouter {}
```

* Run code generation command to generate your route

```shell script
flutter packages pub run build_runner build
```

> If the above command result to an error use the flag in the example below
```shell script
flutter packages pub run build_runner build --delete-conflicting-outputs
```

* Then you can have a click method on your widget that route to the specified screen e.g

```dart
import 'package:auto_route/auto_route.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';

ExtendedNavigator.of(context).push(Routes.NotificationScreen);
```

> Check [auto_toute](https://pub.dev/packages/auto_route) for guide on adding route 

## Customizing a page with the AppScaffold widget

The **AppScaffold** is used as a custom housing to allow easy configuration of standalone or 
home level screen. Check `lib/ui/home/home_screen` for an example

* Standalone screens: These are screen that may not contain bottonNavBar. 
Their links are mostly accessible through drawer or sub page level.
Example is AboutScreen, FaQsScreen etc

> Check the figma UI to understand better. See [Figma board](https://www.figma.com/file/xjKua7FWHKMDXYMjk3iyK3/Flutter-Assembly-Food-Expiry-Tracker)

* Home level screens: These are screen that have bottomNavBar to display specific widget based on
navbar state
Examples are HomeScreen, FavoriteScreen, StorageScreen, Settings Screen etc
