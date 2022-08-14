import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

//metropolis
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontFamily: 'metropolis',
                fontSize: 34.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 73.0,
            ),
            primaryTextField(
              hintTxt: 'Email',
            ),
            const SizedBox(
              height: 8.0,
            ),
            primaryTextField(
              hintTxt: 'Password',
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: 343.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontFamily: 'metropolis',
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    child: const Image(
                      width: 24.0,
                      height: 24.0,
                      image: AssetImage('assets/images/arrow.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
