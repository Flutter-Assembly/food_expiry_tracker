import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/providers/user_provider.dart';
import 'package:food_expiry_tracker/ui/core/button_outline.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome, ${auth.user.displayName}'),
          ButtonOutline(
            onPressed: () async {
              await auth.signOut();
            },
            title: 'Logout',
            textColor: kPrimaryYellow,
            borderColor: kPrimaryYellow,
          )
        ],
      ),
    );
  }
}
