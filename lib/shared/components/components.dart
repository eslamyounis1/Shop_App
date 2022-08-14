import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontFamily: 'metropolis',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

Widget primaryTextField({
  required String hintTxt,
  String? labelTxt,
}) =>
    Container(
      width: 343.0,
      height: 64.0,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintTxt,
            hintStyle: TextStyle(
              fontFamily: 'metropolis',
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: HexColor('#9B9B9B'),

            ),
            labelText: labelTxt,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            )),
      ),
    );
