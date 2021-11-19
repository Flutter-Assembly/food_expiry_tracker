import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/app_scaffold.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/profile_setting/widgets/pantry_rack_info.dart';
import 'package:food_expiry_tracker/ui/screens/profile_setting/widgets/user_food_info.dart';

class ProfileSettingScreen extends StatefulWidget {
  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
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
          color: kPrimaryYellow,
          onPressed: () => context.router.pop(),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: kHeadingText3Medium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 15),
            child: InkWell(
              onTap: () => context.router.push(EditProfileScreenRoute()),
              child: Text(
                'Edit Profile',
                style: kHeadingText3Medium.copyWith(
                  color: kPrimaryYellow,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kPrimaryYellow, width: 5),
              ),
              child: Image.asset('assets/images/user2.png'),
            ),
            Text(
              'Pearly Jasper',
              textAlign: TextAlign.center,
              style: kHeadingText3Medium.copyWith(
                fontSize: 22,
                color: kPrimaryTextColor,
              ),
            ),
            Text(
              'pearljasper@gmail.com',
              textAlign: TextAlign.center,
              style: kBodyText4Regular,
            ),
            Divider(
              color: kSecondaryBorder,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserFoodInfo(
                    amount: 21,
                    title: 'Stored',
                  ),
                  UserFoodInfo(
                    amount: 17,
                    title: 'In Storage',
                  ),
                  UserFoodInfo(
                    amount: 4,
                    title: 'Expired',
                  ),
                ],
              ),
            ),
            Divider(
              color: kSecondaryBorder,
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22),
              child: Column(
                children: [
                  PantryRackInfo(
                    infoAmount: 7,
                    infoTitle: 'Fridge',
                    infoIconName: 'fridge',
                  ),
                  PantryRackInfo(
                    infoAmount: 7,
                    hasAmount: false,
                    infoTitle: 'Refrigerator',
                    infoIconName: 'refrigerator',
                  ),
                  PantryRackInfo(
                    infoAmount: 9,
                    infoTitle: 'Store',
                    infoIconName: 'store',
                  ),
                  PantryRackInfo(
                    infoAmount: 12,
                    infoTitle: 'Pantry',
                    infoIconName: 'pantry',
                  ),
                  PantryRackInfo(
                    infoAmount: 3,
                    hasBottomDivider: false,
                    infoTitle: 'Medicine Cabinet',
                    infoIconName: 'medicine_cabinet',
                  ),
                ],
              ),
            ),
            Divider(
              color: kSecondaryBorder,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
