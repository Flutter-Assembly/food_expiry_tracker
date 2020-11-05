import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/app_config.dart';
import 'package:food_expiry_tracker/ui/core/app_title.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

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
        leadingWidth: 22.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.chevron_left,
            color: kDeepYellow,
            size: 32.0,
          ),
        ),
        title: Text(
          'Back',
          style: kAppBarText,
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
                        color: kSecondaryTextColorColor2, fontSize: 14.0),
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

//To show Title and Description of App details in a Row.
class AppDetails extends StatelessWidget {
  final String title;
  final String description;

  AppDetails({@required this.title, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: kPrimaryBorder,
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kAppBarText.copyWith(color: kSecondaryTextColor),
            ),
            Text(
              description,
              style: kBodyText1.copyWith(
                  color: kSecondaryTextColorColor2, fontSize: 14.0),
            ),
          ],
        ),
        Divider(
          color: kPrimaryBorder,
          thickness: 1.0,
        )
      ],
    );
  }
}

String _descriptionText =
    'PantryRack is a simple application that allows users to record the expiry dates of food in their home storage facility (kitchen, firidge, store/pantry, medicine cabinet, etc). This is inpired by the need to provide home safety measures on food storage at home.';
