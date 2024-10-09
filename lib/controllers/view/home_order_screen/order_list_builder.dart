import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:order_manager/components/order_tile.dart';
import 'package:order_manager/controllers/data/order_list_data_controller.dart';
import 'package:order_manager/views/single_order_screen.dart';

class OrderListBuilder extends GetxController {
  static OrderListBuilder instance = Get.find();
  OrderListDataController _oldc = OrderListDataController.instance;

  Widget buildListByStatus({required String status}) {
    return Obx(() {
      List<Widget> children = [];
      if (_oldc.orderDataMap[status] != null) {
        for (var order in _oldc.orderDataMap[status]!) {
          children.add(
            OrderTile(
              dateTime: order.dateTime,
              orderNo: order.orderId!,
              orderStatus: order.orderStatus,
              tableNo: order.tableId,
              onTap: () {
                Get.to(() => SingleOrderScreen(
                  orderItemList: order.orderItemList,
                  orderTotal: order.orderTotal,
                ));
              },
            ),
          );
        }
      }
      return CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(15.0),
            sliver: SliverList.list(
              children: children,
            ),
          ),
        ],
      );
    });
  }
}
