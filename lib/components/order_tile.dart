import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:order_manager/components/loading_dialog.dart';
import 'package:order_manager/constants/colours.dart';
import 'package:order_manager/constants/order_status.dart';
import 'package:order_manager/controllers/data/order_list_data_controller.dart';
import 'package:order_manager/controllers/view/single_order_screen/order_tile_state_controller.dart';
import 'package:order_manager/enum/order_status.dart';

class OrderTile extends StatelessWidget {
  int orderNo;
  Rx<OrderStatus> orderStatus;
  int tableNo;
  DateTime dateTime;
  Function() onTap;

  OrderTile(
      {required this.orderNo,
      required this.dateTime,
      required this.orderStatus,
      required this.tableNo,
      required this.onTap});

  OrderListDataController _oldc = OrderListDataController.instance;
  @override
  Widget build(BuildContext context) {
    String buttonName;
    String newOrderStatus = '';
    bool isPaidOrder = false;
    bool isCompletedOrder = false;
    switch (orderStatus.value) {
      case OrderStatus.Pending:
        buttonName = 'Prepare';
        newOrderStatus = OrderStatus.Preparing.name;
        break;
      case OrderStatus.Preparing:
        buttonName = 'Serve';
        newOrderStatus = OrderStatus.Completed.name;
        break;
      case OrderStatus.Completed:
        buttonName = 'Complete Payment';
        newOrderStatus = OrderStatus.Paid.name;
        isCompletedOrder = true;
        break;
      case OrderStatus.Paid:
        isPaidOrder = true;
        buttonName = '';
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
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            padding: EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 40.0, right: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order No: $orderNo',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Table No : $tableNo',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${DateFormat('HH:mm').format(dateTime)}',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                Visibility(
                  visible: !isPaidOrder &&  !isCompletedOrder,
                  child: GestureDetector(
                    onTap: () async {
                      LoadingDialog(
                        callerFunction: () async {
                          await _oldc.updateStatus(
                              tableNo: tableNo,
                              orderId: orderNo,
                              newStatus: newOrderStatus,
                              oldStatus: orderStatus.value.name);
                        },
                        onErrorCallBack: (e) {
                          print('error in changing status of the order');
                          print(e.toString());
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: kButtonColour,
                        border: Border.all(
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: 45.0,
                      child: Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Text(
                            buttonName,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
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
