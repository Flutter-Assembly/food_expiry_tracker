import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_expiry_tracker/helpers/size_config.dart';
import 'package:food_expiry_tracker/ui/core/button_outline.dart';
import 'package:food_expiry_tracker/ui/core/button_solid.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/refridgerator.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  color: Color.fromRGBO(255, 255, 255, 0.71),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/food_plate.png'),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          Text(
                            'Welcome to PantryRack',
                            style: kHeadingText2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          Text(
                            'A space to keep track of your food while it is fresh and tasty.',
                            style: kBodyText3,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 10,
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: ButtonSolid(
                              title: 'Create Account',
                              bgColor: kPrimaryColor,
                              onPressed: () {
                                ExtendedNavigator.of(context)
                                    .popAndPush(Routes.signupScreen);
                              },
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: ButtonSolid(
                              title: 'Login Now',
                              bgColor: kDeepYellow,
                              onPressed: () {
                                ExtendedNavigator.of(context)
                                    .popAndPush(Routes.loginScreen);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
