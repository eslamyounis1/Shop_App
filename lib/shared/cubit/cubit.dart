import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialSate());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  Future<String?> userLogin({
    required String email,
    required String password,
  }) async {
    emit(ShopLoginLoadingSate());
    return Future.delayed(

      const Duration(seconds: 1),
        (){
          DioHelper.postData(
            url: loginEndPoint, // end point that i want to use
            data: {
              'email': email,
              'password': password,
            },
          ).then((value) {
            debugPrint(value?.data.toString());
            emit(ShopLoginSuccessSate());
          }).catchError((error) {
            emit(ShopLoginErrorSate(error.toString()));
          });
        }
    );

  }
}
