import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';

class CustomTextFormField extends StatefulWidget {
  final double? height;
  final int? lengthLimit;
  final String? hintText;
  final String? errorText;
  final String? labelText;
  final TextStyle? textStyle;
  final bool isPasswordField;
  final bool isNumberOnlyInput;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final Function(String? value)? onSave;
  final TextEditingController? controller;

  CustomTextFormField({
    this.onSave,
    this.height,
    this.hintText,
    this.labelText,
    this.validator,
    this.errorText,
    this.textStyle,
    this.controller,
    this.lengthLimit,
    this.keyboardType,
    this.isPasswordField = false,
    this.isNumberOnlyInput = false,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        onSaved: widget.onSave,
        style: widget.textStyle,
        controller: widget.controller,
        inputFormatters: widget.isNumberOnlyInput
            ? [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(widget.lengthLimit),
              ]
            : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.isPasswordField ? obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: kBodyText4,
          contentPadding: EdgeInsets.symmetric(
            vertical: 7.0,
            horizontal: 15.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: obscureText
                      ? Icon(
                          Icons.visibility_off,
                          color: kPrimaryColor,
                        )
                      : Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
              : SizedBox.shrink(),
        ),
        validator: widget.validator,
      ),
    );
  }
}
