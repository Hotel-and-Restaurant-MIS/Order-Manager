import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_manager/constants/text_constants.dart';

import '../constants.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 15.0,),
          child: Column(
            children: <Widget>[
              Text(
                'Orders',
                style: TextConstants.kMainTextStyle(fontSize: 30.0),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Table',style: TextConstants.kSubTextStyle(),),
                  Text('Order',style: TextConstants.kSubTextStyle(),),
                  Text('Total Payment',style: TextConstants.kSubTextStyle(),),
                  Text('Status',style: TextConstants.kSubTextStyle(),),
                ],
              ),
              SizedBox(height: 10.0),
              Container(height: 1.0,decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),)
            ],
          ),
        ),
      ),
    );
  }
}
