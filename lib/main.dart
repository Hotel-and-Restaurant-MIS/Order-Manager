import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:order_manager/views/loading_screen.dart';

void main() async {
  runApp(order_manager());
}

class order_manager extends StatelessWidget {
  const order_manager({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(),
      home: Loadingscreen(),
    );
  }
}

