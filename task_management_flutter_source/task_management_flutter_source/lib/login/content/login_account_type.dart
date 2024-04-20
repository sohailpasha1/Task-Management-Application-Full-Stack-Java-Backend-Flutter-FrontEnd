import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../model/login_model.dart';

class LoginAccountType extends StatelessWidget {
  final LoginModel model;

  const LoginAccountType({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Flexible(
          child: Text(
            'Sign In With',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white),
          ),
        ),
        Obx(
          () => Flex(
            direction: Axis.horizontal,
            textBaseline: TextBaseline.ideographic,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(() {
                if ((model.isPressedGoogleButton.value || model.isPressedFacebookButton.value)&&
                    !model.isTokenLoaded.value) {
                  return Stack(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.013,
                        height: MediaQuery.of(context).size.width * 0.013,
                        child: const CircularProgressIndicator(),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
              Flexible(
                child: TextButton(
                  onHover: (bool value) =>
                      model.isHoveringGoogleButtonFunction(model, value),
                  style: TextButton.styleFrom(
                    backgroundColor: model.isPressedGoogleButton.value ||
                            model.isHoveringGoogleButton.value
                        ? Colors.blue
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(
                          getBottomGoogleRadius(),
                        ),
                        top: Radius.circular(
                          getTopGoogleRadius(),
                        ),
                      ),
                      side: BorderSide(
                        color: model.isHoveringGoogleButton.value
                            ? Colors.cyanAccent
                            : Colors.black,
                      ),
                    ),
                  ),
                  onPressed: () {
                    model.toggleAccountTypeGoogle(model);
                  },
                  child: Text(
                    'Google',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Flexible(child: Container()),
              Flexible(
                child: TextButton(
                  onHover: (bool value) =>
                      model.isHoveringFacebookButtonFunction(model, value),
                  style: TextButton.styleFrom(
                    backgroundColor: model.isHoveringFacebookButton.value ||
                            model.isPressedFacebookButton.value
                        ? Colors.blue
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(
                          getBottomFacebookRadius(),
                        ),
                        top: Radius.circular(
                          getTopFacebookRadius(),
                        ),
                      ),
                      side: BorderSide(
                        color: model.isHoveringFacebookButton.value
                            ? Colors.cyanAccent
                            : Colors.black,
                      ),
                    ),
                  ),
                  onPressed: () {
                    model.toggleAccountTypeFacebook(model);
                  },
                  child: Text(
                    'Facebook',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
            // ),
          ),
        ),
      ],
    );
  }

  double getBottomGoogleRadius() {
    if (model.isHoveringGoogleButton.value ||
        model.isPressedGoogleButton.value) {
      return 0;
    }
    return 50;
  }

  double getTopGoogleRadius() {
    if (model.isPressedGoogleButton.value) {
      return 50;
    } else if (model.isHoveringGoogleButton.value) {
      return 50;
    }
    return 0;
  }

  double getBottomFacebookRadius() {
    if (model.isHoveringFacebookButton.value ||
        model.isPressedFacebookButton.value) {
      return 0;
    }
    return 50;
  }

  double getTopFacebookRadius() {
    if (model.isPressedFacebookButton.value) {
      return 50;
    } else if (model.isHoveringFacebookButton.value) {
      return 50;
    }
    return 0;
  }
}
