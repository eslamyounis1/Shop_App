import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          buildPage('assets/images/first.png'),
          buildPage('assets/images/second.png'),
          buildPage('assets/images/first.png'),
        ],
      ),
    );
  }
}
