import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/helpers/size_config.dart';
import 'package:food_expiry_tracker/providers/user_provider.dart';
import 'package:food_expiry_tracker/ui/core/app_title.dart';
import 'package:food_expiry_tracker/ui/core/button_solid.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/login/widgets/footer_text.dart';
import 'package:food_expiry_tracker/ui/screens/login/widgets/form_divider.dart';
import 'package:food_expiry_tracker/ui/screens/login/widgets/google_btn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final loading = user.status == Status.Authenticating;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: kPrimaryTextColor,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 10,
            vertical: SizeConfig.blockSizeVertical * 4,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    AppTitle(),
                    Text(
                      'Sign In',
                      style: kHeadingText2.copyWith(
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                GoogleButton(
                  onPressed: () async {
                    ExtendedNavigator.of(context)
                        .popAndPush(Routes.homeScreenController);
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                FormDivider('or'),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: kHeadingText3,
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: kBodyText4,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 7.0,
                      horizontal: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "The email field cannot be empty";
                    }
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value))
                      return 'Please make sure your email address is valid';
                    else
                      return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  style: kHeadingText3,
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: kBodyText4,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 7.0,
                      horizontal: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "The password field cannot be empty";
                    } else if (value.length < 6) {
                      return "the password has to be at least 6 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                ButtonSolid(
                  title: 'Sign in now',
                  bgColor: kDeepYellow,
                  textColor: kPrimaryColor,
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                        ExtendedNavigator.of(context)
                          .popAndPush(Routes.homeScreenController);
                    }
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                FooterText(
                  textLabel: 'Not yet registered? ',
                  textAction: 'Sign up',
                  onTap: () {
                    ExtendedNavigator.of(context).popAndPush(Routes.signupScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
