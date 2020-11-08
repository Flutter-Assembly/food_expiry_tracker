import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/helpers/size_config.dart';
import 'package:food_expiry_tracker/providers/user_provider.dart';
import 'package:food_expiry_tracker/ui/core/app_title.dart';
import 'package:food_expiry_tracker/ui/core/button_solid.dart';
import 'package:food_expiry_tracker/ui/core/dialog.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/ui/screens/login/widgets/footer_text.dart';
import 'package:food_expiry_tracker/ui/screens/login/widgets/form_divider.dart';
import 'package:food_expiry_tracker/ui/screens/login/widgets/google_btn.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupScaffoldKey = GlobalKey<ScaffoldState>();
  final _signupFormKey = GlobalKey<FormState>();
  final _dialogSignupKeyLoader = new GlobalKey<State>();

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  void displayError(String error) {
    Navigator.of(_dialogSignupKeyLoader.currentContext,rootNavigator: true).pop();
    _signupScaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final loading = user.status == Status.Authenticating;

    return Scaffold(
      key: _signupScaffoldKey,
      resizeToAvoidBottomPadding: true,
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
            key: _signupFormKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    AppTitle(innerApp: false),
                    Text(
                      'Sign up',
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
                      Dialogs.showLoadingDialog(context, _dialogSignupKeyLoader);
                      if(!await user.signInWithGoogle()){
                        displayError(user.errMessage);
                      }else{
                        Navigator.of(_dialogSignupKeyLoader.currentContext,rootNavigator: true).pop();
                        ExtendedNavigator.of(context)
                            .popAndPush(Routes.homeScreenController);
                      }
                    }
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                FormDivider('or'),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: kHeadingText3,
                  textCapitalization: TextCapitalization.words,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
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
                      return "The name field cannot be empty";
                    } else if (value.length < 3) {
                      return "the name has to be at least 3 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: kHeadingText3,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: kHeadingText3,
                  controller: passwordController,
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
                  title: 'Sign up now',
                  bgColor: kPrimaryColor,
                  onPressed: () async {
                    if(_signupFormKey.currentState.validate()){
                      Dialogs.showLoadingDialog(context, _dialogSignupKeyLoader);
                      if(!await user.signUp(emailController.text, passwordController.text, nameController.text)){
                        displayError(user.errMessage);
                      }else{
                        Navigator.of(_dialogSignupKeyLoader.currentContext,rootNavigator: true).pop();
                        ExtendedNavigator.of(context)
                            .popAndPush(Routes.homeScreenController);
                      }
                    }
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                FooterText(
                  textLabel: 'Already registered? ',
                  textAction: 'Sign in',
                  onTap: () {
                    ExtendedNavigator.of(context).popAndPush(Routes.loginScreen);
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
