import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

//metropolis
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
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
                          formController: emailController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Enter your Email Address';
                            }
                            // return null;
                          }),
                      const SizedBox(
                        height: 8.0,
                      ),
                      primaryTextField(
                          hintTxt: 'Password',
                          formController: passwordController,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'You must Enter your Password';
                            }
                            // return null;
                          }),
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
                      const SizedBox(
                        height: 32.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingSate,
                        builder: (context) => primaryButton(
                          onPressedButton: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          buttonTxt: 'login',
                          isUpper: true,
                        ),
                        fallback: (context) => Container(
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
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(top: 170.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Or login with social account',
                                  style: TextStyle(
                                    fontFamily: 'metropolis',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('assets/images/google.png'),
                                  width: 92.0,
                                  height: 64.0,
                                ),
                                Image(
                                  image:
                                      AssetImage('assets/images/facebook.png'),
                                  width: 92.0,
                                  height: 64.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
