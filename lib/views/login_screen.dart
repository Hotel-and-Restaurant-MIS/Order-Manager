import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_manager/constants/colours.dart';
import 'package:order_manager/constants/text_constants.dart';
import 'package:order_manager/controllers/data/login_data_controller.dart';
import 'package:order_manager/controllers/view/login_screen/login_state_controller.dart';
import 'package:order_manager/views/home_order_screen.dart';

class WelcomeScreen extends StatelessWidget {
  LoginStateController _lsc = LoginStateController.instance;
  LoginDataController _ldc = LoginDataController.instance;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColour.withOpacity(0.4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 200.0,
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Order Manager',
                          textStyle: TextConstants.kMainTextStyle(
                            textColour: Colors.white,
                            fontSize: 45.0,
                          ),
                          speed: const Duration(milliseconds: 150),
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Image(
                image: AssetImage('images/OrderMangerImage.png'),
                height: 400.0,
                width: 400.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 100.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 55.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: TextConstants.kSubTextStyle(fontSize: 20.0),
                      ),
                      controller: userNameController,
                      onChanged: (value) {
                        _lsc.setUserName(value);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 55.0,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextConstants.kSubTextStyle(fontSize: 20.0),
                      ),
                      controller: passwordController,
                      onChanged: (value) {
                        _lsc.setPassword(value);
                      },
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !_ldc.isValidUser && _lsc.isSubmitted.value,
                  child: Text(
                    'Incorrect Password!',
                    style: TextConstants.kSubTextStyle(
                      textColour: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              Center(
                child: Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: kButtonColour,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3.0,
                        blurRadius: 5.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      await _lsc.checkUser();
                      _ldc.isValidUser
                          ? Get.to(() => HomeOrderScreen())
                          : {
                              userNameController.clear(),
                              passwordController.clear(),
                            };
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'View Orders',
                          style: TextConstants.kSubTextStyle(
                            fontSize: 23,
                            textColour: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
