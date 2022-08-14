import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/constants.dart';

// Navigation methods
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

// default Buttons
Widget primaryButton({
  required String buttonTxt,
  required Function onPressedButton,
}) =>
    Container(
      width: 343.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: primaryButtShadow.withOpacity(0.25),
            offset: const Offset(0.0, 4.0),
            blurRadius: 8.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          onPressedButton;
        },
        child: Text(
          buttonTxt,

        ),
      ),
    );
