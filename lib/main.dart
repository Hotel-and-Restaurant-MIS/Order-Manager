import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_manager/veiws/orders.dart';

void main() async {
  runApp(order_manager());
}

class order_manager extends StatelessWidget {
  const order_manager({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:ThemeData.dark(),
      home: Orders(),
    );
  }
}
