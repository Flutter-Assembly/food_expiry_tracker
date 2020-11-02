import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/providers/intro_provider.dart';
import 'package:food_expiry_tracker/providers/user_provider.dart';
import 'package:food_expiry_tracker/ui/core/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: IntroProvider.initialize()),
      ],
      child: AppWidget(),
    ),
  );
}
