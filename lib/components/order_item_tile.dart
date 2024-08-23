import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:order_manager/constants/colours.dart';
import 'package:order_manager/models/order_item.dart';
import 'package:order_manager/constants/text_constants.dart';

import '../constants/text_constants.dart';

import 'package:get/get.dart';

class OrderItemTile extends StatelessWidget {
  final OrderItem orderItem;
  const OrderItemTile({
    required this.orderItem,
  });



  /// To hide edit/remove btns in pending mode

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 10.0,
        top: 30.0,
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: kBackgroundColour.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 400.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage:
                        CachedNetworkImageProvider(orderItem.menuItem.imageUrl),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        orderItem.menuItem.name,
                        style: TextConstants.kSubTextStyle(
                            fontSize: 23.0, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'LKR ${orderItem.menuItem.price.toStringAsFixed(2)}',
                        style: TextConstants.kSubTextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 19.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 40.0,
              child: Text(
                orderItem.quantity.toString(),
                style: TextConstants.kSubTextStyle(fontSize: 25.0),
              ),
            ),
            SizedBox(
              width: 50.0,
            ),
            Container(
              width: 130.0,
              child: Text(
                '${orderItem.totalPrice.toStringAsFixed(2)}',
                style: TextConstants.kSubTextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
