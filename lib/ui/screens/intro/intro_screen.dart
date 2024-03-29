import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/helpers/size_config.dart';
import 'package:food_expiry_tracker/providers/intro_provider.dart';
import 'package:food_expiry_tracker/ui/core/app_title.dart';
import 'package:food_expiry_tracker/ui/core/button_solid.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/intro/widgets/control_buttons.dart';
import 'package:food_expiry_tracker/ui/screens/intro/widgets/transformer_pageview.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _slideIndex = 0;

  void onPageChanged(int index) {
    setState(
      () {
        _slideIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final intro = Provider.of<IntroProvider>(context);
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kAppPadding),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: AppTitle(innerApp: false),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  // color: Colors.red,
                  child: TransformPageView(
                    onPageChanged: onPageChanged,
                    slideIndex: _slideIndex,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeHorizontal * 2),
              controlButtons(_slideIndex),
              SizedBox(height: SizeConfig.blockSizeHorizontal * 2),
              Text(
                intro.introList[_slideIndex].title!,
                style: kHeadingText1.copyWith(color: kPrimaryYellow),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.blockSizeHorizontal * 2),
              Text(
                intro.introList[_slideIndex].description!,
                style: kBodyText3,
                textAlign: TextAlign.center,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: ButtonSolid(
                                title: 'Skip',
                                bgColor: kPrimaryColor,
                                onPressed: () {
                                  context.router
                                      .popAndPush(WelcomeScreenRoute());
                                },
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 4,
                            ),
                            Expanded(
                              child: this._slideIndex <
                                      intro.introList.length - 1
                                  ? ButtonSolid(
                                      title: 'Next',
                                      bgColor: kPrimaryYellow,
                                      textColor: kPrimaryColor,
                                      onPressed: () {
                                        setState(
                                          () {
                                            this._slideIndex = this
                                                        ._slideIndex <
                                                    intro.introList.length - 1
                                                ? (this._slideIndex + 1)
                                                : 0;
                                          },
                                        );
                                      },
                                    )
                                  : ButtonSolid(
                                      title: 'Get Started',
                                      bgColor: kPrimaryYellow,
                                      textColor: kPrimaryColor,
                                      onPressed: () {
                                        context.router
                                            .popAndPush(WelcomeScreenRoute());
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 2,
                      ),
                    ],
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
