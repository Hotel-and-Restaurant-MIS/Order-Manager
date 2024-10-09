import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_manager/components/order_item_tile.dart';
import 'package:order_manager/constants/colours.dart';
import 'package:order_manager/constants/text_constants.dart';
import 'package:order_manager/models/order.dart';
import 'package:order_manager/models/order_item.dart';

class SingleOrderScreen extends StatelessWidget {
  final List<OrderItem>? orderItemList;
  final double? orderTotal;

  SingleOrderScreen({this.orderItemList, this.orderTotal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColour.withOpacity(0.7),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            double deviceWidth = MediaQuery.of(context).size.width;
            double deviceHeight = MediaQuery.of(context).size.height;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        width: orientation == Orientation.portrait
                            ? deviceWidth * 0.35
                            : deviceWidth * 0.4,
                      ),
                      Text(
                        'My Orders',
                        style: TextStyle(
                          fontFamily: 'Barlow',
                          fontSize: 35.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: deviceWidth * 0.23),
                      Text(
                        'Item',
                        style: TextConstants.kSubTextStyle(fontSize: 23.0),
                      ),
                      SizedBox(width: deviceWidth * 0.27),
                      Text(
                        'Qty',
                        style: TextConstants.kSubTextStyle(
                          fontSize: 23.0,
                        ),
                      ),
                      SizedBox(
                        width: orientation == Orientation.portrait
                            ? deviceWidth * 0.17
                            : deviceWidth * 0.2,
                      ),
                      Center(
                        child: Text(
                          'Price\nLKR',
                          style: TextConstants.kSubTextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1.0,
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.5)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: orderItemList!
                        .map(
                          (item) => OrderItemTile(orderItem: item),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: orientation == Orientation.portrait
                            ? deviceWidth * 0.07
                            : deviceWidth * 0.08,
                      ),
                      Text(
                        'Order total :',
                        style: TextConstants.kSubTextStyle(
                          fontSize: 32.0,
                        ),
                      ),
                      SizedBox(
                          width: orientation == Orientation.portrait
                              ? deviceWidth * 0.4
                              : deviceWidth * 0.65),
                      Text(
                        'LKR  $orderTotal',
                        //TODO: calculate total

                        style: TextConstants.kSubTextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
