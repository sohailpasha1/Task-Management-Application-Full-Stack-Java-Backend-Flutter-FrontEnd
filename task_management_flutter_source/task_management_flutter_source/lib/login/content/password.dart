import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_model.dart';

class Password extends StatelessWidget {
  final LoginModel model;

  const Password({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Container(),
        ),
        Obx(
          () => Flexible(
            flex: 8,
            child: TextField(
              onChanged: (String value) =>
                  model.updateLoginButtonActiveStatus(model),
              autofillHints: const [AutofillHints.password],
              obscureText: model.doPasswordInVisible.value,
              controller: model.passwordController.value,
              style: Theme.of(context).primaryTextTheme.bodyMedium,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withAlpha(100),
                  ),
                ),
                labelText: 'What is your password?',
                labelStyle: Theme.of(context).primaryTextTheme.labelMedium,
                prefixIcon: Icon(
                  Icons.password_rounded,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
                suffixIcon: IconButton(
                  iconSize: 20,
                  color: Theme.of(context).primaryIconTheme.color,
                  onPressed: () {
                    model.toggleDoPasswordVisible(model);
                  },
                  icon: model.doPasswordInVisible.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(),
        ),
      ],
    );
  }
}
