import 'package:flutter/material.dart';
import 'package:task_management_flutter/util/Assets.dart';

import '../content/forgot_password.dart';
import '../content/login_account_type.dart';
import '../content/login_button.dart';
import '../content/password.dart';
import '../content/username.dart';
import '../model/login_model.dart';

class Login extends StatelessWidget {
  final LoginModel model;

  const Login({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            alignment: Alignment.center,
            constraints: constraints,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.starryNightSky),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Flexible>[
                Flexible(flex: 5, child: Container()),
                Flexible(
                    flex: 3,
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Flexible>[
                        Flexible(flex: 2, child: Container()),
                        Flexible(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(6, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(child: titleMessage(context)),
                                Expanded(
                                  child: LoginAccountType(model: model),
                                ),
                                getColumnDivider(context),
                                Expanded(child: Username(model: model)),
                                getColumnDivider(context),
                                Expanded(child: Password(model: model)),
                                getColumnDivider(context),
                                Expanded(child: ForgotPassword(model: model)),
                                Expanded(child: LoginButton(model: model)),
                                getColumnDivider(context),
                              ],
                            ),
                          ),
                        ),
                        Flexible(flex: 2, child: Container())
                      ],
                    )),
                Flexible(flex: 5, child: Container()),
              ],
            ),
          );
        },
      ),
    );
  }

  Container getColumnDivider(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.001,
    );
  }

  Widget titleMessage(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Text(
            'Login to your account and start the adventure',
            style: Theme.of(context).primaryTextTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
