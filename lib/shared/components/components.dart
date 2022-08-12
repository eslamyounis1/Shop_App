import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Navigation methods
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
