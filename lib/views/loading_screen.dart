import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:order_manager/constants/text_constants.dart';
import 'package:order_manager/controller_initializer.dart';
import 'package:order_manager/views/home_order_screen.dart';
import 'package:order_manager/views/login_screen.dart';

class Loadingscreen extends StatelessWidget {
  Future<String> initController() async {
    try {
      if (!ControllerInitializer.isInitialized) {
        await ControllerInitializer.initAllControllers();
      }
      return 'Init All Controllers.';
    } catch (e) {
      print("Error occurs Loading controllers.");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initController(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LoginScreen();
        } else if (snapshot.hasError) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  'An Unexpected error occurs.',
                  style: TextConstants.kMainTextStyle(textColour: Colors.red),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
