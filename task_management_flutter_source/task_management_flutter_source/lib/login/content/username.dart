import 'package:flutter/material.dart';

import '../model/login_model.dart';

class Username extends StatelessWidget {
  final LoginModel model;

  const Username({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Flexible(
          child: Container(),
        ),
        Flexible(
          flex: 8,
          child: TextField(
            onChanged: (String value) {
              model.updateLoginButtonActiveStatus(model);
            },
            autofillHints: const [AutofillHints.username],
            controller: model.usernameController.value,
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
              labelText: 'What is your username or email?',
              labelStyle: Theme.of(context).primaryTextTheme.labelMedium,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryIconTheme.color,
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
