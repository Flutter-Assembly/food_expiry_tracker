import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.white,
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Please Wait....",
                      style: TextStyle(color: kPrimaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
