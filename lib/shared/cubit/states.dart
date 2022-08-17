abstract class ShopLoginStates{}
class ShopLoginInitialSate extends ShopLoginStates {}
class ShopLoginLoadingSate extends ShopLoginStates {}
class ShopLoginSuccessSate extends ShopLoginStates {}
class ShopLoginErrorSate extends ShopLoginStates {

  late final String error;
  ShopLoginErrorSate(this.error);

}