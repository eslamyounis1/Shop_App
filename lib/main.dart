import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/styles/themes/themes.dart';

import 'bloc_observer.dart';
import 'modules/on_boarding/onboarding_screen.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: OnBoardingScreen(),
    );
  }
}
