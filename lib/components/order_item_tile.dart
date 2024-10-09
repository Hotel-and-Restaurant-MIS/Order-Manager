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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        top: 30.0,
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: kBackgroundColour.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0,top: 15.0,bottom: 8.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    width: 400.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: CachedNetworkImageProvider(
                              orderItem.menuItem.imageUrl),
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
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                            ),

                            Text(
                              'LKR ${orderItem.menuItem.price.toStringAsFixed(2)}',
                              style: TextConstants.kSubTextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 21.0,
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
                      style: TextConstants.kSubTextStyle(fontSize: 28.0),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
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
              SizedBox(
                height: 30.0,
              ),
              Visibility(
                visible: orderItem.selectedAddonList.length != 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      child: Text(
                        'Addons',
                        style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      ': ${orderItem.selectedAddonList.join(' , ')}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Visibility(
                visible: orderItem.specialNote != null,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 130.0,
                        child: Text(
                          'Special Note',
                          style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                    Text(
                      ': ${orderItem.specialNote}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
