import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialSate());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
  required String email,
    required String password,
}) {
    emit(ShopLoginLoadingSate());
    DioHelper.postData(
      url: 'login',   // end point that i want to use
      data: {
        'email':email,
        'password':password,
      },
    ).then((value) {
      print(value.data);
      emit(ShopLoginSuccessSate());
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorSate(error.toString()));
    });
  }
}
