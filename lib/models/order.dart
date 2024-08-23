import 'package:order_manager/enum/order_status.dart';
import 'package:order_manager/models/order_item.dart';

class Order {
  final List<OrderItem> orderItemList;
  final OrderStatus orderStatus;
  final double orderTotal;
  final String orderId;
  final int tableId;

  Order(
      {required this.orderId,
      required this.orderItemList,
      required this.orderStatus,
      required this.orderTotal,
      required this.tableId});

  set orderItemList(value) => orderItemList = value;

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderTotal: map['orderTotal'],
      orderStatus: map['orderStatus'],
      orderId: map['orderId'],
      orderItemList: map['orderItemList'],
      tableId: map['tableId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderTotal': orderTotal,
      'orderStatus': orderStatus,
      'orderId': orderId,
      'tableId': tableId,
      'orderItemList': orderItemList,
    };
  }
}
