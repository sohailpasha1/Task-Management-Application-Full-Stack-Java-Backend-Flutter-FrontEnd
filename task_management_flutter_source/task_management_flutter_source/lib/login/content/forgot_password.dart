import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../model/login_model.dart';

class ForgotPassword extends StatelessWidget {
  final LoginModel model;

  const ForgotPassword({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        alignment: const Alignment(0.75, 0),
        color: Colors.black,
        child: TextButton(
          style: Theme.of(context).textButtonTheme.style,
          onHover: (bool value) =>
              model.isHoveringForgotPasswordButtonFunction(model, value),
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  textBaseline: TextBaseline.alphabetic,
                  decorationThickness: 1.7,
                  decoration: model.isHoveringForgotPasswordButton.value
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
          ),
        ),
      ),
    );
  }
}
