import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../model/login_model.dart';

class LoginButton extends StatelessWidget {
  final LoginModel model;

  const LoginButton({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'loginButton',
      builder: (LoginController controller) => Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: OutlinedButton(
              style: TextButton.styleFrom(
                disabledBackgroundColor: Theme.of(context).colorScheme.error,
                backgroundColor: Colors.black,
                fixedSize: const Size.fromHeight(13),
                shape: const StadiumBorder(
                  side: BorderSide(),
                ),
              ),
              autofocus: true,
              clipBehavior: Clip.hardEdge,
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  '/taskboard',
                );
              },
              // model.isLoginButtonActive
              //     ? () {
              //         if (isMatchedUsernameAndPassword(model)) {
              //           // APIService.getAuthorizationToken().then((String value) {
              //           //   Navigator.pushNamed(context, '/home');
              //           //   LoginController.to.resetActions(model);
              //           // }).onError((Object? error, StackTrace stackTrace) {
              //           //   Navigator.pushNamed(context, '/home');
              //           //   log('error calling auth url',
              //           //       error: error, stackTrace: stackTrace);
              //           // });
              //         } else {
              //           final SnackBar snackBar = SnackBar(
              //             showCloseIcon: true,
              //             backgroundColor:
              //                 Theme.of(context).colorScheme.background,
              //             behavior: SnackBarBehavior.floating,
              //             margin: const EdgeInsets.symmetric(vertical: 466),
              //             content: Text(
              //               'Invalid username or password...',
              //               textAlign: TextAlign.center,
              //               style: Theme.of(context).primaryTextTheme.bodySmall,
              //             ),
              //           );
              //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //         }
              //       }
              //     : null,
              child: Tooltip(
                preferBelow: false,
                message: model.isLoginButtonActive
                    ? 'Tap to Login'
                    : 'Username & Password is mandatory',
                child: Text(
                  'Login',
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }

  bool isMatchedUsernameAndPassword(LoginModel model) {
    //ToDo Username & Password Verification
    return true;
  }
}
