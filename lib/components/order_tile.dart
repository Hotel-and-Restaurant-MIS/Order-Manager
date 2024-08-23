import 'package:flutter/material.dart';
import 'package:order_manager/constants/order_status.dart';
import 'package:order_manager/controllers/view/single_order_screen/order_tile_state_controller.dart';
import 'package:order_manager/enum/order_status.dart';

class OrderTile extends StatelessWidget {
  String orderNo;
  OrderStatus orderStatus;
  double orderTotal;
  Function() onTap;

  OrderTile(
      {required this.orderNo,
      required this.orderStatus,
      required this.orderTotal,
      required this.onTap});

  OrderTileStateController _otsc = OrderTileStateController.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10.0)),
          // width: 200.0,
          // height: 80.0,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Text(
                    'Order No. $orderNo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Total : $orderTotal',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              DropdownMenu(
                initialSelection: 'Pending',
                width: 190.0,
                menuHeight: 150.0,
                dropdownMenuEntries:
                    kOrderStatus.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
                onSelected: (String? selectedValue) {
                  _otsc.setOrderStatus(selectedValue!);
                },
                // initialSelection: roomTypeList.first
              ),
              Text('$orderStatus'),
            ],
          ),
        ),
      ),
    );
  }
}
