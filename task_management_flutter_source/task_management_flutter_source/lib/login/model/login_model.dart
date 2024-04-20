import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LoginModel {
  late RxBool doPasswordInVisible;
  late Function toggleDoPasswordVisible;
  late Rx<TextEditingController> passwordController;
  late Rx<TextEditingController> usernameController;
  late RxBool isHoveringForgotPasswordButton;
  late RxBool isHoveringGoogleButton;
  late RxBool isHoveringFacebookButton;
  late RxBool isPressedGoogleButton;
  late RxBool isPressedFacebookButton;
  late RxBool isTokenLoaded;
  late bool isLoginButtonActive;
  late Function toggleAccountTypeFacebook;
  late Function toggleAccountTypeGoogle;
  late Function isHoveringGoogleButtonFunction;
  late Function isHoveringFacebookButtonFunction;
  late Function updateLoginButtonActiveStatus;
  late Function isHoveringForgotPasswordButtonFunction;
  late Function updateIsTokenLoaded;

  LoginModel(
      {required this.toggleDoPasswordVisible,
      required this.toggleAccountTypeFacebook,
      required this.toggleAccountTypeGoogle,
      required this.updateLoginButtonActiveStatus,
      required this.isHoveringGoogleButtonFunction,
      required this.isHoveringFacebookButtonFunction,
      required this.updateIsTokenLoaded,
      required this.isHoveringForgotPasswordButtonFunction}) {
    doPasswordInVisible = true.obs;
    passwordController = TextEditingController(text: '').obs;
    usernameController = TextEditingController(text: '').obs;
    isHoveringForgotPasswordButton = false.obs;
    isHoveringGoogleButton = false.obs;
    isHoveringFacebookButton = false.obs;
    isPressedGoogleButton = false.obs;
    isPressedFacebookButton = false.obs;
    isLoginButtonActive = false;
    isTokenLoaded = false.obs;
  }
}
