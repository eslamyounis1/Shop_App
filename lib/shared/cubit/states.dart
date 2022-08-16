abstract class ShopLoginState{}
class ShopLoginInitialSate extends ShopLoginState {}
class ShopLoginLoadingSate extends ShopLoginState {}
class ShopLoginSuccessSate extends ShopLoginState {}
class ShopLoginErrorSate extends ShopLoginState {

  late final String error;
  ShopLoginErrorSate(this.error);

}