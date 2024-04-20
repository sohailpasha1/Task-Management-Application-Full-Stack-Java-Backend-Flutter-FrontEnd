import 'package:get/get.dart';

import '../model/login_model.dart';
import '../ui/login.dart';

class LoginController extends GetxController {
  static LoginController to = Get.find();

  Login buildLogin() {
    final LoginModel model = LoginModel(
      toggleDoPasswordVisible: toggleDoPasswordVisible,
      toggleAccountTypeGoogle: toggleAccountTypeGoogle,
      toggleAccountTypeFacebook: toggleAccountTypeFacebook,
      updateLoginButtonActiveStatus: updateLoginButtonActiveStatus,
      isHoveringGoogleButtonFunction: isHoveringGoogleButtonFunction,
      isHoveringFacebookButtonFunction: isHoveringFacebookButtonFunction,
      isHoveringForgotPasswordButtonFunction:
          isHoveringForgotPasswordButtonFunction,
      updateIsTokenLoaded: updateIsTokenLoaded,
    );
    return Login(model: model);
  }

  void toggleDoPasswordVisible(LoginModel model) {
    model.doPasswordInVisible.value = !model.doPasswordInVisible.value;
  }

  void toggleAccountTypeGoogle(LoginModel model) {
    model.isPressedGoogleButton.value = true;
    model.isPressedFacebookButton.value = false;
  }

  void toggleAccountTypeFacebook(LoginModel model) {
    model.isPressedGoogleButton.value = false;
    model.isPressedFacebookButton.value = true;
  }

  void isHoveringGoogleButtonFunction(LoginModel model, bool value) {
    model.isHoveringGoogleButton.value = value;
  }

  void isHoveringFacebookButtonFunction(LoginModel model, bool value) {
    model.isHoveringFacebookButton.value = value;
  }

  void isHoveringForgotPasswordButtonFunction(LoginModel model, bool value) {
    model.isHoveringForgotPasswordButton.value = value;
  }

  void updateLoginButtonActiveStatus(LoginModel model) {
    if (model.usernameController.value.text.trim().isNotEmpty &&
        model.passwordController.value.text.trim().isNotEmpty) {
      model.isLoginButtonActive = true;
      update(['loginButton']);
    } else {
      model.isLoginButtonActive = false;
      update(['loginButton']);
    }
  }

  void updateIsTokenLoaded(LoginModel model) {
    model.isTokenLoaded.value = true;
  }

  void resetActions(LoginModel model) {
    model.isPressedGoogleButton = false.obs;
    model.isPressedFacebookButton = false.obs;
    model.isTokenLoaded = false.obs;
  }
}
