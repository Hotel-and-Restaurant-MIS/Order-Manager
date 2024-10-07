import 'package:flutter/material.dart';
import 'package:order_manager/constants/colours.dart';
import 'package:order_manager/constants/order_status.dart';
import 'package:order_manager/controllers/data/order_list_data_controller.dart';
import 'package:order_manager/controllers/view/single_order_screen/order_tile_state_controller.dart';
import 'package:order_manager/enum/order_status.dart';

class OrderTile extends StatelessWidget {
  int orderNo;
  OrderStatus orderStatus;
  int tableNo;
  Function() onTap;

  OrderTile(
      {required this.orderNo,
      required this.orderStatus,
      required this.tableNo,
      required this.onTap});

  OrderListDataController _oldc = OrderListDataController.instance;
  @override
  Widget build(BuildContext context) {
    String buttonName;
    String newOrderStatus = '';
    switch (orderStatus) {
      case OrderStatus.Pending:
        buttonName = 'Start Preparing';
        newOrderStatus = OrderStatus.Preparing.name;
        break;
      case OrderStatus.Preparing:
        buttonName = 'Complete';
        newOrderStatus = OrderStatus.Completed.name;
        break;
      case OrderStatus.Completed:
        buttonName = 'Paid';
        newOrderStatus = OrderStatus.Paid.name;
        break;
      default:
        buttonName = '';
        break;
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: OrientationBuilder(builder: (context, orientation) {
        double deviceWidth = MediaQuery.of(context).size.width;
        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: kBackgroundColour.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.0)),
            // width: 200.0,
            // height: 80.0,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order No. $orderNo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Table No : $tableNo',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await _oldc.updateStatus(orderNo, newOrderStatus,orderStatus.name);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kButtonColour,
                      border: Border.all(width: 1.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    width: 150.0,
                    height: 40.0,
                    child: Center(
                      child: Text(
                        buttonName,
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
