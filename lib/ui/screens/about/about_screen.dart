import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/app_config.dart';
import 'package:food_expiry_tracker/ui/core/app_scaffold.dart';
import 'package:food_expiry_tracker/ui/core/app_title.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/screens/about/widgets/app_details.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28.0,
          ),
          color: Colors.black,
          onPressed: () => context.router.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: AppTitle(),
            ),
            SizedBox(height: 40.0),
            AppDetails(
              title: 'App Name',
              description: AppConfig.app_name,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: kAppBarText.copyWith(color: kSecondaryTextColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _descriptionText,
                    style: kBodyText1.copyWith(
                        color: kSecondaryTextColor2, fontSize: 14.0),
                  ),
                ),
              ],
            ),
            AppDetails(
              title: 'App Version',
              description: 'v ${AppConfig.app_version_code}',
            )
          ],
        ),
      ),
    );
  }
}

String _descriptionText =
    'PantryRack is a simple application that allows users to record the expiry dates of food in their home storage facility (kitchen, firidge, store/pantry, medicine cabinet, etc). This is inpired by the need to provide home safety measures on food storage at home.';
